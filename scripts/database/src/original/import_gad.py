# %%
import requests
import pandas as pd
import model.model as model
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

db_path = '/Users/amarok/src/natur-i-norge/naturinorge_guide/assets/nin_database.db'
major_type = 'T-4'

# Get local data
local_data = pd.read_excel('tables/GAD3v2.xlsm', sheet_name='GADml3', header=1)
local_data['Art'] = local_data['Art'].apply(
    lambda x: x.replace(' ssp.', '').replace(' spp.','').strip())
local_data.columns = local_data.columns.map(str)

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
session.query(model.GadValue).delete()
session.query(model.Species).delete()
# session.query(model.ElementarySegmentGroupCombination).delete()
session.query(model.GadModifier).delete()
session.commit()
# %% Get Species from API
url = "https://traitsapi.artsdatabanken.no/api/Species"

payload = {}
headers = {}

species_response = requests.request("GET", url, headers=headers, data=payload)

species = species_response.json()
#%% Add species to db
for specie in species:
    session.merge(
        model.Species(
            scientificNameId=specie['scientificNameId'],
            scientificName=specie['scientificName'],
            author=specie['author'],
            vernacularName=specie['vernacularName']
        )
    )
session.commit()

# %% Initialize map
trasposition_map = [
    {'11' : ['KA.ab', 'UF.a', 'KI.0a']},
    {'12' : ['KA.c', 'UF.a', 'KI.0a']},
    {'13' : ['KA.d', 'UF.a', 'KI.0a']},
    {'14' : ['KA.e', 'UF.a', 'KI.0a']},
    {'15' : ['KA.f', 'UF.a', 'KI.0a']},
    {'16' : ['KA.g', 'UF.a', 'KI.0a']},
    {'17' : ['KA.h', 'UF.a', 'KI.0a']},
    {'18' : ['KA.i', 'UF.a', 'KI.0a']},
    {'21' : ['KA.ab', 'UF.b', 'KI.0a']},
    {'22' : ['KA.c', 'UF.b', 'KI.0a']},
    {'23' : ['KA.d', 'UF.b', 'KI.0a']},
    {'24' : ['KA.e', 'UF.b', 'KI.0a']},
    {'25' : ['KA.f', 'UF.b', 'KI.0a']},
    {'26' : ['KA.g', 'UF.b', 'KI.0a']},
    {'27' : ['KA.h', 'UF.b', 'KI.0a']},
    {'28' : ['KA.i', 'UF.b', 'KI.0a']},
    {'31' : ['KA.ab', 'UF.c', 'KI.0a']},
    {'32' : ['KA.c', 'UF.c', 'KI.0a']},
    {'33' : ['KA.d', 'UF.c', 'KI.0a']},
    {'34' : ['KA.e', 'UF.c', 'KI.0a']},
    {'35' : ['KA.f', 'UF.c', 'KI.0a']},
    {'36' : ['KA.g', 'UF.c', 'KI.0a']},
    {'37' : ['KA.h', 'UF.c', 'KI.0a']},
    {'38' : ['KA.i', 'UF.c', 'KI.0a']},
    {'41' : ['KA.ab', 'UF.d', 'KI.0a']},
    {'42' : ['KA.c', 'UF.d', 'KI.0a']},
    {'43' : ['KA.d', 'UF.d', 'KI.0a']},
    {'44' : ['KA.e', 'UF.d', 'KI.0a']},
    {'45' : ['KA.f', 'UF.d', 'KI.0a']},
    {'46' : ['KA.g', 'UF.d', 'KI.0a']},
    {'47' : ['KA.h', 'UF.d', 'KI.0a']},
    {'48' : ['KA.i', 'UF.d', 'KI.0a']},
    {'51' : ['KA.ab', 'UF.e', 'KI.0a']},
    {'52' : ['KA.c', 'UF.e', 'KI.0a']},
    {'53' : ['KA.d', 'UF.e', 'KI.0a']},
    {'54' : ['KA.e', 'UF.e', 'KI.0a']},
    {'55' : ['KA.f', 'UF.e', 'KI.0a']},
    {'56' : ['KA.g', 'UF.e', 'KI.0a']},
    {'57' : ['KA.h', 'UF.e', 'KI.0a']},
    {'58' : ['KA.i', 'UF.e', 'KI.0a']},
    {'61' : ['KA.ab', 'UF.f', 'KI.0a']},
    {'62' : ['KA.c', 'UF.f', 'KI.0a']},
    {'63' : ['KA.d', 'UF.f', 'KI.0a']},
    {'64' : ['KA.e', 'UF.f', 'KI.0a']},
    {'65' : ['KA.f', 'UF.f', 'KI.0a']},
    {'66' : ['KA.g', 'UF.f', 'KI.0a']},
    {'67' : ['KA.h', 'UF.f', 'KI.0a']},
    {'68' : ['KA.i', 'UF.f', 'KI.0a']},
    {'71' : ['KA.ab', 'UF.g', 'KI.0a']},
    {'72' : ['KA.c', 'UF.g', 'KI.0a']},
    {'73' : ['KA.d', 'UF.g', 'KI.0a']},
    {'74' : ['KA.e', 'UF.g', 'KI.0a']},
    {'75' : ['KA.f', 'UF.g', 'KI.0a']},
    {'76' : ['KA.g', 'UF.g', 'KI.0a']},
    {'77' : ['KA.h', 'UF.g', 'KI.0a']},
    {'78' : ['KA.i', 'UF.g', 'KI.0a']},
    {'81' : ['KA.ab', 'UF.h', 'KI.0a']},
    {'82' : ['KA.c', 'UF.h', 'KI.0a']},
    {'83' : ['KA.d', 'UF.h', 'KI.0a']},
    {'84' : ['KA.e', 'UF.h', 'KI.0a']},
    {'85' : ['KA.f', 'UF.h', 'KI.0a']},
    {'86' : ['KA.g', 'UF.h', 'KI.0a']},
    {'87' : ['KA.h', 'UF.h', 'KI.0a']},
    {'88' : ['KA.i', 'UF.h', 'KI.0a']},
    {'K3' : ['KA.d', 'UF.a', 'KI.bc']},
    {'K3' : ['KA.d', 'UF.b', 'KI.bc']},
    {'K4' : ['KA.e', 'UF.a', 'KI.bc']},
    {'K4' : ['KA.e', 'UF.b', 'KI.bc']},
    {'K5' : ['KA.f', 'UF.a', 'KI.bc']},
    {'K5' : ['KA.f', 'UF.b', 'KI.bc']},
    {'K6' : ['KA.g', 'UF.a', 'KI.bc']},
    {'K6' : ['KA.g', 'UF.b', 'KI.bc']},
    {'K7' : ['KA.h', 'UF.a', 'KI.bc']},
    {'K7' : ['KA.h', 'UF.b', 'KI.bc']},
    {'K8' : ['KA.i', 'UF.a', 'KI.bc']},
    {'K8' : ['KA.i', 'UF.b', 'KI.bc']},
    {'V37' : ['KA.h', 'UF.c', 'KI.bc']},
    {'V38' : ['KA.i', 'UF.c', 'KI.bc']},
    {'V47' : ['KA.h', 'UF.d', 'KI.bc']},
    {'V48' : ['KA.i', 'UF.d', 'KI.bc']},
    {'V57' : ['KA.h', 'UF.e', 'KI.bc']},
    {'V58' : ['KA.i', 'UF.e', 'KI.bc']},
    {'V67' : ['KA.h', 'UF.f', 'KI.bc']},
    {'V68' : ['KA.i', 'UF.f', 'KI.bc']},
]

# %% Get local excel file to supplement API data

def insert_gad_value(specie, elementary_segments, m7_value=None):
    combination_id = "/".join(elementary_segments)
    for es in elementary_segments:
        session.merge(
            model.ElementarySegmentCombination(
                _id = combination_id,
                elementarySegmentGroup_id=es
            )
        )

    session.merge(
        model.GadValue(
            elementarySegmentCombination_id=combination_id,
            species_id=specie.scientificNameId,
            majorType_id=major_type,
            valueM7Scale_id=m7_value,
        )
    )



# Add supplemental value from local

def insert_gad(specie):
    local = get_local(specie)
    for item in trasposition_map:
        mp = list(item.items())[0]
        # print(mp)
        key = mp[0]
        es_list = mp[1]
        value = local[str(key)].iloc[0]
        value = int(value)
        # print(value)
        insert_gad_value(
            specie=specie,
            elementary_segments=es_list,
            m7_value=value
        )

    session.commit()
        # print(key, es_list, value)
    return local


# local = add_local_supplement(session.query(model.Species).first())
# %%
all_species = session.query(model.Species).all()
for specie in all_species:
    # print(specie)
    try:
        insert_gad(specie)
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
        # print(value)
        session.merge(
            model.GadModifier(
                lec_id=lec_id,
                majorTypeLEC_id=f'T4-{lec_id}',
                majorType_id='T4',
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
