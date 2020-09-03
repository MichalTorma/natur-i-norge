# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% MX
mx_lec = LEC(
    _id='MX',
    structuringProcess_id='D',
    patternOfVariation_id='f',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=3,
    spatialScale=7,
)
mx_lec_info_en = LECInfo(
    language_id='en',
    lec=mx_lec,
    name='Category of anthropo-geneous disturbance',
    description='Binary variable separating semi-natural ground characterised by moderate anthropogenic disturbance processes but not contingent upon land management, from corresponding natural ground',
)
mx_lec_info_nb = LECInfo(
    language_id='nb',
    lec=mx_lec,
    name='Semi-naturlig mark/bunn uten hevdpreg, preget av moderat menneskebetinget forstyrrelse',
    description='Denne komplekse miljøfaktoren fanger opp alle kjente tilfeller av semi-naturlig endret mark/bunn, som er resultatet av menneskebetingete forstyrrelsesprosesser, som ikke er betinget av hevd, og med innbyrdes vesentlig forskjellig artssammensetning (se NiN[2] Artikkel 1: kapittel B4 og Vedlegg 5). For beskrivelse av hver enkelt klasse, se de respektive hovedtypene.',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='MX.0',
    lec=mx_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='natural soil / ground'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='natural soil / ground'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='naturlig mark/bunn'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='naturlig mark/bunn'
)
# a
a_elem_segment=ElementarySegment(
    _id='MX.a',
    lec=mx_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='boreal moor'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='solid forest land that has been deforested and kept open for a long enough time that the forest land ecosystem processes no longer apply'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='boreal hei'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='fastmarksskogsmark som er avskoget og holdt åpen i lang nok tid til at skogsmarkas økosystemprosesser ikke lenger gjør seg gjeldende'
)
