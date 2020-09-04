# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% SM
sm_lec = LEC(
    _id='SM',
    structuringProcess_id='R',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=1,
    spatialScale=10,
)
sm_lec_info_en = LECInfo(
    language_id='en',
    lec=sm_lec,
    name='Size-related environmental variation in marine and freshwater systems',
    description='Complex-gradient that expresses co-ordinated variation in environmental variables related to the surface area and depth of water masses, such as annual temperature amplitude (and, accordingly, the risk of overheating and freezing), hypersalinity, hypoxia and anoxia; the LEC covers variation from the open sea and large lakes to temporary pools which may lack persistent populations and thus represent a species-thinning situation',
)
sm_lec_info_nb = LECInfo(
    language_id='nb',
    lec=sm_lec,
    name='Størrelsesrelatert miljøvariabilitet (i vannsystemer)',
    description='''Miljøstabilitet (og miljøforutsigbarhet) er en viktig rammebetingelse for hvilke tilpasninger som er nødvendige for å overleve på et levested over tid. I romlig avgrensete vannforekomster (innsjøer, litoralbasseng, poller, fjorder) er størrelse (både horisontal og vertikal utstrekning) en av de viktigste prediktorer for miljøstabilitet. Størrelsen bestemmer langt på veg den årlige temperaturamplituden (maksimums- og minimumstemperaturen), og dermed faren for overoppheting og bunnfrysing, hypersalinitet og anoksi. Ett viktig skille i går mellom vannforekomster som er så grunne at de mangler sjiktning og dypere vannforekomster som to ganger årlig får ‘fornyet’ vannmassene. 
	Viktigheten av størrelsesrelatert miljøstabilitet for artssammensetning i vannforekomster kommer klart til uttrykk i Vannrammedirektivets innsjøtypologi (Anonym 2013), der to av sju ‘typologifaktorer’ (tilsvarer komplekse miljøvariabler) uttrykker størrelse; ‘Størrelse (overflateareal)’ med fire klasser [1 = små (< 0,5 km2); 2 = middels (0,5–5 km2); 3 = store (5–50 km2); 4 = svært store (> 50 km2)] og ‘Dybde innsjøer (middeldyp)’ med tre klasser [1 = svært grunn (< 3 m); 2 = grunn (3–15 m); 3 = dyp (> 15 m)]. Noen artsgrupper, som f.eks. fisk, forsvinner gradvis når innsjøene blir mindre. Men til tross for at kunnskapen om artenes fordeling langs en gradient i størrelsesrelatert miljøstabilitet er mangelfull, er det åpenbart at artssammensetningen varierer over et større spekter enn langs en rein artsuttynningsgradient når størrelsen går fra Mjøsa til en liten dam. I NiN 2er horisontal og vertikal utstrekning tentativt kombinert til én kompleks miljøvariabel som skal gi uttrykk for de to størrelsesdimensjonenes samlete betydning for miljøstabiliteten.
	Til grunn for basistrinninndelingen av størrelsesrelatert miljøvariabilitet (i vannsystemer) (SM) er lagt at gradienten ender i et artsuttynningsintervall, at artsuttynningsintervallets nedre endetrinn er SM∙d, og at gradientens naturlige øvre endetrinn er temporære vannforekomster der akvatiske arter opplever uttørking som disruptivt miljøstress som forhindrer opprettholdelse av permanente populasjoner. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da størrelsesrelatert miljøvariabilitet (i vannsystemer) (SM) deles i åtte basistrinn. I tillegg kommer trinnet g som er nødvendig for å fange opp den betydelige størrelsesrelaterte variasjonen innenfor litoralbasseng.
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='SM.0',
    lec=sm_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='ocean'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='in direct connection with the world\'s oceans'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='hav'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='i direkte sammenheng med verdenshavene'
)
# a
a_elem_segment=ElementarySegment(
    _id='SM.a',
    lec=sm_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='fjord'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='long and narrow sea indentation that is over-deepened within a marked threshold near the estuary, and with limited replacement of the bottom water'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='Criterium',
    value='marked threshold'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='fjord'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='lang og smal havinnbukting som er overfordypet innenfor en markert terskel nær munningen, og med begrenset utskifting av bunnvannet'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='Kriterium',
    value='markert terskel'
)
# b
b_elem_segment=ElementarySegment(
    _id='SM.b',
    lec=sm_lec,
    value='b',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='large and deep water body'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='very small environmental variability [large, deep water body; either a lake or a pollen, ie a body of salt water which is physically delimited from the sea, which is regularly, but not permanently, supplied with sea water, which is separated from the sea by a threshold above the lowest spring level, and which has a permanent outlet to (and inlet) from) the sea]'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='Criterium',
    value='lake or threshold above the lowest spring level,> 5 km2 and average depth> 15 m'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='stor og dyp vannforekomst'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='svært liten miljøvariabilitet [stor, dyp vannforekomst; enten en innsjø eller en poll, det vil si en saltvannforekomst som er fysisk avgrenset fra havet, som regelmessig, men ikke permanent, tilføres havvann, som er skilt fra havet av en terskel ovenfor laveste fjærenivå, og som har permanent utløp til (og innløp fra) havet]'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='Kriterium',
    value='innsjø eller terskel ovenfor laveste fjærenivå, >5 km2 og middeldybde > 15 m'
)
# c
c_elem_segment=ElementarySegment(
    _id='SM.c',
    lec=sm_lec,
    value='c',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='large or deep body of water'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<description>',
    value='small environmental variability [layered, relatively deep, small – medium-sized water body]'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='Criterium',
    value='<5 km2 or mean depth <15 m'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<class>',
    value='stor eller dyp vannforekomst'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<description>',
    value='liten miljøvariabilitet [sjiktet, relativt dyp, liten–middels stor vannforekomst]'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='Kriterium',
    value='< 5 km2 eller middeldybde < 15 m'
)
# d
d_elem_segment=ElementarySegment(
    _id='SM.d',
    lec=sm_lec,
    value='d',
    order=4,
    relative_order=4
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<class>',
    value='small and rather deep water body'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<description>',
    value='moderate environmental variability [unlayered, relatively deep, small to medium-sized body of water; so deep that rooted aquatic plants can not grow all over the bottom]'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='Criterium',
    value='<5 km2 and maximum depth> 5 m'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<class>',
    value='liten og temmelig dyp vannforekomst'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<description>',
    value='moderat miljøvariabilitet [usjiktet, relativt dyp, liten–middels stor vannforekomst; så dyp at rotfaste vannplanter ikke kan vokse over hele bunnen]'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='Kriterium',
    value='< 5 km2 og største dybde > 5 m'
)
# ef
ef_elem_segment=ElementarySegment(
    _id='SM.ef',
    lec=sm_lec,
    value='ef',
    relative_order=5
)
ElementarySegment(
    _id='SM.e',
    lec=sm_lec,
    value='e',
    order=5,
    relative_order=0,
    parent=ef_elem_segment
)
ElementarySegment(
    _id='SM.f',
    lec=sm_lec,
    value='f',
    order=6,
    relative_order=1,
    parent=ef_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='<class>',
    value='small and shallow water body'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='<description>',
    value='significant environmental variability [unlayered, shallow water body; so reason that aquatic plants can grow all over the bottom;]'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='Criterium',
    value='<5 km2 and maximum depth <(3–) 5 m'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='<class>',
    value='liten og grunn vannforekomst'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='<description>',
    value='betydelig miljøvariabilitet [usjiktet, grunn vannforekomst; så grunn at vannplanter kan vokse over hele bunnen;]'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='Kriterium',
    value='< 5 km2 og største dybde < (3–)5 m'
)
# g
g_elem_segment=ElementarySegment(
    _id='SM.g',
    lec=sm_lec,
    value='g',
    order=7,
    relative_order=6
)
ElementarySegmentInfo(
    elementarySegment=g_elem_segment,
    language_id='en',
    key='<class>',
    value='pond'
)
ElementarySegmentInfo(
    elementarySegment=g_elem_segment,
    language_id='en',
    key='<description>',
    value='great environmental variability [pond; layered, shallow, small body of water; so reason that aquatic plants can grow all over the bottom]'
)
ElementarySegmentInfo(
    elementarySegment=g_elem_segment,
    language_id='en',
    key='Criterium',
    value='<2 500 m2 and maximum depth <3 m'
)
ElementarySegmentInfo(
    elementarySegment=g_elem_segment,
    language_id='nb',
    key='<class>',
    value='dam'
)
ElementarySegmentInfo(
    elementarySegment=g_elem_segment,
    language_id='nb',
    key='<description>',
    value='stor miljøvariabilitet [dam; usjiktet, grunn, liten vannforekomst; så grunn at vannplanter kan vokse over hele bunnen]'
)
ElementarySegmentInfo(
    elementarySegment=g_elem_segment,
    language_id='nb',
    key='Kriterium',
    value='< 2 500 m2 og største dybde < 3 m'
)
# h
h_elem_segment=ElementarySegment(
    _id='SM.h',
    lec=sm_lec,
    value='h',
    order=8,
    relative_order=7
)
ElementarySegmentInfo(
    elementarySegment=h_elem_segment,
    language_id='en',
    key='<class>',
    value='slop'
)
ElementarySegmentInfo(
    elementarySegment=h_elem_segment,
    language_id='en',
    key='<description>',
    value='very high environmental variability [puddle; ground, small body of water that does not dry out or freeze to the bottom]'
)
ElementarySegmentInfo(
    elementarySegment=h_elem_segment,
    language_id='en',
    key='Criterium',
    value='<100 m2 and maximum depth <2 m'
)
ElementarySegmentInfo(
    elementarySegment=h_elem_segment,
    language_id='nb',
    key='<class>',
    value='pytt'
)
ElementarySegmentInfo(
    elementarySegment=h_elem_segment,
    language_id='nb',
    key='<description>',
    value='svært stor miljøvariabilitet [pytt; grunn, liten vannforekomst som ikke tørker ut eller bunnfryser]'
)
ElementarySegmentInfo(
    elementarySegment=h_elem_segment,
    language_id='nb',
    key='Kriterium',
    value='< 100 m2 og største dybde < 2 m'
)
# i
i_elem_segment=ElementarySegment(
    _id='SM.i',
    lec=sm_lec,
    value='i',
    order=9,
    relative_order=8
)
ElementarySegmentInfo(
    elementarySegment=i_elem_segment,
    language_id='en',
    key='<class>',
    value='small puddle'
)
ElementarySegmentInfo(
    elementarySegment=i_elem_segment,
    language_id='en',
    key='<description>',
    value='extreme environmental variability [small puddle; small and very shallow water body, but which still never dries out and / or freezes to the bottom'
)
ElementarySegmentInfo(
    elementarySegment=i_elem_segment,
    language_id='en',
    key='Criterium',
    value='<10 m2 and maximum depth <1 m'
)
ElementarySegmentInfo(
    elementarySegment=i_elem_segment,
    language_id='nb',
    key='<class>',
    value='liten pytt'
)
ElementarySegmentInfo(
    elementarySegment=i_elem_segment,
    language_id='nb',
    key='<description>',
    value='ekstrem miljøvariabilitet [liten pytt; liten og svært grunn vannforekomst, men som likevel aldri tørker ut og/eller bunnfryser'
)
ElementarySegmentInfo(
    elementarySegment=i_elem_segment,
    language_id='nb',
    key='Kriterium',
    value='< 10 m2 og største dybde < 1 m'
)
# all
all_elem_segment=ElementarySegment(
    _id='SM.¤',
    lec=sm_lec,
    value='¤',
    order=10,
    relative_order=9
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<class>',
    value='temporary puddle'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<description>',
    value='extreme environmental variability [small puddle; small and very shallow water body that dries out in periods (note that to be categorized as a water body, the bottom must be water covered at least 50% of the time) and / or bottom freezer; usually <10 m2 and maximum depth <1 m]'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<class>',
    value='temporær pyttekstrem miljøvariabilitet [liten pytt; liten og svært grunn vannforekomst som tørker ut i perioder (merk at for å kategoriseres som vannforekomst må bunnen være vanndekket minst 50 % av tida) og/eller bunnfryser; vanligvis < 10 m2 og største dybde < 1 m]'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<description>',
    value='desc_nb'
)
