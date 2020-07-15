# %%
from database_fill.language_data import en_language, nb_language
from model import MajorTypeGroup
from model import MajorTypeGroupInfo

# %% M
m_major_type_group = MajorTypeGroup(
    _id='M',
)
m_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=m_major_type_group,
    language=en_language,
    name='Marine seabed systems',
    description='Marine seabed systems comprise all ecosystems in, on or closely associated with the sea-floor in oceans, fjords, coastal lagoons and littoral rock pools. By definition, the salinity of adjoining marine waterbodies is 0.5 ppt or higher, and seabed differs from terrestrial systems by being immersed in water for more than 50\% of the time.'
)
m_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=m_major_type_group,
    language=nb_language,
    name='Saltvannsbunnsystemer (marine bunnsystemer)',
    description='Saltvannsbunnsystemer omfatter økosystemer i saltvann (saltholdighet > 0,5 ‰); det vil si som finnes i, på og nært knyttet til bunnen i havet, fjorder, poller og litoralbasseng.'
)

# %% L
l_major_type_group = MajorTypeGroup(
    _id='L',
)
l_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=l_major_type_group,
    language=en_language,
    name='Freshwater-bed systems',
    description='Freshwater-bed, or limnic-bed, ecosystems consist of all ecosystems in, on or closely associated with the bottom of rivers, lakes and ponds. The salinity of the adjoining water is 0.5 ppt or less and the bottom is covered with water more than 50 % of the time.'
)
l_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=l_major_type_group,
    language=nb_language,
    name='Ferskvannsbunnsystemer (limniske bunnsystemer)',
    description='Ferskvannsbunnsystemer omfatter økosystemer i ferskvann; det vil si som finnes i, på og nært knyttet til bunnen i elver og innsjøer.'
)

# %% T
t_major_type_group = MajorTypeGroup(
    _id='T',
)
t_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=t_major_type_group,
    language=en_language,
    name='Terrestrial systems',
    description='Terrestrial ecosystems comprise ecosystems on land that are not permanently waterlogged.'
)
t_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=t_major_type_group,
    language=nb_language,
    name='Fastmarkssystemer',
    description='Fastmarkssystemer omfatter økosystemer på land med mark som ikke er mer eller mindre permanent vannmettet. Størstedelen av landøkosystemene tilhører fastmarkssystemene.'
)

# %% V
v_major_type_group = MajorTypeGroup(
    _id='V',
)
v_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=v_major_type_group,
    language=en_language,
    name='Wetland systems',
    description='Wetland systems, as defined in NiN, contain permanently waterlogged ecosystems on land, e.g., fens, bogs, mire and swamp forests and springs, which are not immersed in water for more than 50% of the time.'
)
v_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=v_major_type_group,
    language=nb_language,
    name='Våtmarkssystemer',
    description='Våtmarkssystemer (V) omfatter myrer og kilder og andre økosystemer på mer eller mindre permanent vannmettet mark.'
)

# %% H
h_major_type_group = MajorTypeGroup(
    _id='H',
)
h_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=h_major_type_group,
    language=en_language,
    name='Marine waterbody systems',
    description='Marine waterbody systems comprise all waterbodies with salinity of 0.5 ppt or higher regardless of depth, also including enclosed coastal waterbodies.'
)
h_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=h_major_type_group,
    language=nb_language,
    name='Marine vannmasser (vannmassesystemer i saltvann)',
    description='Våtmarkssystemer (V) omfatter myrer og kilder og andre økosystemer på mer eller mindre permanent vannmettet mark.'
)

# %% F
f_major_type_group = MajorTypeGroup(
    _id='F',
)
f_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=f_major_type_group,
    language=en_language,
    name='Limnic waterbody systems',
    description='Limnic waterbody systems comprise freshwater masses regardless of origin and properties such as standing or running, natural, man-made or highly modified (e.g., artificially created ponds, reservoirs etc.).'
)
f_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=f_major_type_group,
    language=nb_language,
    name='Limniske vannmasser (vannmassesystemer i ferskvann)',
    description='Limniske vannmasser omfatter økosystemer av flytende, svevende og svømmende organismer i de frie vannmassene i elver og innsjøer.'
)

# %% S
s_major_type_group = MajorTypeGroup(
    _id='S',
)
s_major_type_group_en = MajorTypeGroupInfo(
    majorTypeGroup=s_major_type_group,
    language=en_language,
    name='Snow and ice systems',
    description='Snow and ice systems comprise parts of the Earth’s surface (land or sea) that is covered more or less permanently by perennial snow or ice, e.g., glaciers, perennial snow-patches and polar sea-ice.'
)
s_major_type_group_nb = MajorTypeGroupInfo(
    majorTypeGroup=s_major_type_group,
    language=nb_language,
    name='Snø- og issystemer',
    description='Snø- og issystemer omfatter økosystemer i og på varig snø og is, inkludert polarisen.'
)
# %%
