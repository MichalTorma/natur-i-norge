# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% KI
ki_lec = LEC(
    _id='KI',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=5,
    spatialScale=1,
)
ki_lec_info_en = LECInfo(
    language_id='en',
    lec=ki_lec,
    name='Strength of spring-water influence',
    description='Variation in the degree to which the water supplied to terrestrial, wetland, limnic or marine systems have characteristics of spring water, i.e., constancy throughout the year of flow and chemical composition of water including high concentrations of dissolved O2, and temperature near the annual mean temperature of the area. In wetlands, spring-water influence increases from a level (topogeneous) to a sloping (soligenous) ground-water table.',
)
ki_lec_info_nb = LECInfo(
    language_id='nb',
    lec=ki_lec,
    name='Kildevannspåvirkning',
    description='''Uttrykker variasjon i ’kildestyrke’ langs en gradient som kan følges i våtmarkssystemer som fuktes av vann med horisontalt (topogent) grunnvannsspeil, via myr og fastmark som fuktes av (soligent) vann med hellende grunnvannsspeil, til fuktmark og kilder som tilføres vann med kildevannsegenskaper. Stabile (eustatiske) kilder (Bilde 7) utgjør endepunktet for økoklinen. Kildevannspåvirkning finner også sted i fastmarkssystemer, fra systemer uten regelmessig tilførsel av grunnvann til frodige lier med tydelig tilførsel av friskt grunnvann (KI∙c) med kildevannsegenskaper (wet flushing; Dahl 1957; se også Samuelsson 1917, Nordhagen 1943, Malmström 1949, R. Økland & Bendiksen 1985, R. Økland & Eilertsen 1993). Begrepet kildestyrke adresserer arealenhetenes totale ‘kildekarakter’, det vil si deres plassering langs en kompleks miljøvariabel som omfatter vanntilførselsstabilitet, ’friskhet’ (oksygeninnhold), temperaturstabilitet, stabilitet i kjemisk innhold og kanskje også konsentrasjoner av enkelte kjemiske stoffer. Det er fortsatt ikke klarlagt hvilken eller hvilke økologiske enkeltfaktorer som er viktigste årsak(er) til variasjon i artssammensetning langs kildevannspåvirkning (KI).
	Variasjonen langs kildevannspåvirkning (KI) finnes ikke bare mellom kildevannspåvirkete områder, men gir seg tydelig til kjenne også innen hvert enkelt område, f.eks. som vegetasjonssonering og variasjon i temperatur fra sentrum til periferi innenfor store kilder med eustatisk kildesentrum [se eksempler fra Rondane i Dahl (1957)], og variasjon fra kildesentrum nedstrøms via svak kilde til kildemyr og myr uten synlig kildevannspåvirkning der eustatiske kilder forekommer i overkanten av større bakkemyrer. Fransson (1972: 28) beskriver denne gradienten slik: 'Teoretiskt borde det (...) existera en gradient källvegetation – soligen kärrvegetation – topogen vegetation'. 
	Variasjon relatert til kildevannspåvirkning (KI) er en særlig viktig årsak til variasjon i artssammensetningen i områder med stor storskala-topografisk variasjon (på Vestlandet, i Nord-Norge og i fjellet), fordi grovt relieff fremmer forekomsten av kildehorisonter.
	Kildevannspåvirkning (KI) er en kompleks miljøvariabel med nulltrinn der det ikke er noen sporbar effekt av tilførsel av vann med ‘kildevannsegenskaper’ og naturlig endetrinn i stabile kilder med en kontinuerlig strøm av vann med nær konstant temperatur.
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='KI.0',
    lec=ki_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='no source water impact'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='stagnant groundwater (topogenic or topo-limnogenic water supply in wetland systems) or no regular supply of groundwater or moving surface water (normal solid state systems)'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='ingen kildevannspåvirkning'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='stagnerende grunnvann (topogen eller topo-limnogen vanntilførsel i våtmarkssystemer) eller ingen regelmessig tilførsel av grunnvann eller bevegelig overflatevann (normale fastmarkssystemer)'
)
# a
a_elem_segment=ElementarySegment(
    _id='KI.a',
    lec=ki_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='observable spring water impact'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='supply of moving groundwater without spring water properties (sunny water supply to wetland systems) or regular supply of moving surface water (solid ground systems), but not sufficient for the spring water impact of the species composition to be observable'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='observerbar kildevannspåvirkning'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='tilførsel av bevegelig grunnvann uten kildevannsegenskaper (soligen vanntilførsel til våtmarkssystemer) eller regelmessig tilførsel av bevegelig overflatevann (fastmarkssystemer), men ikke tilstrekkelig til at kildevannspåvirkningen av artssammensetningen er observerbar'
)
# bc
bc_elem_segment=ElementarySegment(
    _id='KI.bc',
    lec=ki_lec,
    value='bc',
    relative_order=3
)
ElementarySegment(
    _id='KI.b',
    lec=ki_lec,
    value='b',
    order=3,
    relative_order=0,
    parent=bc_elem_segment
)
ElementarySegment(
    _id='KI.c',
    lec=ki_lec,
    value='c',
    order=4,
    relative_order=1,
    parent=bc_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='en',
    key='<class>',
    value='weak spring water impact'
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='en',
    key='<description>',
    value='weak spring water impact, but sufficient to give, but sufficient to have an observable effect on the species composition (marked flush effect indicating supply of moving groundwater with spring water properties in mainland systems; spring bogs in wetland systems); = slightly rheogenic soil moisture; in woodland and meadow systems large fern and perennial forest / meadow'
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='nb',
    key='<class>',
    value='svak kildevanns-påvirkning'
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='nb',
    key='<description>',
    value='svak kildevannspåvirkning, men tilstrekkelig til å gi, men tilstrekkelig til å ha observerbar effekt på artssammen-setningen (markert flush-effekt som indikerer tilførsel av bevegelig grunnvann med kildevannsegenskaper i fastmarkssystemer; kildemyr i våtmarkssystemer); = svakt rheogen markfukting; i skogsmarks- og engsystemer storbregne- og høgstaudeskog/-eng'
)
# d
d_elem_segment=ElementarySegment(
    _id='KI.d',
    lec=ki_lec,
    value='d',
    order=5,
    relative_order=4
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<class>',
    value='clear spring water impact (weak source)'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<description>',
    value='clear spring water impact, but strong enough to give rise to a wetland system to be typified as a source, but the source is diffuse and weak; = rather weak rheogenic soil moisture'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<class>',
    value='klar kildevannspåvirkning (svak kilde)'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<description>',
    value='klar kildevannspåvirkning, men sterk nok til å gi opphav til et våtmarkssystem som skal typifiseres som kilde, men kilden er diffus og svak; = nokså svak rheogen markfukting  '
)
# e
e_elem_segment=ElementarySegment(
    _id='KI.e',
    lec=ki_lec,
    value='e',
    order=6,
    relative_order=5
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<class>',
    value='rather strong spring water impact [unstable (astatic) source]'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<description>',
    value='very clear spring water impact, strong enough to give rise to a wetland system to be typified as a source; the source is marked as a clear emergence, but without a stable water supply and / or stable temperature; = astatic source, fairly strong rheogenic soil moisture'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<class>',
    value='temmelig sterk kildevannspåvirkning [ustabil (astatisk) kilde]'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<description>',
    value='meget klar kildevannspåvirkning, sterk nok til å gi opphav til et våtmarkssystem som skal typifiseres som kilde; kilden er markert som et tydelig oppkomme, men uten stabil vanntilførsel og/eller stabil temperatur; = astatisk kilde, nokså sterk rheogen markfukting'
)
# all
all_elem_segment=ElementarySegment(
    _id='KI.¤',
    lec=ki_lec,
    value='¤',
    order=7,
    relative_order=6
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<class>',
    value='very strong spring water impact [stable (eustatic) source]'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<description>',
    value='strong (eustatic) source; continuous flow of spring water with almost constant temperature (close to the annual average temperature in the area; = strong rheogenic soil moisture'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<class>',
    value='svært sterk kildevannspåvirkning [stabil (eustatisk) kilde]'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<description>',
    value='sterk (eustatisk) kilde; kontinuerlig framspring av kildevann med tilnærmet konstant temperatur (nær årsmiddeltemperaturen i området; = sterk rheogen markfukting'
)
