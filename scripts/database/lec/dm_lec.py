# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% DM
dm_lec = LEC(
    _id='DM',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=9,
)
dm_lec_info_en = LECInfo(
    language_id='en',
    lec=dm_lec,
    name='Depth-related environmental stabilisation',
    description='Gradual stabilisation of marine environments with increasing depth, reflected in reduced amplitudes of temperature, salinity and kinetic energy; depths > 2000 m are characterised by constant temperature < –0.5°C, food shortage and high hydrostatic pressure',
)
dm_lec_info_nb = LECInfo(
    language_id='nb',
    lec=dm_lec,
    name='Dybderelatert miljøstabilisering',
    description='I den afotiske t finner det sted en betydelig artsutskifting mot dypet. Mange enkeltvariabler er korrelert med dyp (trykk, temperatur, mattilgang etc.). Det er til dels uklart hvilke av disse som er utslagsgivende for den vertikale fordelingen av arter innen ulike artsgrupper eller om det er den økte stabiliteten i en lang rekke viktige miljøvariabler med økende dyp som er utslagsgivende. Med økende dyp avtar variasjonen i temperatur gjennom året, variasjonen i salinitet og i bevegelsesenergi. I tillegg avtar temperaturen. Graden av dybderelatert miljøstabilisering øker med skiftende vannmassetyper fra kystvann via atlantisk vann og intermediært vann til dyphavsvann (‘minusvann’). Vannmassetilhørighet er hovedkriterium for tilordning til DM-trinn; dybdeangivelsene i tabellen er omtrentlige og avvik forekommer. Dybdegrenser for de ulike stabilitetsnivåene varierer regionalt og med strømforholdene, f.eks. ligger grensene på mye større dyp i dype fjorder enn på åpent hav, og de ligger noe dypere i sør enn i nord. Sognefjorden, Tysfjord og andre dype terskelfjorder har atlantisk vann til de største dyp, med temperaturer som vanligvis ikke faller under 4 °C, og tilhører derfor i sin helhet DM∙b. Dybderelatert variasjon i dype terskelfjorder beskrives ved bruk av LKM dybderelatert variasjon i dype terskelfjorder (DD).',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='DM.0',
    lec=dm_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='upper sublitoral (epipelagial)'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='great environmental variability; euphotic and upper aphotic belt, typically connected to the coast and coastal bodies of water [sublitoral belt; down to approx. 200 m]'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='Depth',
    value='<200m'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='Temperature',
    value='variable'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='øvre sublitoral (epipelagial)'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='stor miljøvariabilitet; eufotisk og øvre afotisk belte, typisk koblet til kysten og kystvannmasser [sublitoral belte; ned til ca. 200 m]'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='Dybde',
    value='<200m'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='Temperatur',
    value='variabel'
)
# a
a_elem_segment=ElementarySegment(
    _id='DM.a',
    lec=dm_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='Atlantic waters, typically in the lower sublitoral (mesopelagial)'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='fairly high environmental variability; atlantic waters and mesopelagic belt'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='Depth',
    value='200m-(500m)-700m'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='Temperature',
    value='2-8'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='atlantisk vann, typisk i nedre sublitoral (mesopelagial)'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='nokså stor miljøvariabilitet; atlantiske vannmasser og mesopelagisk belte'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='Dybde',
    value='200m-(500m)-700m'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='Temperatur',
    value='2-8'
)
# b
b_elem_segment=ElementarySegment(
    _id='DM.b',
    lec=dm_lec,
    value='b',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='intermediate water, typically in the upper bathyal (bathypelagial)'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='intermediate bodies of water and the upper part of the bathypelagic belt'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='Depth',
    value='700m-1000m(-1100m)'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='Temperature',
    value='0-2'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='intermediært vann, typisk i øvre bathyal (bathypelagial)'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='intermediære vannmasser og øvre del av bathypelagisk belte'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='Dybde',
    value='700m-1000m(-1100m)'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='Temperatur',
    value='0-2'
)
# cd
cd_elem_segment=ElementarySegment(
    _id='DM.cd',
    lec=dm_lec,
    value='cd',
    relative_order=4
)
c_elem_segment=ElementarySegment(
    _id='DM.c',
    lec=dm_lec,
    value='c',
    order=4,
    relative_order=0,
    parent=cd_elem_segment,
)
d_elem_segment=ElementarySegment(
    _id='DM.d',
    lec=dm_lec,
    value='d',
    order=5,
    relative_order=1,
    parent=cd_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='<class>',
    value='deep sea water, typically in the lower bathyal (bathypelagial)'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='<description>',
    value='fairly stable environment; deep-sea bodies of water and bathypelagic belt'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='Depth',
    value='1000m-2000m'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='Temperature',
    value='<0'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='<class>',
    value='dyphavsvann, typisk i nedre bathyal (bathypelagial)'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='<description>',
    value='nokså stabilt miljø; dyphavs-vannmasser og bathypelagisk belte'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='Dybde',
    value='1000m-2000m'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='Temperatur',
    value='<0'
)
# ef
ef_elem_segment=ElementarySegment(
    _id='DM.ef',
    lec=dm_lec,
    value='ef',
    relative_order=5
)
e_elem_segment=ElementarySegment(
    _id='DM.e',
    lec=dm_lec,
    value='e',
    order=6,
    relative_order=0,
    parent=ef_elem_segment
)
f_elem_segment=ElementarySegment(
    _id='DM.f',
    lec=dm_lec,
    value='f',
    order=7,
    relative_order=1,
    parent=ef_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='<class>',
    value='deep-sea water, typically in the abyssal (abysso-pelagial)'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='<description>',
    value='stable environment; deep-water bodies and abyssopelagic belt, upper part'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='Depth',
    value='>2000m'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='Temperature',
    value='<-0.5'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='<class>',
    value='dyphavsvann, typisk i abyssal (abysso-pelagial)'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='<description>',
    value='stabilt miljø; dyphavs-vannmasser og abyssopelagisk belte, øvre del'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='Dybde',
    value='>2000m'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='Temperatur',
    value='<-0.5'
)
