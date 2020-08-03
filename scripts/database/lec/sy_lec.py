# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% SY
sy_lec = LEC(
    _id='SY',
    structuringProcess_id='D',
    patternOfVariation_id='f',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=10,
)
sy_lec_info_en = LECInfo(
    language_id='en',
    lec=sy_lec,
    name='Categories of strongly modified water masses',
    description='Complex environmental factor that sorts water masses strongly modified by anthropogeneous disturbances such as physical, chemical or biological interventions, and/or new water masses (artificial lakes, pools, etc.), into categories',
)
sy_lec_info_nb = LECInfo(
    language_id='nb',
    lec=sy_lec,
    name='Sterk endring av vannmasser',
    description='Denne komplekse miljøfaktoren sorterer sterkt endrete vannmasser som er resultatet av menneskebetingete forstyrrelsesprosesser i kategorier som antas å ha innbyrdes betydelig forskjellig artssammensetning (se NiN[2] Artikkel 1: kapittel B4 og Vedlegg 5.) For beskrivelse av hver enkelt klasse, se de aktuelle hovedtypene.',
)