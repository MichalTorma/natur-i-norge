# %%
from model.model import MajorTypeGroup
from model.model import MajorTypeGroupInfo

# %% M
m_major_type_group = MajorTypeGroup(
    _id='M',
)
m_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=m_major_type_group,
    language_id='en',
    name='Marine seabed systems',
    description='Marine seabed systems comprise all ecosystems in, on or closely associated with the sea-floor in oceans, fjords, coastal lagoons and littoral rock pools. By definition, the salinity of adjoining marine waterbodies is 0.5 ppt or higher, and seabed differs from terrestrial systems by being immersed in water for more than 50\% of the time.'
)
m_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=m_major_type_group,
    language_id='nb',
    name='Saltvannsbunnsystemer (marine bunnsystemer)',
    description='Saltvannsbunnsystemer omfatter økosystemer i saltvann (saltholdighet > 0,5 ‰); det vil si som finnes i, på og nært knyttet til bunnen i havet, fjorder, poller og litoralbasseng.'
)