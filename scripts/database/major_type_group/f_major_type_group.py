# %%
from model.model import MajorTypeGroup
from model.model import MajorTypeGroupInfo

# %% F
f_major_type_group = MajorTypeGroup(
    _id='F',
)
f_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=f_major_type_group,
    language_id='en',
    name='Limnic waterbody systems',
    description='Limnic waterbody systems comprise freshwater masses regardless of origin and properties such as standing or running, natural, man-made or highly modified (e.g., artificially created ponds, reservoirs etc.).'
)
f_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=f_major_type_group,
    language_id='nb',
    name='Limniske vannmasser (vannmassesystemer i ferskvann)',
    description='Limniske vannmasser omfatter økosystemer av flytende, svevende og svømmende organismer i de frie vannmassene i elver og innsjøer.'
)
