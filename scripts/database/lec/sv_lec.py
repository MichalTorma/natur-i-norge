# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% SV
sv_lec = LEC(
    _id='SV',
    structuringProcess_id='S',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=5,
    spatialScale=4,
)
sv_lec_info_en = LECInfo(
    language=en_language,
    lec=sv_lec,
    name='Growing-season reduction due to prolonged snow cover',
    description='Variation in the extent to which the growing-season is reduced due to long-lasting snow cover; from normal growing-season length given the prevailing climatic conditions via moderate, late, extreme and vegetation-free snowbeds to permanent snow and ice; ends in a species-thinning situation',
)
sv_lec_info_nb = LECInfo(
    language=nb_language,
    lec=sv_lec,
    name='Snødekkebetinget vekstsesongreduksjon',
    description='''Varigheten av snødekke på marka, som er betinget av samvirkning mellom regionale og lokale topografiske forhold og sterke vinders omfordeling av snøen, bestemmer vekstsesongens lengde. Tida som står til artenes disposisjon for å gjennomføre sin livssyklus er en av de variablene som sterkest styrer og begrenser artenes lokale utbredelse i fjellet. Alle arter har en toleransegrense overfor langvarig snødekke (Resvoll 1917, Gjærevoll 1956, Dahl 1957). Snødekkebetinget vekstsesongreduksjon (SV) er derfor den viktigste forklaringsvariabelen for variasjon i artssammensetning i snøleier (Odland 2005, Odland & Munkejord 2008a, 2008b).
	Snødekkebetinget vekstsesongreduksjon (SV) er en typisk lokal kompleks miljøvariabel, som framviser variasjon på skalaer ned til under 10 m i terreng med stor topografisk variasjon på fin skala. Men snødekkevarigheten varierer også på regional skala; vekstsesonglengden avtar mot nord og mot høyden [variasjon langs bioklimatiske soner (BS)]. Det er også en tendens til at snødekkets mengde og varighet øker med økende høyde over havet inntil punktet der sterk vindvirkning, bratt terreng og overvekt av konvekse terrengformer gjør snødekket ustabilt over store områder. Det er derfor en tendens til at snøleiearealet, og betydningen av snødekkebetinget vekstsesongreduksjon (SV) for naturvariasjonen, øker fra nordboreal bioklimatisk sone via lavalpin sone (LA) til mellomalpin sone (MA). Likeledes øker snøleiearealet mot fra kontinentale til oseaniske (mer snørike) bioklimatiske seksjoner (BS).
''',
)