# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% SH
sh_lec = LEC(
    _id='SH',
    structuringProcess_id='R',
    patternOfVariation_id='f',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=8,
)
sh_lec_info_en = LECInfo(
    language=en_language,
    lec=sh_lec,
    name='Categories of ground characterized by historical environmental stress or disturbance',
    description='Complex environmental factor that sorts ground characterised by historic disruptive stress and/or disturbance processes into categories with substantially different species composition; examples of categories are: landslide areas, glacier forelands, blockfields, polar deserts and pebble beaches',
)
sh_lec_info_nb = LECInfo(
    language=nb_language,
    lec=sh_lec,
    name='Spesiell mark/bunn preget av historisk miljøstress eller forstyrrelse',
    description='Denne komplekse miljøfaktoren fanger opp alle kjente tilfeller av spesiell mark/bunn som er resultatet av historiske disruptive stress- og/eller forstyrrelsesprosesser, som har gitt opphav til systemer med artssammensetning som er vesentlig forskjellig fra artssammensetningen i tilsvarende normale systemer, og dermed skal oppfattes som egne natursystem-hovedtyper i henhold til kriteriene i NiN[2] Artikkel 1: kapittel B4 og Vedlegg 5. For beskrivelse av hver enkelt klasse, se de respektive hovedtypene.',
)