# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% SX
sx_lec = LEC(
    _id='SX',
    structuringProcess_id='D',
    patternOfVariation_id='f',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=7,
)
sx_lec_info_en = LECInfo(
    language_id='en',
    lec=sx_lec,
    name='Categories of strongly modified ground',
    description='Complex environmental factor that sorts ground/ bottom strongly modified by anthropogeneous disturbances (but not contingent on historical land management) into categories such as: sites with upper layer removed, sites where a new substrate is deposited, e.g., resulting from regulation of watercourses or construction',
)
sx_lec_info_nb = LECInfo(
    language_id='nb',
    lec=sx_lec,
    name='Sterkt endret mark/bunn uten hevdpreg, preget av menneskebetinget forstyrrelse',
    description='Denne komplekse miljøfaktoren sorterer sterkt endret mark/bunn som er resultatet av menneskebetingete forstyrrelsesprosesser og som ikke er betinget av hevd i kategorier som antas å ha innbyrdes vesentlig forskjellig artssammensetning (se NiN[2] Artikkel 2: kapittel B4 og Vedlegg 5.) For beskrivelse av hver enkelt klasse, se de respektive hovedtypene.',
)