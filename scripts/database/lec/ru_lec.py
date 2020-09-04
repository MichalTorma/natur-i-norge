# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% RU
ru_lec = LEC(
    _id='RU',
    structuringProcess_id='R',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=3,
    spatialScale=5,
)
ru_lec_info_en = LECInfo(
    language_id='en',
    lec=ru_lec,
    name='Avalanche intensity',
    description='Variation in the intensity of regulating disturbance caused by large masses of snow, ice, soil or water moving over a sloping surface; typically bringing about removal of biomass in small patches that are laid open for colonization; at very high frequency ending in a species-thinning situation without perennial vegetation cover',
)
ru_lec_info_nb = LECInfo(
    language_id='nb',
    lec=ru_lec,
    name='Rasutsatthet',
    description='''Med ras menes forstyrrelse av skrånende mark ved at store snø-, is- eller vannmasser passerer over marka (inkludert fonnagufs, det vil si ekstremvinder forårsaket av store snøras). Ras medfører normalt ikke, som skred [spontan utrasing og nedadrettet transport av stedegne materialmasser (jord-, sand-, silt- eller leirskred) i en skråning, forårsaket av erosjon nedenfra eller fra sidene, eller av prosesser i massene], plutselig og omfattende biomassetap, men er et typisk eksempel på regulerende forstyrrelse [forstyrrelse som ved middels intensitet preger artssammensetningen gjennom relativt hyppige påvirkninger og på en slik måte at hver påvirkning verken forårsaker store endringer i artssammensetningen eller initierer en langvarig suksesjon (med flere års varighet)]. Endepunktet for gradienten i rasutsatthet (RU) utgjøres imidlertid av steder med svært høy rasintensitet, der rasene typisk består av grovt materiale som f.eks. store steiner eller inneholder store mengder amorft materiale som store jordblandete snø- eller vannmasser. På slike steder opprettholdes ikke permanente samfunn av flerårige arter, og raspåvirkningen blir disruptiv.
	Rasutsatthet (RU) adresserer intensiteten i forstyrrelseseffekten av ras slik denne gir seg utslag i artssammensetningen, sammenliknet med tilsvarende mark som ikke påvirkes av ras. Sannsynligheten for snøras er størst i lange dalsider (ofte, men ikke alltid, over talus) og under bratte og/eller høye bergvegger. Hvorvidt høy snørashyppighet resulterer i åpen (ikke tresatt) mark (rasmarkeng) eller skogsmark avhenger av snørasenes energi (snøens masse og hastighet). Hyppige snøras med middels høy energi hindrer eller bremser utviklingen av busk- og tresjikt, åpner markoverflata for nykolonisering, fremmer artsmangfoldet og kan resultere i en åpen, eng- eller heipreget vegetasjon (rasmarkeng og rasmarkhei) som har mange arter felles med semi-naturlig eng og kystlynghei. Variasjonen i artssammensetning som følge av raspåvirkning er kontinuerlig fra ingen påvirkning til disruptiv påvirkning. Til grunn for framlegget til basistrinninndeling er lagt at moderat raspåvirkning fører til endringer i artssammensetningen ved at nye arter kommer som begunstiges av moderat forstyrrelse kommer inn, og at ytterligere økning i raspåvirkning medfører artsuttynning som ender i disrupsjon. Dette variasjonsforløpet er beskrevet som en gradient med seks basistrinn, som for naturlig gjødsling (NG). Analyser av generaliserte artslistedata fra fastmarksskogsmark og observasjoner i fjellhei og leside indikerer at rasutsatte områder som uten tvil kan plasseres til disse typene bare er observerbar t forskjellige fra ikke rasutsatt mark, og derfor skal typifiseres som (utforminger av) fastmarksskogsmark/fjellhei, leside og tundra med RU∙a. Først når artssammensetningen avviker betydelig, f.eks. ved at raspåvirkningen er så sterk at en skogsmark ikke lenger kan opprettholdes, er raspåvirkningen moderat og grensa mellom RU∙a og RU∙b passeres. Rasutsatt skogsmark domineres ofte av andre treslag (dunbjørk, hengebjørk, osp, selje, alm, hassel, eller gråor) enn ikke-rasutsatt skogsmark. Trehøyden avtar med økende forstyrrelsesintensitet. Et areal tresatt med lave, krokete bjørketrær kan være fastmarksskogsmarkas utpost mot RU∙b. Rasutsatt skogsmark er et viktig levested for hvitryggspetten (Dendrocopos leucotos), som har sin nordeuropeiske hovedutbredelse på Vestlandet, samt for en rekke gammelskogsarter. Det skyldes at en viktig økosystemeffekt av snørasbetinget forstyrrelse er at tresjiktet periodevis åpnes (skades eller slås ned) og at det tilføres død ved. Sporadiske steinsprang kan lokalt ha samme effekt. En annen art som synes å bli favorisert av snørasbetinget forstyrrelse, er mnemosynesommerfuglen (Parnassius mnemosyne), som i Norsk rødliste 2006 (Kålås et al. 2006) er plassert i kategorien sårbar (VU). Mnemosynesommerfuglens hovedforekomstområder i Norge er ras- og skredområder på Nordvestlandet.
	Snøras fører ofte med seg mineralmateriale som er ’friskt’ i den forstand at mineralnæringsstoffer som er lett bundet ikke allerede er vasket ut. Finkornet, friskt forvitringsmateriale av bergarter som på stabil, jorddekket mark gir opphav til et surt og kalkfattig jordsmonn, som for eksempel granitt, har pH omkring 6 og gir opphav til en mineralnæringsrik ras- og skredmarksjord [kalkinnhold (KA) trinn KA∙fg svakt kalkrik].
	Til grunn for basistrinninndelingen av rasutsatthet (RU) er lagt at dette er en gradient som ender i et artsuttynningsintervall, at artsuttynningsintervallets nedre endetrinn er RU∙c, og at gradientens naturlige øvre endetrinn er der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da rasutsatthet (RU) deles i sju basistrinn.
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='RU.0',
    lec=ru_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='without rasp character'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='stable soil that is never affected by landslides and with a species composition that also does not indicate landslide exposure'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='uten raspreg'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='stabil mark som aldri påvirkes av ras og med en artssammensetning som heller ikke indikerer rasutsatthet'
)
# a
a_elem_segment=ElementarySegment(
    _id='RU.a',
    lec=ru_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='observably raspy'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='weak but observable (<1 ØAE) effect of landslide impact on species composition (compared to nature not affected by landslide); landslide-exposed forest land, mountain heath and leeward side with an observable sign of landslide impact'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='observerbart raspreget'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='svak, men observerbar (< 1 ØAE) effekt av raspåvirkning på artssammensetningen (sammenliknet med natur som ikke påvirkes av ras); rasutsatt skogsmark, fjellhei og leside med observerbart preg av raspåvirkning'
)
# b
b_elem_segment=ElementarySegment(
    _id='RU.b',
    lec=ru_lec,
    value='b',
    order=2,
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='a little raspy'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='clear effect of landslide on species composition; in contrast to the adjoining nature which lacks this character'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='litt raspreget'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='klar effekt av ras på artssammensetningen; til forskjell fra tilgrensende natur som mangler dette preget'
)
# c
c_elem_segment=ElementarySegment(
    _id='RU.c',
    lec=ru_lec,
    value='c',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='rather strongly raspy'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<description>',
    value='very clear effect of landslides on the species composition'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<class>',
    value='temmelig sterkt raspreget'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<description>',
    value='meget klar effekt av ras på artssammensetningen'
)
# de
de_elem_segment=ElementarySegment(
    _id='RU.de',
    lec=ru_lec,
    value='de',
    relative_order=4
)
ElementarySegment(
    _id='RU.d',
    lec=ru_lec,
    value='d',
    order=4,
    relative_order=0,
    parent=de_elem_segment
)
ElementarySegment(
    _id='RU.e',
    lec=ru_lec,
    value='e',
    order=5,
    relative_order=1,
    parent=de_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='en',
    key='<class>',
    value='very strongly raspy'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='en',
    key='<description>',
    value='the effect of landslides is so strong that clear species thinning takes place and rastolerant species dominate'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='nb',
    key='<class>',
    value='svært sterkt raspreget'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='nb',
    key='<description>',
    value='effekten av ras så sterk at tydelig artsuttynning finner sted og rastolerante arter dominerer'
)
# all
all_elem_segment=ElementarySegment(
    _id='RU.¤',
    lec=ru_lec,
    value='¤',
    order=6,
    relative_order=5
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<class>',
    value='disturbingly raspy'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<description>',
    value='area with such a strong landslide impact that permanent communities of perennial species are not maintained'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<class>',
    value='disruptivt raspreg'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<description>',
    value='område med så sterk raspåvirkning at permanente samfunn av flerårige arter ikke opprettholdes'
)
