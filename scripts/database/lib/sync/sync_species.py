# %% 
import requests
import pandas as pd

base_url = 'https://traitsapi.artsdatabanken.no'
species_resp = requests.get(f'{base_url}/api/Species')
# %%
species_json = species_resp.json()
# %%
def getNatureTypes(specie):
    scientificNameId = specie['scientificNameId']
    nature_types_json = requests.get(f'{base_url}/byScientificNameId/{scientificNameId}').json()
    nature_types_json.keys()
    return nature_types_json['speciesNaturetypeResource'] 

# %%
specie = species_json[0]
list_of_nature_types = getNatureTypes(specie)

# %%
nature_type = list_of_nature_types[0]
# %%
types_str = nature_type['naturetypeResource']['ninCode']
# %%
types_str.replace('UT','UF').replace('-','.').replace(' ','').split(',')
# %%
