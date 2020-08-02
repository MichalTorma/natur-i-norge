# %%
from model import LEC
from model import LECInfo
from database_fill.language_data import en_language, nb_language
from database_fill.structuring_process_data import s_structuring_process
from database_fill.pattern_of_variation_data import t_pattern_of_variation

# %% AS
as_lec = LEC(
    _id='AS',
    structuringProcess=s_structuring_process,
    patternOfVariation=t_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=5,
)
as_lec_info_en = LECInfo(
    language=en_language,
    lec=as_lec,
    name='Arid terrestrial salinity',
    description='Variation from \'normal\' ground with predominantly downward water flow and maximal pH (in mineral soil rich in lime) ca. 8.0, to ground with predominantly upward water flow and salt precipitated as a white soil topsoil crust and pH up to 10.5; salt-enriched soils are typical for deserts and steppes but also occur locally in Arctic climates (e.g., at Svalbard) in sites characterised by a combination of extreme rain-shadow effect and dry winds',
)
as_lec_info_nb = LECInfo(
    language=nb_language,
    lec=as_lec,
    name='Arid terrestrisk salinitet',
    description='Variasjonen fra ’normal’ mark med overveiende nedadgående vannstrøm og maksimale pH-verdier (i rein kalkdominert mineraljord) opp til ca. 8,0, til finjordsrik mark med overveiende oppadgående vannstrøm, som fører til saltanriking i øvre jordlag og pH-verdier helt opp i 10,5. Saltanriket mark kan lettest diagnostiseres ved en kombinasjon av synlig hvitt saltlag på overflaten (som vaskes vekk av regn, men snart kommer tilbake). Saltjord er typisk for ørkener, stepper og halvstepper i alle verdensdeler, men er i Norge bare kjent fra områder ved Wijdefjorden med sidefjorder på Svalbard, der en kombinasjon av regnskygge (svært tørt klima) og uttørkende vinder skaper helt spesielle forhold som gjør utvikling av saltanriket jord mulig også i et kaldt klima.',
)