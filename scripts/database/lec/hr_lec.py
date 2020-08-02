# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% HR
hr_lec = LEC(
    _id='HR',
    structuringProcess_id='D',
    patternOfVariation='f',
    knowledgeBaseRelations=5,
    knowledgeBaseDivision=5,
    spatialScale=7,
)
hr_lec_info_en = LECInfo(
    language=en_language,
    lec=hr_lec,
    name='Semi-natural land management regime',
    description='Binary variable that distinguishes between two fundamentally different land management regimes on semi-natural ground: grazing and/or haymaking (resulting in grassland) vs prescribed burning (resulting in heathland)',
)
hr_lec_info_nb = LECInfo(
    language=nb_language,
    lec=hr_lec,
    name='Semi-naturlig hevdregime',
    description='Denne komplekse miljøfaktoren beskriver de to fundamentalt forskjellige hevdregimene som har gitt opphav til hovedkategoriene av semi-naturlig jordbruksmark; lyngbrenning som nøkkelelementet i hevdregimet som, i kombinasjon med beiting hele eller store deler av året, eventuelt også slått, har gitt opphav til kystlynghei, og beite og/eller slått, gjerne i kombinasjon (se NiN[2] Artikkel 1: kapittel B3g), som har gitt opphav til semi-naturlig eng. Brenning kan også ha vært viktig ledd i tidlige faser av et beite- og/eller slåtteregime (landnåmsfasen), eller som et vedvarende tiltak, f.eks. for å forbedre beitekvaliteten på mager mark. For nærmere beskrivelse av hver enkelt klasse, se de respektive hovedtypene.',
)