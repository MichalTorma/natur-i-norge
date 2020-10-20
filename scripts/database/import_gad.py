# %%
import requests
import pandas as pd
import model.model as model
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

db_path = 'db/v006.db'
major_type = 'T-4'

# Get local data
local_data = pd.read_excel('tables/GAD3v2.xlsm', sheet_name='GADml3', header=1)
local_data['Art'] = local_data['Art'].apply(
    lambda x: x.replace(' ssp.', '').replace(' spp.','').strip())

# Establish session
engine = create_engine(f'sqlite:///{db_path}')
Session = sessionmaker(bind=engine)
session = Session()

# Global function for appropriate local row equivalent
def get_local(specie):
    latin_name = specie.scientificName
    local_specie = local_data[local_data['Art'] == latin_name]
    norwegian_name = specie.vernacularName
    if len(local_specie) != 1:
        local_specie = local_data[local_data['NorskNavn'] == norwegian_name]
        if len(local_specie) != 1:
            raise Exception(f' Unable to find: {latin_name}')
        # print(f'{latin_name} - {local_specie.Art}')
    return local_specie
# %% Delete All
# session.query(model.GadValue).delete()
# session.query(model.Species).delete()
# session.query(model.ElementarySegmentGroupCombination).delete()
session.query(model.GadModifier).delete()
session.commit()
# %% Get Species from API
url = "https://traitsapi.artsdatabanken.no/api/Species"

payload = {}
headers = {}

species_response = requests.request("GET", url, headers=headers, data=payload)

species = species_response.json()

# %% Get traits per specie from API
def get_traits_api(specie):
    url = f'https://traitsapi.artsdatabanken.no/byScientificNameId/{specie["scientificNameId"]}'

    response = requests.request("GET", url, headers=headers, data=payload)
    return response.json()


def insert_specie_gad(specie):
    traits_api = get_traits_api(specie)['speciesNaturetypeResource']
    session.add(
        model.Species(
            scientificNameId=specie['scientificNameId'],
            scientificName=specie['scientificName'],
            author=specie['author'],
            vernacularName=specie['vernacularName']
        )
    )
    for trait in traits_api:
        value = trait['speciesPerformance']
        elementary_segments = trait['naturetypeResource']['ninCode'].replace(
            ' ', '').replace('UT', 'UF').replace('-', '.').split(',')
        elementary_segments.append('KI.0a')
        combination_id = "/".join(elementary_segments)
        for es in elementary_segments:
            session.merge(
                model.ElementarySegmentGroupCombination(
                    _id=combination_id,
                    elementarySegmentGroup_id=es
                )
            )
        session.add(
            model.GadValue(
                elementarySegmentGroupCombination_id=combination_id,
                species_id=specie["scientificNameId"],
                majorType_id=major_type,
                valueM7Scale_id=value
            )
        )
        
    session.commit()


for specie in species:
    insert_specie_gad(specie)
# %% Get local excel file to supplement API data

def insert_gad_value(specie, elementary_segments, m7_value=None):
    combination_id = "/".join(elementary_segments)
    for es in elementary_segments:
        session.merge(
            model.ElementarySegmentGroupCombination(
                _id = combination_id,
                elementarySegmentGroup_id=es
            )
        )
    
    session.add(
        model.GadValue(
            elementarySegmentGroupCombination_id=combination_id,
            species_id=specie.scientificNameId,
            majorType_id=major_type,
            valueM7Scale_id=m7_value,
        )
    )

def insert_ki(specie, local):
    insert_gad_value(
        specie=specie,
        elementary_segments=['KA.d', 'UF.a', 'KI.bc'],
        m7_value=local['K3'].values[0]
    )
    insert_gad_value(
        specie=specie,
        elementary_segments=['KA.d', 'UF.b', 'KI.bc'],
        m7_value=local['K3'].values[0]
    )
    insert_gad_value(
        specie=specie,
        elementary_segments=['KA.e', 'UF.a', 'KI.bc'],
        m7_value=local['K4'].values[0]
    )
    insert_gad_value(
        specie=specie,
        elementary_segments=['KA.e', 'UF.b', 'KI.bc'],
        m7_value=local['K4'].values[0]
    )
    insert_gad_value(
        specie=specie,
        elementary_segments=['KA.f', 'UF.a', 'KI.bc'],
        m7_value=local['K5'].values[0]
    )
    insert_gad_value(
        specie=specie,
        elementary_segments=['KA.f', 'UF.b', 'KI.bc'],
        m7_value=local['K5'].values[0]
    )
    insert_gad_value(
        specie=specie,
        elementary_segments=['KA.g', 'UF.a', 'KI.bc'],
        m7_value=local['K6'].values[0]
    )
    insert_gad_value(
        specie=specie,
        elementary_segments=['KA.g', 'UF.b', 'KI.bc'],
        m7_value=local['K6'].values[0]
    )
    insert_gad_value(
        specie=specie,
        elementary_segments=['KA.h', 'UF.a', 'KI.bc'],
        m7_value=local['K7'].values[0]
    )
    insert_gad_value(
        specie=specie,
        elementary_segments=['KA.h', 'UF.b', 'KI.bc'],
        m7_value=local['K7'].values[0]
    )
    insert_gad_value(
        specie=specie,
        elementary_segments=['KA.i', 'UF.a', 'KI.bc'],
        m7_value=local['K8'].values[0]
    )
    insert_gad_value(
        specie=specie,
        elementary_segments=['KA.i', 'UF.b', 'KI.bc'],
        m7_value=local['K8'].values[0]
    )
    # print(local['K8'].values[0])
    session.commit()

# Add supplemental value from local

def add_local_supplement(specie):
    local = get_local(specie)
    insert_ki(specie, local)
    return local


# local = add_local_supplement(session.query(model.Species).first())
# %%
all_species = session.query(model.Species).all()
for specie in all_species:
    # print(specie)
    try:
        add_local_supplement(specie)
    except Exception as e:
        print(f'{specie.scientificName}\n{e}')
# %% Insert supplementary LEC
def insert_modifier(str_value, lec_id, specie_id):
    value = None
    try:
        value = int(str_value)
    except:
        return
    if value != None:
        print(value)
        session.merge(
            model.GadModifier(
                lec_id=lec_id,
                majorTypeLEC_id=f'T4-{lec_id}',
                species_id=specie_id,
                value=value
            )
        )

def insert_modifiers(specie, local):
    col_ids=['VM', 'HI', 'RU', 'SU', 'SS', 'VS', 'UE', 'BK']
    for col_id in col_ids:
        insert_modifier(
            str_value=local[col_id].iloc[0],
            lec_id=col_id,
            
            specie_id=specie.scientificNameId
        )
    session.commit()

def add_local_modifier(specie):
    local = get_local(specie)
    insert_modifiers(specie,local)

# local = add_local_modifier(session.query(model.Species).first())

# %%
all_species = session.query(model.Species).all()
for specie in all_species:
    # print(specie)
    try:
        add_local_modifier(specie)
    except Exception as e:
        print(f'{specie.scientificName}\n{e}')
# %%
