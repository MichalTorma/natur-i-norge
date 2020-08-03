# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

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