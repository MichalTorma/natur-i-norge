# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% IF
if_lec = LEC(
    _id='IF',
    structuringProcess_id='D',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=1,
    spatialScale=2,
)
if_lec_info_en = LECInfo(
    language_id='en',
    lec=if_lec,
    name='Ice-scouring disturbance',
    description='Variation in the intensity of freezing and ice scouring on littoral belts of coastal and inland lake sites, flooded ground along rivers and in kettle holes, e.g., affecting the establishment of perennial plants; ends in a species-thinning situation',
)
if_lec_info_nb = LECInfo(
    language_id='nb',
    lec=if_lec,
    name='Isbetinget forstyrrelse',
    description='''Adresserer den karakteristiske effekten av regelmessig isinnfrysing og isskuring i fjærebeltet og i flomsonen langs elver og innsjøer, samt effekter av isinnfrysing i bunnen av dødisgroper med gjennomslippelige løsmasser i kontinentale områder, som innebærer at gropene fylles av vann som fryser til is. 
	Langs kysten forsterker effekten av isbetinget forstyrrelse seg nordover, og i Nord-Norge kan forårsake blankskurte berg i fjærebeltet. Mens bølger og strøm [vannforstyrrelsesintensitet (VF)] har både positive (vannutskifting, tilførsel av næring etc.) og negative effekter på organismene, har isskuring nesten utelukkende en negativ effekt på artsrikdom og artssammensetning, og gir derfor opphav til artsuttynning. Påvirkningen fra isskuring finner først og fremst sted vår og høst. På steder som er utsatt for isskuring finnes ofte de samme artene som i tangsamfunn, men med dominans av hurtigvoksende grønnalger Resultatet kan bli et samfunn uten flerårige arter, men med oppblomstring av hurtigvoksende 'sommerarter’ som er rikelig til stede. Effekten av isbetinget forstyrrelse (IF) er sammenlignbar med effekten av andre eroderende prosesser. som f.eks. fanges opp av erosjonsutsatthet (ER), men mer reint destabiliserende enn effekten av vindutsatthet (VI).
	I kontinentale innlandsstrøk, først og fremst i Nord-Østerdal (Folldal og nærliggende områder) finnes tallrike dødisgroper, som spenner over et stort størrelsesspekter. I det vinterkalde, nedbørfattige klimaet fryser marka i slike grupper til med is om høsten og tilførsler av vann til den frosne marka bidrar til å øke islagets tjukkelse. I snøsmeltingen om våren vil dødisgropene være vannfylte i en periode inntil marka blir fri for tele. Artssammensetningen i slike groper får et karakteristisk preg av isbetinget forstyrrelse (IF), og blir typifisert som T20 Isinnfrysingsmark. Det er visse fellestrekk mellom dette forstyrrelsesregimet og flomregimet som finnes i dødisgroper lengre sør på Østlandet (på Gardermo-sletta), der langvarig oversvømmelse heller enn innfrysing i is er utslagsgivende for artssammensetningen. Dette beskrives som variasjon i flomregime (FR).
	Til grunn for basistrinninndelingen av isbetinget forstyrrelse (IF) er lagt at dette er en artsuttynningsgradient, der artsuttynningsintervallet starter allerede ved overgangen mellom trinnene ER∙0 og ER∙a og endepunktet er der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da isbetinget forstyrrelse (IF) deles i fire basistrinn.
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='IF.0',
    lec=if_lec,
    value='0',
    order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='without ice disturbance'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='without visible traces of ice erosion (on species composition)'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='uten isforstyrrelsespreg'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='uten synlige spor etter iserosjon (på artssammensetningen)'
)
# a
a_elem_segment=ElementarySegment(
    _id='IF.a',
    lec=if_lec,
    value='a',
    order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='slightly ice-disturbing'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='weak but observable sign of ice erosion'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='litt isforstyrrelsespreget'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='svakt, men observerbart preg av iserosjon'
)
# b
b_elem_segment=ElementarySegment(
    _id='IF.b',
    lec=if_lec,
    value='b',
    order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='clearly ice disturbance'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='clear signs of ice erosion and / or other ice-related disturbance (ice freezing); in ice erosion, less substrate material is added to the substrate by sedimentation than the amount of material eroded away; species composition without or with sparse elements of perennial species'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='klart isforstyrrelsespreget'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='klart preg av iserosjon og/eller annen isbetinget forstyrrelse (isinnfrysing); ved iserosjon tilføres substratet mindre nytt materiale ved sedimentasjon enn mengden materiale som eroderes vekk; artssammensetning uten eller med sparsomt innslag av flerårige arter'
)
# all
all_elem_segment=ElementarySegment(
    _id='IF.¤',
    lec=if_lec,
    value='¤',
    order=3
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<class>',
    value='characterized by disruptive ice disturbance'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<description>',
    value='without stable species composition'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<class>',
    value='preget av disruptiv isforstyrrelse'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<description>',
    value='uten stabil artssammensetning'
)
