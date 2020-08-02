# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% UE
ue_lec = LEC(
    _id='UE',
    structuringProcess_id='D',
    patternOfVariation_id='g',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=3,
)
ue_lec_info_en = LECInfo(
    language=en_language,
    lec=ue_lec,
    name='Risk of desiccation ',
    description='Variation in air humidity near the ground at the end of long-lasting dry periods, primarily relevant for poikilohydric species such as bryophytes and lichens, growing on rock; ranges from shaded sites with constant, high air humidity to open, sun-exposed slopes; factors affecting desiccation risk are canopy cover, topographic position and aspect',
)
ue_lec_info_nb = LECInfo(
    language=nb_language,
    lec=ue_lec,
    name='Uttørkingseksponering',
    description='''Poikilohydriske organismer er organismer som mangler eller har svært begrenset evne til å regulere vannutvekslingen med omgivelsene (Hosokawa et al. 1964). Poikilohydrisitet er typisk koblet til ektohydrisitet (det vil si at organismene tar opp vann og næringsstoffer direkte gjennom overflata; Buch 1947). De fleste (men ikke alle) moser og lav er poikilohydriske og ektohydriske. Slike organismer er fysiologisk aktive når de er oppfuktet, og går inn i en dvalemodus når de tørker ut. De fleste (men slett ikke alle) arter tåler uttørking, men toleransen overfor hyppig og gjentatt uttørking og oppfukting varierer mellom betydelig mellom artene.  Også mosenes (og lavenes) evne til å tåle langvarig uttørking (og høye temperaturer i tørr tilstand) varierer mellom arter (Proctor et al. 2007). Også evnen til å holde på vann varierer. Felles for poikilohydriske og ektohydriske organismer er at deres produksjon er positiv når de er fuktige og andre betingelser, som temperatur og stråling over visse minsteverdier, er oppfylt. For disse organismene er varigheten av tilstrekkelig fuktige forhold til å opprettholde fysiologisk aktivitet en av de aller viktigste forekomstbegrensende miljøvariablene. Varigheten av oppfuktet/uttørket tilstand er en av de variablene som best forklarer variasjon i artssammensetningen i mose- og lavdominerte samfunn (Busby & Whitfield 1978, Skre & Oechel 1981, R. Økland 1997a), f.eks. på nakent berg.
	Uttørkingsvarighet er imidlertid en svært kompleks miljøvariabel, og i forarbeidene til NiN versjon 2 (se NiN[2] Artikkel 2: kapittel B14) ble derfor en naturtypehypotese om at uttørkingsvarighet bør dekomponeres i to, mer eller mindre uavhengige, komponenter, testet. Analyse av generalisert datasett B14 bekrefter denne hypotesen. De to komplekse miljøvariablene som til sammen beskriver uttørkingsvarighet er betegnet overrisling (OR) og uttørkingseksponering (UE). Disse LKM er paralleller på ikke-jorddekt mark, inkludert nakent berg, til henholdsvis vannmetning (VM) og uttørkingsfare (UF) på jorddekt fastmark. Mens UF adresserer faren for ekstrem uttørking, kanskje 50- eller 100-årstørken, og er korrelert med topografi og jorddybde, adresserer. VM fuktighetsforholdene slik de stort sett er (‘median jordfuktighet’; R. Økland & Eilertsen 1993; se beskrivelsen av VM). Resultatene av analyser av datasett B14 viser at variasjonen langs OR og UE i stor grad er frikoblet i rom, i tid og med hensyn til artenes responser, slik tilfellet også er i fastmarksskogsmark der f.eks. alle kombinasjoner av UF (variasjonen fra frisk blåbærskog til tørkeutsatt lavskog) og VM [forekomsten av større eller mindre flekker, gjerne i små forsenkninger, av vegetasjon dominert av torvmoser (Sphagnum spp.) og andre arter som foretrekker fuktige voksesteder, men som også tåler langvarig uttørking)] er realisert. I NiN 2 legges derfor til grunn for bruk av OR og UE at det finnes en tilsvarende variasjon i artssammensetning relatert til faren for uttørking og normal fuktighet. Årsaken til bruk av parallelle sett av begreper for jorddekte marksystemer og nakent berg er forskjeller i mekanismer for tilførsel av vann, substratets evne til å holde på og lagre vann, og forskjeller i de dominerende primærprodusentenes vannhusholdning.
	Uttørkingseksponering (UE) uttrykker variasjon i luftas fuktighet nær marka, nær slutten av mer langvarige tørkeepisoder gitt konstant normal (median) substratfuktighet. UE er først og fremst relevant for ikke jorddekt mark (det vil si nakent berg), men i noen grad også for jorddekte systemer. Et gitt sted (på nakent berg) sin posisjon langs UE er et uttrykk for stedets eksponering for langvarige episoder med lav luftfuktighet. UE favner derfor enkeltmiljøvariabler som f.eks. forekomst av tresjikt (fra skyggefull, tett tresatt areal til åpen mark); topografisk plassering (fra dyp dal eller kløft uten direkte solinnstråling til topp eller i flatt lende, mer eller soleksponert for sollys og uttørkende vinder) og eksponeringsretning (fra nordøstvendt til sørvestvendt). Denne komplekse variabelen uttrykker ikke bare grad av eksponering for lav luftfuktighet, men er også et uttrykk for miljøstabilitet; fra ekstremt stabile miljøer i små hulrom i nordøstvendte bergvegger i skyggefull skogsmark i en kløft til konvekse bergknauser åpent plassert i terrenget som alltid er eksponert for sol. Analyser av generalisert artslistedatasett B14 (se NiN[2] Artikkel 2: kapittel B14, jf. sammenlikning med datasett B09) viser at variasjonen i artssammensetning relatert til UE på steder som ikke er overrislet (OR∙0) er minst like stor som variasjonen fra frisk til svært tørkeutsatt fastmarksskogsmark. Analysene viser også at det er grunnlag for å dele OR i minst fire standardtrinn innenfor T1 Nakent berg; variasjonen er imidlertid vanskelig å beregne eksakt fordi det skjer en betydelig artsuttynning mot den eksponerte ekstreme enden (sterk uttørkingseksponering). Det forhindrer likevel ikke et betydelig antall mosearter, f.eks. innen de store slektene Grimmia (knausing) og Schistidium (blomstermose), fra å ha optimum på svært uttørkingseksponert berg (jf. NiN[2] Artikkel 2: Tabell B14–5). Berg som er så ekstremt uttørkingsutsatt at tørke i seg sjøl forårsaker disruptiv forstyrrelse, er knapt realisert under norske klimaforhold. Lokalt skjer det imidlertid at moseflak på svært tynt mineraljorddekke over knauser blåser vekk vind eller ødelegges av tråkk etter langvarig tørke..
''',
)