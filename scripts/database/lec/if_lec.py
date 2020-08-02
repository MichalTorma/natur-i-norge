# %%
from model import LEC
from model import LECInfo
from database_fill.language_data import en_language, nb_language
from database_fill.structuring_process_data import d_structuring_process
from database_fill.pattern_of_variation_data import ga_pattern_of_variation

# %% IF
if_lec = LEC(
    _id='IF',
    structuringProcess=d_structuring_process,
    patternOfVariation=ga_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=1,
    spatialScale=2,
)
if_lec_info_en = LECInfo(
    language=en_language,
    lec=if_lec,
    name='Ice-scouring disturbance',
    description='Variation in the intensity of freezing and ice scouring on littoral belts of coastal and inland lake sites, flooded ground along rivers and in kettle holes, e.g., affecting the establishment of perennial plants; ends in a species-thinning situation',
)
if_lec_info_nb = LECInfo(
    language=nb_language,
    lec=if_lec,
    name='Isbetinget forstyrrelse',
    description='''Adresserer den karakteristiske effekten av regelmessig isinnfrysing og isskuring i fjærebeltet og i flomsonen langs elver og innsjøer, samt effekter av isinnfrysing i bunnen av dødisgroper med gjennomslippelige løsmasser i kontinentale områder, som innebærer at gropene fylles av vann som fryser til is. 
	Langs kysten forsterker effekten av isbetinget forstyrrelse seg nordover, og i Nord-Norge kan forårsake blankskurte berg i fjærebeltet. Mens bølger og strøm [vannforstyrrelsesintensitet (VF)] har både positive (vannutskifting, tilførsel av næring etc.) og negative effekter på organismene, har isskuring nesten utelukkende en negativ effekt på artsrikdom og artssammensetning, og gir derfor opphav til artsuttynning. Påvirkningen fra isskuring finner først og fremst sted vår og høst. På steder som er utsatt for isskuring finnes ofte de samme artene som i tangsamfunn, men med dominans av hurtigvoksende grønnalger Resultatet kan bli et samfunn uten flerårige arter, men med oppblomstring av hurtigvoksende 'sommerarter’ som er rikelig til stede. Effekten av isbetinget forstyrrelse (IF) er sammenlignbar med effekten av andre eroderende prosesser. som f.eks. fanges opp av erosjonsutsatthet (ER), men mer reint destabiliserende enn effekten av vindutsatthet (VI).
	I kontinentale innlandsstrøk, først og fremst i Nord-Østerdal (Folldal og nærliggende områder) finnes tallrike dødisgroper, som spenner over et stort størrelsesspekter. I det vinterkalde, nedbørfattige klimaet fryser marka i slike grupper til med is om høsten og tilførsler av vann til den frosne marka bidrar til å øke islagets tjukkelse. I snøsmeltingen om våren vil dødisgropene være vannfylte i en periode inntil marka blir fri for tele. Artssammensetningen i slike groper får et karakteristisk preg av isbetinget forstyrrelse (IF), og blir typifisert som T20 Isinnfrysingsmark. Det er visse fellestrekk mellom dette forstyrrelsesregimet og flomregimet som finnes i dødisgroper lengre sør på Østlandet (på Gardermo-sletta), der langvarig oversvømmelse heller enn innfrysing i is er utslagsgivende for artssammensetningen. Dette beskrives som variasjon i flomregime (FR).
	Til grunn for basistrinninndelingen av isbetinget forstyrrelse (IF) er lagt at dette er en artsuttynningsgradient, der artsuttynningsintervallet starter allerede ved overgangen mellom trinnene ER∙0 og ER∙a og endepunktet er der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da isbetinget forstyrrelse (IF) deles i fire basistrinn.
''',
)