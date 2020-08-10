# %%
from model.model import MajorTypeGroup
from model.model import MajorTypeGroupInfo

# %% H
h_major_type_group = MajorTypeGroup(
    _id='H',
)
h_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=h_major_type_group,
    language_id='en',
    name='Marine waterbody systems',
    description='Marine waterbody systems comprise all waterbodies with salinity of 0.5 ppt or higher regardless of depth, also including enclosed coastal waterbodies.'
)
h_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=h_major_type_group,
    language_id='nb',
    name='Marine vannmasser (vannmassesystemer i saltvann)',
    description='Våtmarkssystemer (V) omfatter myrer og kilder og andre økosystemer på mer eller mindre permanent vannmettet mark.'
)