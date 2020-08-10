# %%
from model.model import MajorTypeGroup
from model.model import MajorTypeGroupInfo

# %% L
l_major_type_group = MajorTypeGroup(
    _id='L',
)
l_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=l_major_type_group,
    language_id='en',
    name='Freshwater-bed systems',
    description='Freshwater-bed, or limnic-bed, ecosystems consist of all ecosystems in, on or closely associated with the bottom of rivers, lakes and ponds. The salinity of the adjoining water is 0.5 ppt or less and the bottom is covered with water more than 50 % of the time.'
)
l_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=l_major_type_group,
    language_id='nb',
    name='Ferskvannsbunnsystemer (limniske bunnsystemer)',
    description='Ferskvannsbunnsystemer omfatter økosystemer i ferskvann; det vil si som finnes i, på og nært knyttet til bunnen i elver og innsjøer.'
)