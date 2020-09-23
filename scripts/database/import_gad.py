# %%
import requests
import pandas as pd
import model.model as model
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

db_path = 'db/v005.db'
major_type = 'T-4'
# %%

url = "https://traitsapi.artsdatabanken.no/api/Species"

payload = {}
headers= {}

species_response = requests.request("GET", url, headers=headers, data = payload)

species = species_response.json()
local_data = pd.read_excel('tables/GAD3v2.xlsm', sheet_name='GADml3', header=1)
local_data['Art'] = local_data['Art'].apply(lambda x: x.replace(' ssp.', '').strip())

def get_local(specie):
    latin_name = specie['scientificName']
    local_specie = local_data[local_data['Art'] == latin_name]
    norwegian_name = specie['vernacularName']
    if len(local_specie) != 1:
        local_specie = local_data[local_data['NorskNavn'] == norwegian_name]
        if len(local_specie) != 1:
            print(latin_name)
        print(f'{latin_name} - {local_specie.Art}')
    return local_specie

def get_traits_api(specie):
    url = f'https://traitsapi.artsdatabanken.no/byScientificNameId/{specie["scientificNameId"]}'

    response = requests.request("GET", url, headers=headers, data = payload)
    return response.json()

# get_traits_api(species[0])

engine = create_engine(f'sqlite:///{db_path}')
Session = sessionmaker(bind=engine)
session = Session()

# %%
session.query(model.GadValue).delete()
session.query(model.Species).delete()
session.query(model.GadValueElementarySegmentGroup).delete()
session.commit()
# %%
def insert_specie_gad(specie):
    local = get_local(specie)
    traits_api = get_traits_api(specie)['speciesNaturetypeResource']
    session.add(
        model.Species(
            scientificNameId = specie['scientificNameId'],
            scientificName = specie['scientificName'],
            author = specie['author'],
            vernacularName = specie['vernacularName']
        )
    )
    session.commit()
    for trait in traits_api:
        value = trait['speciesPerformance']
        elementary_segments = trait['naturetypeResource']['ninCode'].replace(' ','').replace('UT','UF').replace('-','.').split(',')
        elementary_segments.append('KI.0a')
        gad_value_id = f'{specie["scientificNameId"]}-{major_type}-{"/".join(elementary_segments)}'
        session.add(
            model.GadValue(
                _id = gad_value_id,
                species_id=specie["scientificNameId"],
                majorType_id = major_type,
                valueM7Scale_id = value
            )
        )
        session.commit()
        for es in elementary_segments:
            session.add(
                model.GadValueElementarySegmentGroup(
                    gadValue_id=gad_value_id,
                    elementarySegmentGroup_id=es
                )
            )
            session.commit()


# %%
for specie in species:
    insert_specie_gad(specie)
# %%
