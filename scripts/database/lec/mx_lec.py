# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

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