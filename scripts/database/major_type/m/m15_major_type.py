# %%
from model.model import MajorType, MajorTypeInfo

# %% M15
m15_major_type = MajorType(
    _id='M15',
    majorTypeGroup_id='M',
)
m15_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m15_major_type,
    name='Strongly altered or artificial marine sediment',
    description='Strongly altered or artificial marine sediment includes soft seabeds that are altered by human intervention as well as new sediments. Sediments that belong to this major type may result, e.g., deposition of sewage sludge and industrial, mining or other wastes, construction of artificial sand beaches and exposure of new sediments by dredging.',
)
m15_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m15_major_type,
    name='Sterkt endret eller ny marin sedimentbunn',
    description='''Sterkt endret eller ny marin sedimentbunn omfatter havbunn som er vesentlig endret ved deponering eller fjerning av masser, f.eks. nyanlagte badestrender, deponier for kjemisk avfall og overskuddsmasser fra gruvedrift. Sterkt endret eller ny marin sedimentbunn dekker vanligvis små arealer og kan gjennomgå rask suksesjon dersom forholdene ligger til rette for at organismer skal etablere seg.'''
)