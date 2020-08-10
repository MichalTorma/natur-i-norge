# %%
from model.model import MajorTypeGroup
from model.model import MajorTypeGroupInfo

# %% T
t_major_type_group = MajorTypeGroup(
    _id='T',
)
t_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=t_major_type_group,
    language_id='en',
    name='Terrestrial systems',
    description='Terrestrial ecosystems comprise ecosystems on land that are not permanently waterlogged.'
)
t_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=t_major_type_group,
    language_id='nb',
    name='Fastmarkssystemer',
    description='Fastmarkssystemer omfatter økosystemer på land med mark som ikke er mer eller mindre permanent vannmettet. Størstedelen av landøkosystemene tilhører fastmarkssystemene.'
)