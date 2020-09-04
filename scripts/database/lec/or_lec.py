# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% OR
or_lec = LEC(
    _id='OR',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=0,
)
or_lec_info_en = LECInfo(
    language_id='en',
    lec=or_lec,
    name='Supply of trickling surface water',
    description='Variation in the intensity (duration and frequency) of irrigation of bare rock by moving surface water, e.g., expressed by the length of the period a rock surface remains moist after rainfall, snowmelt etc.',
)
or_lec_info_nb = LECInfo(
    language_id='nb',
    lec=or_lec,
    name='Overrisling',
    description='''Poikilohydriske organismer er organismer som mangler eller har svært begrenset evne til å regulere vannutvekslingen med omgivelsene (Hosokawa et al. 1964). Poikilohydrisitet er typisk koblet til ektohydrisitet (det vil si at organismene tar opp vann og næringsstoffer direkte gjennom overflata; Buch 1947). De fleste (men ikke alle) moser og lav er poikilohydriske og ektohydriske. Slike organismer er fysiologisk aktive når de er oppfuktet, og går inn i en dvalemodus når de tørker ut. De fleste (men slett ikke alle) arter tåler uttørking, men toleransen overfor hyppig og gjentall uttørking og oppfukting varierer mellom betydelig mellom artene.  Også mosenes (og lavenes) evne til å tåle langvarig uttørking (og høye temperaturer i tørr tilstand) varierer mellom arter (Proctor et al. 2007). Også evnen til å holde på vann varierer. Felles for poikilohydriske og ektohydriske organismer er at deres produksjon er positiv når de er fuktige og andre betingelser, som temperatur og stråling over visse minsteverdier, er oppfylt. For disse organismene er varigheten av tilstrekkelig fuktige forhold til å opprettholde fysiologisk aktivitet en av de aller viktigste forekomstbegrensende miljøvariablene. Varigheten av oppfuktet/uttørket tilstand er en av de variablene som best forklarer variasjon i artssammensetningen i mose- og lavdominerte samfunn (Busby & Whitfield 1978, Skre & Oechel 1981, R. Økland 1997a), f.eks. på nakent berg.
	Uttørkingsvarighet er imidlertid en svært kompleks miljøvariabel, og i forarbeidene til NiN versjon 2 (se NiN[2] Artikkel 2: kapittel B14) ble derfor en naturtypehypotese om at uttørkingsvarighet bør dekomponeres i to, mer eller mindre uavhengige, komponenter, testet. Analyse av generalisert datasett B14 bekrefter denne hypotesen. De to komplekse miljøvariablene som til sammen beskriver uttørkingsvarighet er betegnet overrisling (OR) og uttørkingseksponering (UE). Disse LKM er paralleller på ikke-jorddekt mark, inkludert nakent berg, til henholdsvis vannmetning (VM) og uttørkingsfare (UF) på jorddekt fastmark. Mens UF adresserer faren for ekstrem uttørking, kanskje 50- eller 100-årstørken, og er korrelert med topografi og jorddybde, adresserer. VM fuktighetsforholdene slik de stort sett er (‘median jordfuktighet’; R. Økland & Eilertsen 1993; se beskrivelsen av VM). Resultatene av analyser av datasett B14 viser at variasjonen langs OR og UE i stor grad er frikoblet i rom, i tid og med hensyn til artenes responser, slik tilfellet også er i fastmarksskogsmark der f.eks. alle kombinasjoner av UF (variasjonen fra frisk blåbærskog til tørkeutsatt lavskog) og VM [forekomsten av større eller mindre flekker, gjerne i små forsenkninger, av vegetasjon dominert av torvmoser (Sphagnum spp.) og andre arter som foretrekker fuktige voksesteder, men som også tåler langvarig uttørking)] er realisert. I NiN 2 legges derfor til grunn for bruk av OR og UE at det finnes en tilsvarende variasjon i artssammensetning relatert til faren for uttørking og normal fuktighet. Årsaken til bruk av parallelle sett av begreper for jorddekte marksystemer og nakent berg er forskjeller i mekanismer for tilførsel av vann, substratets evne til å holde på og lagre vann, og forskjeller i de dominerende primærprodusentenes vannhusholdning.
	Overrisling (OR) uttrykker variasjon i substratets normale (mediane) fuktighet på ikke jorddekt mark, det vil si nakent berg, gitt konstant eksponering for sollys (på grunn av eksposisjonsretning og eventuell skygge fra trær), eller, mer generelt, luftas fuktighet [som kommer til uttrykk som variasjon langs LKM uttørkingseksponering (UE)]. Et gitt sted (på nakent berg) sin posisjon langs OR er derfor et uttrykk for hvor lenge substratet på stedet fortsatt er fuktig etter en nedbørsperiode på grunn av overflateavrenning, sammenliknet med steder med tilsvarende uttørkingseksponering og som mangler ekstra vanntilførsel fra overflateavrenning. Analyser av generalisert artslistedatasett B14 (se NiN[2] Artikkel 2: kapittel B14, jf. sammenlikning med datasett B09) viser at variasjonen i moseartssammensetning relatert til OR fra ikke overrislet berg til overrislet berg er vesentlig større enn langs VM i fastmarksskogsmark. Analysene viser videre at det er grunnlag for å dele OR i tre standardtrinn innenfor T1 Nakent berg. Med økende grad av overrisling finner det sted en homogenisering av artssammensetningen, med økende dominans av generalister, f.eks. Blindia acuta (rødmesigmose), Marsupella emarginata (mattehutremose) og Diplophyllum albicans (stripefoldmose). Overrisling øker mosene og lavene sin produktivitet og store moser og lav favoriseres på bekostning av små. Små arters mulighet til å finne egnete levesteder i sprekker og andre mikrohabitater er derfor liten der overrislingen er sterk og nær konstant (se NiN[2] Artikkel 2, Tabell B14–2,5). Periodevis overrisling, som ikke er sterkere enn at sprekker og små hulrom ikke overvokses av store moser, kan imidlertid være forenlig med høy artsrikdom. I tråd med resultatene av analyser av datasett B14 for moser på nakent berg er OR delt i fire basistrinn for å åpne for en viss fleksibilitet ved hovedtypetilpasset inndeling, f.eks. for å ta høyde for variasjonen i lavartssammensetning. Landstrand-delen av flomsonen langs elver (og innsjøer), representerer et kvalitativt forskjellig vanntilførselsregime med større innslag av vannbetinget forstyrrelse, som gir seg utslag i en betydelig forskjellig artssammensetning enn den man finner på overrislet berg.
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='OR.0',
    lec=or_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='not irrigated'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='on rock that is not or only insignificantly irrigated by surface runoff after precipitation and / or snowmelt'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='ikke overrislet'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='på berg som ikke eller bare i ubetydelig grad overrisles av overflateavrenning etter nedbør og/eller snøsmelting'
)
# ab
ab_elem_segment=ElementarySegment(
    _id='OR.ab',
    lec=or_lec,
    value='ab',
    relative_order=1
)
ElementarySegment(
    _id='OR.a',
    lec=or_lec,
    value='a',
    order=1,
    relative_order=0,
    parent=ab_elem_segment
)
ElementarySegment(
    _id='OR.b',
    lec=or_lec,
    value='b',
    order=2,
    relative_order=1,
    parent=ab_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='en',
    key='<class>',
    value='leachate affected'
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='en',
    key='<description>',
    value='places on rock which, due to surface runoff in periods after prolonged and / or concentrated precipitation, have a species composition that is observable or significant, but not significantly different from the species composition on rock without such surface runoff'
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='nb',
    key='<class>',
    value='sigevannspåvirket'
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='nb',
    key='<description>',
    value='steder på berg som på grunn av overflateavrenning i perioder etter langvarig og/eller konsentrert nedbør har en artssammensetning som er observerbart eller betydelig, men ikke vesentlig forskjellig fra artssammensetningen på berg uten slik overflateavrenning'
)
# c
c_elem_segment=ElementarySegment(
    _id='OR.c',
    lec=or_lec,
    value='c',
    order=3,
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='irrigated'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<description>',
    value='on rocks which for long periods after precipitation, e.g. due to the supply of leachate from overlying bogs, springs and / or snowdrifts, has a species composition that is significantly different from the species composition on rock without irrigation'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<class>',
    value='overrislet'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<description>',
    value='på berg som i lange perioder etter nedbør, f.eks. på grunn av tilførsel av sigevann fra ovenforliggende myrer, kilder og/eller snøfonner, har en artssammensetning som er vesentlig forskjellig fra artssammensetningen på berg uten overrisling'
)
