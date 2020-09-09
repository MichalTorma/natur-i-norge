# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% DD
dd_lec = LEC(
    _id='DD',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=1,
    spatialScale=9,
)
dd_lec_info_en = LECInfo(
    language_id='en',
    lec=dd_lec,
    name='Depth-related variation in deep fjords',
    description='Depth-related variation in the deepest fjords (> 700 m), which differs from the general pattern of depth-related environmental variation in open sea (addressed by LEC DM) by these fjords containing Atlantic water masses (with temperatures rarely falling below 4 °C) to the greatest depths',
)
dd_lec_info_nb = LECInfo(
    language_id='nb',
    lec=dd_lec,
    name='Dybderelatert variasjon i dype terskelfjorder',
    description='I det afotiske beltet finner det sted en betydelig artsutskifting mot dypet, relatert til de mange enkeltvariablene som er korrelert med dyp (trykk, temperatur, mattilgang etc.). Det er til dels uklart hvilke av disse som er utslagsgivende for den vertikale fordelingen av arter innen ulike artsgrupper eller om det er den økte stabiliteten i en lang rekke viktige miljøvariabler med økende dyp som er utslagsgivende. Med økende dyp avtar variasjonen i temperatur gjennom året, variasjonen i salinitet og i bevegelsesenergi. I tillegg avtar temperaturen. Graden av dybderelatert miljøstabilisering øker med skiftende vannmassetyper fra kystvann via atlantisk vann og intermediært vann til dyphavsvann (‘minusvann’). Disse forskjellene i vannmasseegenskaper kommer til uttrykk langs LKM dybderelatert miljøstabilisering (DM). I det åpne havet varierer dybdenivåene der vannmassene møtes og avløser hverandre litt fra sør til nord, men denne variasjonen er likevel begrenset. Dype terskelfjorder, som f.eks. Sognefjorden (som med sine 1 308 m er Norges dypeste fjord) og Tysfjord , avviker imidlertid sterkt fra det alminnelige mønsteret: disse fjordene har atlantisk vann, med temperaturer som vanligvis ikke faller under 4 °C, helt ned til de største dyp. De tilhører derfor i sin helhet DM trinn DM∙b, nedre sublitoral fordi vannmassetilhørighet er overordnet dyp ved tilordning til DM. Den lokale komplekse miljøvariabelen DD er opprettet som redskap for å kunne beskrive den dybderelaterte variasjonen i artssammensetning i svært dype fjorder. Det er kjent at afotisk sedimentbunn på store dyp i fjordene har en artssammensetning som er forskjellig fra artssammensetningen på mindre dyp, blant annet ved forekomst av arter som ellers mangler langs norskekysten og først finnes igjen langs østkysten av Canada (P.B. Mortensen, pers. medd.). Årsaken til dette er ikke klarlagt, men kombinasjonen av atlantisk, relativt varmt vann, store dyp og det faktum at det dype fjordvannet ikke tilføres kaldt dyphavsvann, kan være utslagsgivende.',
)

# 0
nul_elem_segment=ElementarySegment(
    _id='DD.0',
    lec=dd_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='lower sublitoral'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='Atlantic water in the lower sublitoral'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='Depth',
    value='<700m'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='nedre sublitoral'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='atlantisk vann i nedre sublitoral'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='Dybde',
    value='<700m'
)

# a
a_elem_segment=ElementarySegment(
    _id='DD.a',
    lec=dd_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='bathypelagic'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='Atlantic waters in bathypelagic and bathyal'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='Depth',
    value='>700m'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='bathypelagial'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='atlantisk vann i bathypelagial og bathyal'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='Dybde',
    value='>700m'
)