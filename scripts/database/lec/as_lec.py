# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% AS
as_lec = LEC(
    _id='AS',
    structuringProcess_id='S',
    patternOfVariation_id='t',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=5,
)
as_lec_info_en = LECInfo(
    language_id='en',
    lec=as_lec,
    name='Arid terrestrial salinity',
    description='Variation from \'normal\' ground with predominantly downward water flow and maximal pH (in mineral soil rich in lime) ca. 8.0, to ground with predominantly upward water flow and salt precipitated as a white soil topsoil crust and pH up to 10.5; salt-enriched soils are typical for deserts and steppes but also occur locally in Arctic climates (e.g., at Svalbard) in sites characterised by a combination of extreme rain-shadow effect and dry winds',
)
as_lec_info_nb = LECInfo(
    language_id='nb',
    lec=as_lec,
    name='Arid terrestrisk salinitet',
    description='Variasjonen fra ’normal’ mark med overveiende nedadgående vannstrøm og maksimale pH-verdier (i rein kalkdominert mineraljord) opp til ca. 8,0, til finjordsrik mark med overveiende oppadgående vannstrøm, som fører til saltanriking i øvre jordlag og pH-verdier helt opp i 10,5. Saltanriket mark kan lettest diagnostiseres ved en kombinasjon av synlig hvitt saltlag på overflaten (som vaskes vekk av regn, men snart kommer tilbake). Saltjord er typisk for ørkener, stepper og halvstepper i alle verdensdeler, men er i Norge bare kjent fra områder ved Wijdefjorden med sidefjorder på Svalbard, der en kombinasjon av regnskygge (svært tørt klima) og uttørkende vinder skaper helt spesielle forhold som gjør utvikling av saltanriket jord mulig også i et kaldt klima.',
)

# 0
nul_elem_segment=ElementarySegment(
    _id='AS.0',
    lec=as_lec,
    value='0',
    order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='not the salt enrichment'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='soil without salt enrichment in the upper layers; dominant water flow downwards (or soil that is too coarse and sand-dominated for the capillary forces to be able to pull salts up to the surface)'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='pH',
    value='< 8,5'
)

ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='ikke saltanriket'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='jordsmonn uten saltanriking i øvre sjikt; dominerende vannstrøm nedadgående (eller jord som er for grov og sanddominert til at kapillærkreftene klarer å trekke salter opp mot overflata)'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='pH',
    value='< 8,5'
)
# a
a_elem_segment=ElementarySegment(
    _id='AS.a',
    lec=as_lec,
    value='a',
    order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='salt enrichment'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='soil with salt enrichment in the upper layer as a result of an upward dominant water flow.'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='pH',
    value='8.5–10.5'
)

ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='saltanriket'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='jordsmonn med saltanriking i øvre sjikt som følge av en oppadgående dominerende vannstrøm.'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='pH',
    value='8,5–10,5'
)