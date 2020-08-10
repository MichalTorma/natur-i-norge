# %%
from model.model import MajorTypeGroup
from model.model import MajorTypeGroupInfo

# %% V
v_major_type_group = MajorTypeGroup(
    _id='V',
)
v_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=v_major_type_group,
    language_id='en',
    name='Wetland systems',
    description='Wetland systems, as defined in NiN, contain permanently waterlogged ecosystems on land, e.g., fens, bogs, mire and swamp forests and springs, which are not immersed in water for more than 50% of the time.'
)
v_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=v_major_type_group,
    language_id='nb',
    name='Våtmarkssystemer',
    description='Våtmarkssystemer (V) omfatter myrer og kilder og andre økosystemer på mer eller mindre permanent vannmettet mark.'
)