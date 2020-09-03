# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% KY
ky_lec = LEC(
    _id='KY',
    structuringProcess_id='S',
    patternOfVariation_id='t',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=10,
)
ky_lec_info_en = LECInfo(
    language_id='en',
    lec=ky_lec,
    name='Coastal water character',
    description='Variation in the degree to which marine water bodies have properties of coastal vs oceanic water masses; characteristics of the former are: more strongly fluctuating temperature and salinity throughout the year and larger supplies of river-transported sediments, organic material and nutrients',
)
ky_lec_info_nb = LECInfo(
    language_id='nb',
    lec=ky_lec,
    name='Kysttilknytning',
    description='Kystvann (og grunt fjordvann) skiller seg fra havvannmassene som levested for vannmassetilknyttete (pelagiale) organismer med hensyn til miljøstabilitet og variasjonsmønster, lokalt og over tid, for en lang rekke viktige miljøvariabler. Kystvannet har en større temperaturvariasjon gjennom året, som følger en noe annen årstidsrytme, enn havvannet. Mens havvannets salinitet varierer lite (i området 34,2–35,5 ‰), er det betydelig variasjon i kystvannets salinitet, på lokal/regional skala (som følge av variasjon i ferskvannstilførsler fra store elver). Variasjonen i tilførsler av sedimenter, løst og partikulært organisk materiale, næringsstoffer (N, P) etc. følger samme mønstre. Dette gir opphav til variasjon i artssammensetningen langs en gradient fra havtilknyttete (oseaniske) til kysttilknyttete (nerittiske) arter.',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='KY.0',
    lec=ky_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='sea-connected'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='oceanic; which has its main residence in the seawater masses'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='havtilknyttet'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='oseanisk; som har hovedoppholdssted i havvannmassene'
)
# a
a_elem_segment=ElementarySegment(
    _id='KY.a',
    lec=ky_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='coastal'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='neritic; which has its main residence in the coastal bodies of water'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='kysttilknyttet'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='nerittisk; som har hovedoppholdssted i kystvannmassene'
)
