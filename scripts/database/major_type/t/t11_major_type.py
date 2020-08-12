# %%
from model.model import MajorType, MajorTypeInfo

# %% T11
t11_major_type = MajorType(
    _id=11,
    majorTypeGroup_id='T',
)
t11_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t11_major_type,
    name='Hypersaline tidal marsh',
    description='Hypersaline tidal marsh occurs in the upper part of the tidal belt, in sites where evaporation of stagnant sea water causes salt enrichment of topsoils (salt pans). Hypersaline tidal marsh is species poor; single-species communities dominated by Salicornia spp. or other specialised short-lived succulents are common. Vegetation-free patches occur frequently in this major type.',
)
t11_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t11_major_type,
    name='Saltanrikingsmark i fjærebeltet',
    description='''Saltanrikingsmark omfatter arealenheter i fjærebeltet der det tidvis finner sted saltanriking i eller nær markoverflata på grunn av fordampning av stagnerende vann. Saltanrikingsmark finnes først og fremst i svake forsenkninger, og forekommer både i landstrand-beltet (geolitoralbeltet) og i forsenkninger i supralitoralbeltet (saltpanner). Saltanrikingsmark har en svært artsfattig, men karakteristisk vegetasjon dominert av ettårige og kortlevete flerårige sukkulenter og noen få andre særlig salttolerante arter (halofytter). Enartssamfunn og vegetasjonsfrie flekker er vanlig. Moser mangler.'''
)