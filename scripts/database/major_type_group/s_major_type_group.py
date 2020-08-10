# %%
from model.model import MajorTypeGroup
from model.model import MajorTypeGroupInfo

# %% S
s_major_type_group = MajorTypeGroup(
    _id='S',
)
s_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=s_major_type_group,
    language_id='en',
    name='Snow and ice systems',
    description='Snow and ice systems comprise parts of the Earth’s surface (land or sea) that is covered more or less permanently by perennial snow or ice, e.g., glaciers, perennial snow-patches and polar sea-ice.'
)
s_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=s_major_type_group,
    language_id='nb',
    name='Snø- og issystemer',
    description='Snø- og issystemer omfatter økosystemer i og på varig snø og is, inkludert polarisen.'
)