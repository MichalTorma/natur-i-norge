# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% DL
dl_lec = LEC(
    _id='DL',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=2,
    spatialScale=5,
)
dl_lec_info_en = LECInfo(
    language_id='en',
    lec=dl_lec,
    name='Depth-related light attenuation',
    description='Reduction of radiation intensity with water depth due to diffusion by light-absorbing particles and water molecule;. the rate of light attenuation depends on wavelength and the the compensation depth, below which respiration exceeds production and photosynthesising organisms cannot maintain stable populations, therefore varies strongly among water bodies',
)
dl_lec_info_nb = LECInfo(
    language_id='nb',
    lec=dl_lec,
    name='Dybderelatert lyssvekking',
    description='Dybderelatert lyssvekking er en av de viktigste LKM, både i saltvannssystemer og i ferskvannssystemer. Lyssvekking skyldes dels at vannet inneholder partikler (også organismer) som absorberer lys, dels at vannmolekylene og partikler i vannet sprer lyset. Den økologisk viktigste grenselinja langs dybderelatert lyssvekking i vann (DL) er kompensasjonsdypet (mellom trinn DL∙d og ∙e). Over kompensasjonsdypet er planteproduksjonen større enn nedbrytningen (respirasjonen) og fotosyntetiserende planter kan opprettholde rimelig stabile populasjoner over lang tid. Fordi lys av ulike bølgelengder svekkes med ulik hastighet mot dypet, gjenspeiler planteartenes dybdefordeling deres innhold av ulike pigmenter (og deres evne til å absorbere av lys med ulike bølgelengder).',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='DL.0',
    lec=dl_lec,
    value='0',
    order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='the tidal belt'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='in periods exposed to direct light'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='The Marine Life Information Network',
    value='eulitoral'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='Depth',
    value='-'
)

ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='tidevannsbeltet'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='i perioder eksponert for direkte lys'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='The Marine Life Information Network',
    value='eulitoral'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='Dybde',
    value='-'
)

# a
a_elem_segment=ElementarySegment(
    _id='DL.a',
    lec=dl_lec,
    value='a',
    order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='seafront belt'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='around and just below lower astronomical spring targets, light not production limiting'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='The Marine Life Information Network',
    value='sublitoral fringe'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='Depth',
    value='0-3m'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='sjøkant-beltet'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='omkring og like under nedre astronomiske fjæremål, lys ikke produksjonsbegrensende '
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='The Marine Life Information Network',
    value='sublitoral fringe'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='Dybde',
    value='0-3m'
)

# b
b_elem_segment=ElementarySegment(
    _id='DL.b',
    lec=dl_lec,
    value='b',
    order=3
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='vascular plant and kelp forest belt'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='production of organic matter greater than decomposition (respiration); the light also contains long-wave red rays that are absorbed in relatively shallow water; long-wave light occurs in such large quantities that even vascular plants can live upper infralitoral'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='The Marine Life Information Network',
    value='upper infralitoral'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='Depth',
    value='3-8m'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='karplante- og tareskogsbeltet'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='produksjon av organisk materiale større enn nedbrytningen (respirasjonen); lyset inneholder også langbølgete røde stråler som absorberes på relativt grunt vann; langbølget lys forekommer i så store mengder at også karplanter kan leve'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='The Marine Life Information Network',
    value='upper infralitoral'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='Dybde',
    value='3-8m'
)

# c
c_elem_segment=ElementarySegment(
    _id='DL.c',
    lec=dl_lec,
    value='c',
    order=4
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='the kelp forest belt'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<description>',
    value='production still greater than decomposition, but long-wave radiation is limited; brown and green algae (in freshwater also bogs) can still dominate'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='The Marine Life Information Network',
    value='lower infralitoral'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='Depth',
    value='8-13m'
)

ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<class>',
    value='tareskogbeltet'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<description>',
    value='produksjon fortsatt større enn nedbrytningen, men langbølget stråling er begrenset; brun- og grønnalger (i ferskvann også moser) kan fortsatt dominere'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='The Marine Life Information Network',
    value='lower infralitoral'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='Depth',
    value='8-13m'
)

# d
d_elem_segment=ElementarySegment(
    _id='DL.d',
    lec=dl_lec,
    value='d',
    order=5
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<class>',
    value='the red algae belt'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<description>',
    value='production still greater than the decomposition, but the light is dominated by short-wave rays (including green) and the algae vegetation is therefore limited to red algae but leaf-shaped red algae can dominate'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='The Marine Life Information Network',
    value='upper circalitoral'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='Depth',
    value='13-30m'
)

ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<class>',
    value='rødalgebeltet'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<description>',
    value='produksjon fortsatt større enn nedbrytningen, men lyset er dominert av kortbølgete stråler (bl.a. grønne) og algevegetasjonen begrenser seg derfor til rødalger men bladformete rødalger kan dominere'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='The Marine Life Information Network',
    value='upper circalitoral'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='Dybde',
    value='13-30m'
)

# e
e_elem_segment=ElementarySegment(
    _id='DL.e',
    lec=dl_lec,
    value='e',
    order=6
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<class>',
    value='upper aphotic belt'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<description>',
    value='production of organic material less than decomposition (respiration), light radiation <0.3–1 (–10)% of the radiation at the water surface; only scattered occurrence of algae'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='The Marine Life Information Network',
    value='lower circalitoral'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='Depth',
    value='30-80m'
)

ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<class>',
    value='upper aphotic belt'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<description>',
    value='produksjon av organisk materiale mindre enn nedbrytningen (respirasjonen), lysinnstråling < 0.3–1(–10) % av strålingen ved vannoverflata; bare spredt forekomst av alger'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='The Marine Life Information Network',
    value='lower circalitoral'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='Dybde',
    value='30-80m'
)

# plus
plus_elem_segment=ElementarySegment(
    _id='DL.+',
    lec=dl_lec,
    value='+',
    order=6
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='<class>',
    value='lower aphotic belts'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='<description>',
    value='the light attenuation is so strong that plants are missing [‘depth gradient’ continues as DM]'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='The Marine Life Information Network',
    value='offshore circalitoral'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='Depth',
    value='>80m'
)

ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='<class>',
    value='nedre afotiske belter'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='<description>',
    value='lyssvekkingen er så sterk at planter mangler [‘dybdegradienten’ fortsetter som DM]'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='The Marine Life Information Network',
    value='offshore circalitoral'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='Dybde',
    value='>80m'
)
