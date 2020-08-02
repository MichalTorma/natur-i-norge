# %%
from model import LEC
from model import LECInfo
from database_fill.language_data import en_language, nb_language
from database_fill.structuring_process_data import d_structuring_process
from database_fill.structuring_process_data import r_structuring_process
from database_fill.structuring_process_data import s_structuring_process
from database_fill.structuring_process_data import l_structuring_process
from database_fill.pattern_of_variation_data import f_pattern_of_variation
from database_fill.pattern_of_variation_data import g_pattern_of_variation
from database_fill.pattern_of_variation_data import ga_pattern_of_variation
from database_fill.pattern_of_variation_data import gs_pattern_of_variation
from database_fill.pattern_of_variation_data import t_pattern_of_variation
from database_fill.pattern_of_variation_data import mf_pattern_of_variation

# %% LK
lk_lec = LEC(
    _id='LK',
    structuringProcess=l_structuring_process,
    patternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=1,
    spatialScale=5,
)
lk_lec_info_en = LECInfo(
    language=en_language,
    lec=lk_lec,
    name='Slow secondary succession on coral reefs',
    description='Binary variable that separates two distinct stages in the development of coral reefs: young reefs dominated by living corals and aging reefs dominated by dead corals',
)
lk_lec_info_nb = LECInfo(
    language=nb_language,
    lec=lk_lec,
    name='Langsom sekundær suksesjon på korallrev',
    description='Korallrev (eller deler av korallrev) gjennomgår en naturlig aldringsprosess med to distinkte stadier: ‘unge’, levende rev med (dominans av) levende steinkoraller, og ‘aldrende rev’ med (dominans av) døde steinkoraller. Fordi tidsskalaer fra hundreår til tusenår er involvert og variasjonen gir seg utslag på romlige skalaer som opplagt er innenfor det skalaintervallet som adresseres på natursystemnivået i NiN 2, blir denne variasjonen beskrevet som en LKM.',
)

# %% MB
mb_lec = LEC(
    _id='MB',
    structuringProcess=d_structuring_process,
    patternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=3,
    spatialScale=6,
)
mb_lec_info_en = LECInfo(
    language=en_language,
    lec=mb_lec,
    name='Topsoil tilling',
    description='Binary variable that separates intensively managed land into two categories; land that is not regularly ploughed (i.e., subjected to topsoil tilling) from land that is regularly ploughed (and, in addition to tilling, often also fertilised and/or treated with herbicides)',
)
mb_lec_info_nb = LECInfo(
    language=nb_language,
    lec=mb_lec,
    name='Markbearbeiding',
    description='Sterkt endret jordbruksmark som er i aktiv bruk i norsk landbruk i dag kan fordeles på to ‘hoveddriftsformer’ som, både med hensyn til miljøforholdene og artssammensetningen (av jordbruksvekster og ugras) er vesentlig forskjellige; åker og varig eng. En åker er en fulldyrket mark som er pløyd og tilsådd (oftest også gjødslet og/eller sprøytet), der det dyrkes mat- eller fôrvekster, gjerne i monokultur. Åkeren pløyes og sås oftest til på nytt hvert år. Ugrassamfunnene består derfor overveiende av ettårige arter og det utvikles ikke engang forstadier til helhetlige økosystemer. Varig eng, på den andre siden, pløyes opp og så til igjen mye sjeldnere, typisk med (5–)10–15 års mellomrom, og rekker på denne tida å utvikle samfunn av flerårige arter. Det er forskjellen mellom de to driftsregimene som beskrives av variabelen markbearbeiding (MB).',
)

# %% MF
mf_lec = LEC(
    _id='MF',
    structuringProcess=s_structuring_process,
    patternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=3,
    spatialScale=5,
)
mf_lec_info_en = LECInfo(
    language=en_language,
    lec=mf_lec,
    name='Mire expanse character',
    description='Gradient in the species composition of mires, from sites close to adjacent non-wetland ground or with shallow peat typically dominated by generalist and forest species, to sites with deep peet in the interior parts of wetland massifs typically dominated by mire specialist species; the environmental basis of LEC MF is insufficiently understood, variables such as annual range of ground water fluctuations, drainage, peat aeration, nutrient turnover and light have been mentioned as potentially important',
)
mf_lec_info_nb = LECInfo(
    language=nb_language,
    lec=mf_lec,
    name='Myrflatepreg',
    description='''Det er lang tradisjon i Fennoskandia for å betrakte gradienten fra myrflate til myrkant som en av tre (fire) hovedgradienter i myrvegetasjonen. Dette er imidlertid først og fremst en lett gjenkjennbar artssammensetningsgradient som fortsatt står uten sikker økologisk forklaring. Den omfatter variasjonen fra områder på myr som ligger langt fra fastmark, med djup torv, der ei gruppe av typiske ‘myrflatearter’ forekommer rikelig, til fastmarksnære områder eller myr med tynnere torv, der myrkantarter dominerer. Artssammensetningsgradienten fortsetter via skogsmark på torv til fastmark. Myrflateartene er eksklusive myrplanter; de typiske mykmatteartene tilhører denne gruppa. Mange av myrkantartene, for eksempel treslagene og vier (Salix spp.), forekommer også på fastmarksskogsmark og/eller i engpregete økosystemer. Mulige økologiske forklaringer på variasjonen fra myrflate til myrkant er reduksjon i torvdybde, bedre drenering og bedre gjennomlufting av torva nær myrkanten på grunn av større årlige grunnvannsstandsvekslinger med et lavere minimumsnivå, større næringsomsetning og mineralnæringstilførsel, og økende skygge- og strøvirkning fra et tresjikt som ofte finnes.
	Ifølge tradisjonen etter Sjörs (1948, 1950) har nedbørsmyr (ombrogen myr) i sin helhet myrflatevegetasjon, selv om trebevokst nedbørsmyr har en god del skogsarter felles med fastmark. Malmer (1962: 74) påpeker imidlertid at arter som var begrenset til ’wooded bog areas’ (tresatt ombrogen myr), også hovedsakelig var begrenset til (minerogen) myrkant. Malmer påviser også at variasjonen fra åpen til tresatt ombrogen myr hadde sterke fellestrekk med (’similar to’) variasjonen fra myrflate til myrkant på minerogene myrdeler, om enn forskjellene i artssammensetning ikke var like sterke. Malmer (1962: 139) konkluderte derfor at det var naturlig å betrakte ’den ombrogene myrskogsmarka’ som myrkant. R. Økland (1989a, 1990b) trakk samme konklusjon i sine undersøkelser av myra Nordre Kisselbergmosen (Rødenes, Marker, Østfold). Denne oppfatningen blir derfor fulgt her. 
	Myrflatetrinnet er begrenset til åpen myr, mens myrkant kan være åpen mark eller skogsmark. Fremstad (1997) skiller myrflate fra myrkant og myrkant fra ‘sumpskog’ langs en (forlenget) gradient fra myrflate til myrkant, mens R. Økland et al. (2001b) mener at myrkant og ‘sumpskog’ verken kan skilles entydig på grunnlag av miljøegenskaper eller på grunnlag av artssammensetningen. Analysene av generalisert artslistedatasett B12 viser imidlertid at artssammensetningen i typiske utforminger av myr- og sumpskogsmark utgjør en forlengelse av artssammensetningsgradienten fra åpen myrflate til typisk åpen myrkant (NiN[2] Artikkel 2, kapittel B12). Sjøl om mosaikker mellom åpne, gjerne fuktigere partier og tresatte partier ofte forekommer i ‘sumpskoger’ og det ikke synes å være en entydig kobling mellom artssammensetningen i felt- og bunnsjikt på den ene siden og forekomsten at et tresjikt på den andre, er myr- og sumpskogsmark inkludert som trinn langs myrflatepreg (MF) i NiN 2.
	Det er ikke mulig å karakterisere myrflate og myrkant på annen måte enn ved hjelp av arters forekomst; en stor del av artene som forekommer i myr har preferanser for trinn langs denne økoklinen (se Moen 1990, Fremstad 1997). Typiske myrflatearter er mykmatteartene samt arter som dvergtettegras (Pinguicula villosa), brunskjene (Schoenus ferrugineus) og moseartene navargulmose (Pseudocalliergon trifarium), svelttorvmose (Sphagnum balticum) og lapptorvmose (S. subfulvum). Typiske myrkantarter er skogsmarksarter som for eksempel oreartene (Alnus spp.), bjørk, gran, de fleste vierarter (Salix spp.) og mjødurt (Filipendula ulmaria).
En grundig drøfting av økologiske årsaker til variasjon langs myrflatepreg (MF) [under betegnelsen ‘myrflate-myrkant’ (MM)] finnes hos R. Økland (1989a), som ikke fant grunnlag i litteraturen (eller egne data) for at det finnes viktige torvkjemiske forskjeller mellom myrflate og myrkant. Han mente i stedet at bedre gjennomlufting av torva i myrkanten kan være utslagsgivende for karplanter (inkludert trær), mens lys- og strøforhold kan være utslagsgivende for moser og lav. Moen (1990) sine studier på Sølendet (Brekken, Røros, STr) gir støtte til denne forklaringen. Han viser at myrkantsamfunn finnes på steder med mye lavere grunnvannsspeil (bedre gjennomlufting av torva) i tørre perioder (og større veksling i grunnvannsnivået gjennom vekstsesongen) enn myrflatesamfunnene. Dersom grundige økologiske undersøkelser bekrefter denne hypotesen, er det grunner for å betrakte flytematter som et ekstremtrinn langs gradienten. I sin beskrivelse av torvmoseartenes autøkologi, inkluderer Flatberg (2013) flytematter som egen kategori. Fordi det kan vise seg nødvendig å inkludere flytematter som eget trinn, er det hensiktsmessig å reversere retningen på gradienten i forhold til arbeidsdokumenter fram mot NiN 2 og tidligere versjoner av NiN[2] Artikkel 2 fra ‘myrkantpreg’ til myrflatepreg (MF) der flytematter kan hektes på som et siste trinn (eventuelt som en tolkning av MF∙f).
	Anerkjennelse av myrflatepreg (MF) som en viktig gradient i myrvegetasjonen har sterk rot i Fennoskandisk (og særlig skandinavisk) myrvitenskap, mens Wheeler & Proctor (2000) i sin oversikt over gradienter i nordvesteuropeiske våtmarker ikke anerkjenner dette som en viktig gradient. Argumenter for det skandinaviske synet er oppsummert og drøftet i større bredde av R. Økland et al. (2001b)
''',
)

# %% MX
mx_lec = LEC(
    _id='MX',
    structuringProcess=d_structuring_process,
    patternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=3,
    spatialScale=7,
)
mx_lec_info_en = LECInfo(
    language=en_language,
    lec=mx_lec,
    name='Category of anthropo-geneous disturbance',
    description='Binary variable separating semi-natural ground characterised by moderate anthropogenic disturbance processes but not contingent upon land management, from corresponding natural ground',
)
mx_lec_info_nb = LECInfo(
    language=nb_language,
    lec=mx_lec,
    name='Semi-naturlig mark/bunn uten hevdpreg, preget av moderat menneskebetinget forstyrrelse',
    description='Denne komplekse miljøfaktoren fanger opp alle kjente tilfeller av semi-naturlig endret mark/bunn, som er resultatet av menneskebetingete forstyrrelsesprosesser, som ikke er betinget av hevd, og med innbyrdes vesentlig forskjellig artssammensetning (se NiN[2] Artikkel 1: kapittel B4 og Vedlegg 5). For beskrivelse av hver enkelt klasse, se de respektive hovedtypene.',
)

# %% NG
ng_lec = LEC(
    _id='NG',
    structuringProcess=s_structuring_process,
    patternOfVariation=ga_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=1,
)
ng_lec_info_en = LECInfo(
    language=en_language,
    lec=ng_lec,
    name='Natural manuring',
    description='Variation in the amounts of N and P supplied (to the ground) by wild animals, e.g., seabirds, geese and reindeer; ends in a species-thinning situation typically with few plant species tolerant of hypertrophic conditions present',
)
ng_lec_info_nb = LECInfo(
    language=nb_language,
    lec=ng_lec,
    name='Naturlig gjødsling',
    description='''Naturlig gjødsling forekommer først og fremst i natur med svært høy tetthet av fugl (fuglefjell; natursystem-hovedtypene fugleberg og fuglefjell-eng), men også i annen natur kan artssammensetningen ha svakt eller moderat preg av naturlig gjødsling (for eksempel mosetundra). I noen grad kan også ekskrementer fra andre dyrearter, som for eksempel stasjonære reinsdyrstammer på Svalbard, resultere i lokal variasjon i artssammensetning relatert til gjødslingsintensitet. Uavhengig av hvilken dyregruppe som forårsaker gjødslingseffekten, gjenspeiler naturlig gjødsling (NG) variasjon i totalkonsentrasjonene av nitrogen og fosfor i jordsmonnet, som er mer eller mindre uavhengig av ’normal’ variasjon i mineralnæringstilgang, som kommer til uttrykk langs kalkinnhold (KA). I natur som ikke er påvirket av fuglegjødsling samvarierer imidlertid nitrogen og fosfor (sterkt) med substratets generelle mineralnæringsinnhold (kalkinnholdet). Naturlig gjødsling (NG) må ikke forveksles med tilstandsvariabelen eutrofieringstilstand (EU) som adresserer menneskebetinget variasjon i nitrogentilførsel, ved langtransportert eller fra lokal forurensning, som er en viktig kilde til variasjon i artssammensetning i en rekke natursystemer innenfor natursystem-hovedtypegruppene fastmarkssystemer, våtmarkssystemer og ferskvannssystemer.
	Til grunn for basistrinninndelingen av naturlig gjødsling (NG) er lagt at dette er en gradient som ender i et artsuttynningsintervall, at artsuttynningsintervallets nedre endetrinn er NG∙b, og at gradientens naturlige øvre endetrinn NG∙¤er der disruptivt miljøstress forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da erosjonsutsatthet (ER) deles i seks basistrinn.
''',
)

# %% OF
of_lec = LEC(
    _id='OF',
    structuringProcess=d_structuring_process,
    patternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=2,
)
of_lec_info_en = LECInfo(
    language=en_language,
    lec=of_lec,
    name='Cryoturbation',
    description='Variation in the intensity of disturbance by frost processes, from stable ground via sites slightly affected by frost heaving, to sites strongly disturbed by frost processes, on fine soil typically dominated by small bryophytes',
)
of_lec_info_nb = LECInfo(
    language=nb_language,
    lec=of_lec,
    name='Oppfrysing',
    description='''Oppfrysing (kryoturbasjon) er frostomrøring på ei ujevn markoverflate. Frostfordeling og iskjernedannelse i perioder med temperaturer omkring frysepunktet skjer på ulike vis i forsenkninger og på forhøyninger i terrenget, og jo grovere og mer steinete jorda er, desto lengre ned i bakken trenger frosten. Spenningsforskjeller som oppstår i jorda fører til at materialet sorteres; det groveste materialet skyves unna spenningsfeltet, og det fineste materialet fraktes mot overflata. De fysiske prosessene som er involvert er fortsatt ikke fullstendig forstått, men resultatet blir i typiske tilfeller en strukturmark med strukturer som varierer i formen fra ringer til polygoner, nett og striper. Den typiske polygonmarka består av et nettverk av mangekantete til sirkulære områder med finjord, inntil 6(–10) m i diameter, som omgis av en 0,5–2 m brei (eller breiere), ofte svakt hevet steinkant. Etter en tid (noen årtier eller århundrer) med kraftig frostaktivitet kan jorda stabilisere seg. Det finnes altså en gradient fra polygoner med sterk oppfrysingsaktivitet (og ustabil jord) til stabiliserte systemer. I områder med permafrost forsterkes kryoturbasjonsprosessene av at det aktive laget er tynt. Flekker med aktiv frostsprenging har liten eller ingen påvekst av skorpelav på steinene. Oppfrysing fremmes av regionale faktorer som lav nedbør og lav vintertemperatur, og lokale faktorer som flatt terreng med stein- og blokkrik mineraljord, manglende eller tynt isolerende snødekke (frostvirkningen øker mot rabber) og høy grunnvannstand. Hyppigheten av oppfrysingsfenomener øker derfor mot et mer kontinentalt klima og med økende høyde over havet. 
	Kryoturbasjon motvirker den nedadgående vannstrømmen i jorda og gir normalt opphav til et jordsmonn med større mineralnæringsinnhold og høyere pH enn typisk for området for øvrig (Dahl 1957, Jonasson & Sköld 1983). Dahl (1957) karakteriserer derfor kryoturbasjon som en form for ’dry flushing’.
	Oppfrysing er en blant flere frostprosesser (periglasiale prosesser). Frostprosesser er mest intense i områder med permafrost (tilstand der all jord under et visst djup er permanent frosset), men forekommer også på steder uten permafrost. Permafrost fører til intensivering av alle periglasiale prosesser, kanskje først og fremst oppfrysing (kryoturbasjon).
	Dahl (1957) bruker begrepet ’solifluksjon’ (som på norsk betyr jordbevegelse) i vid betydning, både om jordflyt i snever betydning (slik begrepet er definert i NiN 2) og om oppfrysing (‘amorphous solifluction’ og ‘structured solifluction’). I NiN er jordflyt (JF) behandlet som egen LKM da den er uttrykk for andre økologiske prosesser med til dels annen effekt på artssammensetningen.
''',
)

# %% OM
om_lec = LEC(
    _id='OM',
    structuringProcess=s_structuring_process,
    patternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=3,
    spatialScale=10,
)
om_lec_info_en = LECInfo(
    language=en_language,
    lec=om_lec,
    name='Oxygen deficiency',
    description='Variation in the intensity (duration and frequency) of hypoxic (<2 ml O2/L) and anoxic conditions in freshwater and marine water bodies; ending with a species-thinning situation towards permanently anoxic waters',
)
om_lec_info_nb = LECInfo(
    language=nb_language,
    lec=om_lec,
    name='Oksygenmangel',
    description='''I alle forekomster av stillestående vann (innsjøer, fjorder og litoralbasseng) er det av stor betydning for økosystemfunksjonen om vannmassene regelmessig blandes (sirkulerer) og om (og i tilfellet hvor ofte) overflatevannet i vannforekomsten skiftes ut. Fordi heterotrofe organismer (dyr og nedbrytere) forbruker oksygen, vil vannforekomster som ikke sirkulerer eller jevnlig skiftes utvikle oksygenfrie forhold i vannmassene og i de tilgrensende bunnsystemene. Tilgangen på oksygen begrenser hvilke livsformer som kan forekomme, både i saltvannsystemer og i ferskvannssystemer. Strengt aerobe organismer krever stabil oksygentilførsel. På steder med permanent oksygenfrihet finnes derfor bare organismer med anaerob respirasjon (først og fremst bakterier). Innsjøer uten sirkulasjon, med oksygenfritt bunnvannlag (monimolimnion) som aldri blander seg med øvrige vannlag med oksygenfritt bunnvann, kalles meromiktiske innsjøer.
	Den komplekse miljøgradienten oksygenmangel (OM) har anoksisk vann som sitt naturlige endetrinn (OM∙¤). Artstettheten avtar mot dette endetrinnet, men gradienten ender ikke i disruptivt miljøstress.
''',
)

# %% OR
or_lec = LEC(
    _id='OR',
    structuringProcess=s_structuring_process,
    patternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=0,
)
or_lec_info_en = LECInfo(
    language=en_language,
    lec=or_lec,
    name='Supply of trickling surface water',
    description='Variation in the intensity (duration and frequency) of irrigation of bare rock by moving surface water, e.g., expressed by the length of the period a rock surface remains moist after rainfall, snowmelt etc.',
)
or_lec_info_nb = LECInfo(
    language=nb_language,
    lec=or_lec,
    name='Overrisling',
    description='''Poikilohydriske organismer er organismer som mangler eller har svært begrenset evne til å regulere vannutvekslingen med omgivelsene (Hosokawa et al. 1964). Poikilohydrisitet er typisk koblet til ektohydrisitet (det vil si at organismene tar opp vann og næringsstoffer direkte gjennom overflata; Buch 1947). De fleste (men ikke alle) moser og lav er poikilohydriske og ektohydriske. Slike organismer er fysiologisk aktive når de er oppfuktet, og går inn i en dvalemodus når de tørker ut. De fleste (men slett ikke alle) arter tåler uttørking, men toleransen overfor hyppig og gjentall uttørking og oppfukting varierer mellom betydelig mellom artene.  Også mosenes (og lavenes) evne til å tåle langvarig uttørking (og høye temperaturer i tørr tilstand) varierer mellom arter (Proctor et al. 2007). Også evnen til å holde på vann varierer. Felles for poikilohydriske og ektohydriske organismer er at deres produksjon er positiv når de er fuktige og andre betingelser, som temperatur og stråling over visse minsteverdier, er oppfylt. For disse organismene er varigheten av tilstrekkelig fuktige forhold til å opprettholde fysiologisk aktivitet en av de aller viktigste forekomstbegrensende miljøvariablene. Varigheten av oppfuktet/uttørket tilstand er en av de variablene som best forklarer variasjon i artssammensetningen i mose- og lavdominerte samfunn (Busby & Whitfield 1978, Skre & Oechel 1981, R. Økland 1997a), f.eks. på nakent berg.
	Uttørkingsvarighet er imidlertid en svært kompleks miljøvariabel, og i forarbeidene til NiN versjon 2 (se NiN[2] Artikkel 2: kapittel B14) ble derfor en naturtypehypotese om at uttørkingsvarighet bør dekomponeres i to, mer eller mindre uavhengige, komponenter, testet. Analyse av generalisert datasett B14 bekrefter denne hypotesen. De to komplekse miljøvariablene som til sammen beskriver uttørkingsvarighet er betegnet overrisling (OR) og uttørkingseksponering (UE). Disse LKM er paralleller på ikke-jorddekt mark, inkludert nakent berg, til henholdsvis vannmetning (VM) og uttørkingsfare (UF) på jorddekt fastmark. Mens UF adresserer faren for ekstrem uttørking, kanskje 50- eller 100-årstørken, og er korrelert med topografi og jorddybde, adresserer. VM fuktighetsforholdene slik de stort sett er (‘median jordfuktighet’; R. Økland & Eilertsen 1993; se beskrivelsen av VM). Resultatene av analyser av datasett B14 viser at variasjonen langs OR og UE i stor grad er frikoblet i rom, i tid og med hensyn til artenes responser, slik tilfellet også er i fastmarksskogsmark der f.eks. alle kombinasjoner av UF (variasjonen fra frisk blåbærskog til tørkeutsatt lavskog) og VM [forekomsten av større eller mindre flekker, gjerne i små forsenkninger, av vegetasjon dominert av torvmoser (Sphagnum spp.) og andre arter som foretrekker fuktige voksesteder, men som også tåler langvarig uttørking)] er realisert. I NiN 2 legges derfor til grunn for bruk av OR og UE at det finnes en tilsvarende variasjon i artssammensetning relatert til faren for uttørking og normal fuktighet. Årsaken til bruk av parallelle sett av begreper for jorddekte marksystemer og nakent berg er forskjeller i mekanismer for tilførsel av vann, substratets evne til å holde på og lagre vann, og forskjeller i de dominerende primærprodusentenes vannhusholdning.
	Overrisling (OR) uttrykker variasjon i substratets normale (mediane) fuktighet på ikke jorddekt mark, det vil si nakent berg, gitt konstant eksponering for sollys (på grunn av eksposisjonsretning og eventuell skygge fra trær), eller, mer generelt, luftas fuktighet [som kommer til uttrykk som variasjon langs LKM uttørkingseksponering (UE)]. Et gitt sted (på nakent berg) sin posisjon langs OR er derfor et uttrykk for hvor lenge substratet på stedet fortsatt er fuktig etter en nedbørsperiode på grunn av overflateavrenning, sammenliknet med steder med tilsvarende uttørkingseksponering og som mangler ekstra vanntilførsel fra overflateavrenning. Analyser av generalisert artslistedatasett B14 (se NiN[2] Artikkel 2: kapittel B14, jf. sammenlikning med datasett B09) viser at variasjonen i moseartssammensetning relatert til OR fra ikke overrislet berg til overrislet berg er vesentlig større enn langs VM i fastmarksskogsmark. Analysene viser videre at det er grunnlag for å dele OR i tre standardtrinn innenfor T1 Nakent berg. Med økende grad av overrisling finner det sted en homogenisering av artssammensetningen, med økende dominans av generalister, f.eks. Blindia acuta (rødmesigmose), Marsupella emarginata (mattehutremose) og Diplophyllum albicans (stripefoldmose). Overrisling øker mosene og lavene sin produktivitet og store moser og lav favoriseres på bekostning av små. Små arters mulighet til å finne egnete levesteder i sprekker og andre mikrohabitater er derfor liten der overrislingen er sterk og nær konstant (se NiN[2] Artikkel 2, Tabell B14–2,5). Periodevis overrisling, som ikke er sterkere enn at sprekker og små hulrom ikke overvokses av store moser, kan imidlertid være forenlig med høy artsrikdom. I tråd med resultatene av analyser av datasett B14 for moser på nakent berg er OR delt i fire basistrinn for å åpne for en viss fleksibilitet ved hovedtypetilpasset inndeling, f.eks. for å ta høyde for variasjonen i lavartssammensetning. Landstrand-delen av flomsonen langs elver (og innsjøer), representerer et kvalitativt forskjellig vanntilførselsregime med større innslag av vannbetinget forstyrrelse, som gir seg utslag i en betydelig forskjellig artssammensetning enn den man finner på overrislet berg.
''',
)

# %% PF
pf_lec = LEC(
    _id='PF',
    structuringProcess=s_structuring_process,
    patternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=7,
)
pf_lec_info_en = LECInfo(
    language=en_language,
    lec=pf_lec,
    name='Permafrost',
    description='Binary variable that separates arctic-alpine ecosystems without and with permafrost, the latter  typically with a shallow active topsoil layer that thaws in summer; both categories may or may not be influenced by solifluction and/or cryoturbation',
)
pf_lec_info_nb = LECInfo(
    language=nb_language,
    lec=pf_lec,
    name='Permafrostbetinget ',
    description='''Permafrost innebærer at all jord under et visst djup er permanent frossen. Over den permanent frosne marka ligger det aktive laget, som tiner hver sommer (alle norske fastlandsområder har sommermiddeltemperatur over 0 °C). Permafrost defineres ofte som landmasser der temperaturen ikke i løpet av to år overstiger 0 °C (http://met.no/met/met_lex/l_p/ permafrost.html). Store deler av Norge er dekket av permafrost, men fordi man om sommeren kan måtte 1–3 m ned i bakken for å oppdage permafrosten, er den eksakte utbredelsen av permafrost i Norge mangelfullt kjent.
	Jordtemperaturen er avhengig både av sommer- og av vintertemperaturen. Forekomsten av et beskyttende snødekke om vinteren stabiliserer vintertemperaturen på et mye høyere nivå enn der snødekke mangler. Snødekkefordelingen varierer på skalaer fra det lokale (bestemt av rygger og forsenkninger, på skalaer ned til 5–10 m) til det regionale (nedbøren avtar fra oseaniske til kontinentale områder) og forårsaker så vel lokal som regional variasjon i forekomsten av permafrost. Fordi både kalde vintre og lav nedbør kjennetegner kontinentale fjellområder, synker permafrostgrensa sterkt fra oseaniske til kontinentale områder (fra vest mot øst og fra kyst til innland i Sør-Norge, og fra kyst til innland i Nord-Norge). I de østligste delene av Sør-Norge kan det hende at permafrost forekommer ned til under skoggrensa.
	Forekomst (eller ikke-forekomst) av permafrost har en rekke direkte og indirekte effekter på marksystemene. Permafrost fører til intensivering av alle periglasiale prosesser (frostprosesser), først og fremst oppfrysing (kryoturbasjon). For artssammensetningen og miljøforholdene i øvre marksjikt (og typetilhørighet på natursystemnivået i NiN) er det imidlertid uvesentlig om bakken er permanent frosset på fem meters dyp dersom det aktive laget ikke er utsatt for sterk frostvirkning. Omvendt vil forekomsten av kryoturbasjon og, ikke minst, jordflyt, ha store effekter på markegenskaper og artssammensetning også utenfor permafrostområdet. En egen LKM for permafrost, i tillegg til jordflyt (JF) og oppfrysing (OF), som også er sterkt koblet til forekomst av permafrost, er inkludert i NiN for, eventuelt sammen med JF og OF, å skille naturtyper som har permafrost som en nødvendig forutsetning, fra andre naturtyper i arktisk-alpine områder. Permafrost (PF) differensierer også en spesiell naturtype på permafrost med så tynt aktivt lag at dårlig drenering eller rask innfrysing av organisk materiale i permafrosten er utslagsgivende for økosystemenes struktur (arktisk permafrost-våtmark). Slike økosystemer finnes på Svalbard, men mangler i fastlandsfjellene fordi grunn jord og bratt terreng i mellomalpin og høgalpin bioklimatisk sone forhindrer utvikling av slike, karakteristiske permafrost-betingete natursystemer.
''',
)

# %% RU
ru_lec = LEC(
    _id='RU',
    structuringProcess=r_structuring_process,
    patternOfVariation=ga_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=3,
    spatialScale=5,
)
ru_lec_info_en = LECInfo(
    language=en_language,
    lec=ru_lec,
    name='Avalanche intensity',
    description='Variation in the intensity of regulating disturbance caused by large masses of snow, ice, soil or water moving over a sloping surface; typically bringing about removal of biomass in small patches that are laid open for colonization; at very high frequency ending in a species-thinning situation without perennial vegetation cover',
)
ru_lec_info_nb = LECInfo(
    language=nb_language,
    lec=ru_lec,
    name='Rasutsatthet',
    description='''Med ras menes forstyrrelse av skrånende mark ved at store snø-, is- eller vannmasser passerer over marka (inkludert fonnagufs, det vil si ekstremvinder forårsaket av store snøras). Ras medfører normalt ikke, som skred [spontan utrasing og nedadrettet transport av stedegne materialmasser (jord-, sand-, silt- eller leirskred) i en skråning, forårsaket av erosjon nedenfra eller fra sidene, eller av prosesser i massene], plutselig og omfattende biomassetap, men er et typisk eksempel på regulerende forstyrrelse [forstyrrelse som ved middels intensitet preger artssammensetningen gjennom relativt hyppige påvirkninger og på en slik måte at hver påvirkning verken forårsaker store endringer i artssammensetningen eller initierer en langvarig suksesjon (med flere års varighet)]. Endepunktet for gradienten i rasutsatthet (RU) utgjøres imidlertid av steder med svært høy rasintensitet, der rasene typisk består av grovt materiale som f.eks. store steiner eller inneholder store mengder amorft materiale som store jordblandete snø- eller vannmasser. På slike steder opprettholdes ikke permanente samfunn av flerårige arter, og raspåvirkningen blir disruptiv.
	Rasutsatthet (RU) adresserer intensiteten i forstyrrelseseffekten av ras slik denne gir seg utslag i artssammensetningen, sammenliknet med tilsvarende mark som ikke påvirkes av ras. Sannsynligheten for snøras er størst i lange dalsider (ofte, men ikke alltid, over talus) og under bratte og/eller høye bergvegger. Hvorvidt høy snørashyppighet resulterer i åpen (ikke tresatt) mark (rasmarkeng) eller skogsmark avhenger av snørasenes energi (snøens masse og hastighet). Hyppige snøras med middels høy energi hindrer eller bremser utviklingen av busk- og tresjikt, åpner markoverflata for nykolonisering, fremmer artsmangfoldet og kan resultere i en åpen, eng- eller heipreget vegetasjon (rasmarkeng og rasmarkhei) som har mange arter felles med semi-naturlig eng og kystlynghei. Variasjonen i artssammensetning som følge av raspåvirkning er kontinuerlig fra ingen påvirkning til disruptiv påvirkning. Til grunn for framlegget til basistrinninndeling er lagt at moderat raspåvirkning fører til endringer i artssammensetningen ved at nye arter kommer som begunstiges av moderat forstyrrelse kommer inn, og at ytterligere økning i raspåvirkning medfører artsuttynning som ender i disrupsjon. Dette variasjonsforløpet er beskrevet som en gradient med seks basistrinn, som for naturlig gjødsling (NG). Analyser av generaliserte artslistedata fra fastmarksskogsmark og observasjoner i fjellhei og leside indikerer at rasutsatte områder som uten tvil kan plasseres til disse typene bare er observerbar t forskjellige fra ikke rasutsatt mark, og derfor skal typifiseres som (utforminger av) fastmarksskogsmark/fjellhei, leside og tundra med RU∙a. Først når artssammensetningen avviker betydelig, f.eks. ved at raspåvirkningen er så sterk at en skogsmark ikke lenger kan opprettholdes, er raspåvirkningen moderat og grensa mellom RU∙a og RU∙b passeres. Rasutsatt skogsmark domineres ofte av andre treslag (dunbjørk, hengebjørk, osp, selje, alm, hassel, eller gråor) enn ikke-rasutsatt skogsmark. Trehøyden avtar med økende forstyrrelsesintensitet. Et areal tresatt med lave, krokete bjørketrær kan være fastmarksskogsmarkas utpost mot RU∙b. Rasutsatt skogsmark er et viktig levested for hvitryggspetten (Dendrocopos leucotos), som har sin nordeuropeiske hovedutbredelse på Vestlandet, samt for en rekke gammelskogsarter. Det skyldes at en viktig økosystemeffekt av snørasbetinget forstyrrelse er at tresjiktet periodevis åpnes (skades eller slås ned) og at det tilføres død ved. Sporadiske steinsprang kan lokalt ha samme effekt. En annen art som synes å bli favorisert av snørasbetinget forstyrrelse, er mnemosynesommerfuglen (Parnassius mnemosyne), som i Norsk rødliste 2006 (Kålås et al. 2006) er plassert i kategorien sårbar (VU). Mnemosynesommerfuglens hovedforekomstområder i Norge er ras- og skredområder på Nordvestlandet.
	Snøras fører ofte med seg mineralmateriale som er ’friskt’ i den forstand at mineralnæringsstoffer som er lett bundet ikke allerede er vasket ut. Finkornet, friskt forvitringsmateriale av bergarter som på stabil, jorddekket mark gir opphav til et surt og kalkfattig jordsmonn, som for eksempel granitt, har pH omkring 6 og gir opphav til en mineralnæringsrik ras- og skredmarksjord [kalkinnhold (KA) trinn KA∙fg svakt kalkrik].
	Til grunn for basistrinninndelingen av rasutsatthet (RU) er lagt at dette er en gradient som ender i et artsuttynningsintervall, at artsuttynningsintervallets nedre endetrinn er RU∙c, og at gradientens naturlige øvre endetrinn er der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da rasutsatthet (RU) deles i sju basistrinn.
''',
)

# %% SA
sa_lec = LEC(
    _id='SA',
    structuringProcess=s_structuring_process,
    patternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=4,
    spatialScale=4,
)
sa_lec_info_en = LECInfo(
    language=en_language,
    lec=sa_lec,
    name='Marine salinity',
    description='Variation in salinity (halinity), i.e., the concentration of salts, in water-mass and bottom and ground ecosystems in contact with or otherwise influenced by seasalt-enriched water; this LEC runs from hypohaline (fresh) water, defined as water with salinity < 0.5‰, via oligohaline, mesohaline, poly-haline and euhaline waters to metahaline ocean wa-ter with salinity typically in the range 34.2–35.5‰',
)
sa_lec_info_nb = LECInfo(
    language=nb_language,
    lec=sa_lec,
    name='Marin salinitet',
    description='''Variasjon i vannets og bunnen/markas salinitet (saltholdighet) er en viktig årsak til variasjon i artssammensetning i saltvannssystemer og områder i umiddelbar tilknytning til disse (først og fremst i fjærebeltesystemer). Marin salinitet (SA) er viktig over et stort spenn av romlige skalaer og naturtypenivåer. Saliniteten avtar generelt fra det åpne havet innover i fjordene. På lokal skala finnes variasjon i salinitet for eksempel nær utløpet av elver og bekker, og i forsenkninger som i perioder tilføres saltvann som kan stå og fordampe. Marin salinitet (SA) er en kompleks miljøgradient som består av flere enkeltgradienter med variasjon som bare delvis faller sammen. Viktigst er ’normalsaliniteten’, for eksempel definert som gjennomsnittlig saltholdighet i det havvannet som fjærebelte- eller saltvannsbunnen er i kontakt med. Andre viktige enkeltgradienter er maksimums- og minimumssaliniteten, for eksempel definert som den høyeste respektivt laveste saltholdigheten i bunnen/marka på et gitt sted i løpet av en gitt tidsperiode. Minimumssaliniteten har betydning for utbredelsen av dypvannsarter i fjorder. Relasjonen mellom normalsalinitet og maksimalsalinitet kan sammenliknes med relasjonen mellom vannmetning (VM) og uttørkingsfare (UF) i fastmarkssystemer; vannmetning (VM) gir utrykk for normal markfuktighet og uttørkingsfare (UF) gir uttrykk for risikoen for ekstremtørke. Til forskjell fra fuktighetsrelaterte komplekse miljøvariabler i fastmarkssystemer og våtmarkssystemer, er samvariasjonen mellom normal- og maksimalsaliniteten sterk, bortsett fra på steder der periodevis stagnerende saltvann får fordampe (pøler, litoralbasseng og saltenger) slik at saliniteten øker over normalnivået (hypersalinitetsepisoder). 
	Alt vann (og all jord) inneholder salter (i kjemisk betydning; det vil si vannløselige faste stoffer med krystallstruktur, dannet i reaksjon mellom en base eller et metall og en syre). Begrepet marin salinitet (saltholdighet) er imidlertid først og fremst knyttet til saltvannsinfluert vann, bunn eller mark, og trinn langs marin salinitet (SA) kan ordnes i en såkalt thalassisk serie etter økende konsentrasjon av salter som stammer fra havvann. Salinitet er det vanligst brukte begrepet for denne variasjonen, men også begrepet halinitet er i bruk. Begrepet halinitet refererer til forekomst av halider (halogenenes anioner; spesielt klorid-ionet Cl–), som er de anionene som er rikeligst representert i havsaltene. Begrepene salinitet og halinitet brukes til dels om hverandre. Ettersom det er den totale saltholdigheten som har biologisk betydning og ikke halidionekonsentrasjonen, blir begrepet marin salinitet benyttet i NiN. Internasjonale begreper har imidlertid ‘halin som suffiks.
	Trinndelingen av marin salinitet (SA) er tentativ og tar utgangspunkt i variasjonen i pelagisk fauna fra ferskvannstilknyttete til saltvannstilknyttete arter, der det antas at hele artssammensetningen skiftes ut og at det i tillegg finnes spesialiserte brakkvannstilknyttete arter. Trinnet SA∙g er inkludert for å ta høyde for at forskjeller i artssammensetning mellom kyst- og fjordvann (og arktisk vann) på den ene siden og atlantisk vann på den andre siden kan være betinget av salinitetsforskjeller. Grensa mellom disse vannmassetypene ved 34,8 ‰ svarer til grensa mellom euhalint og metahalint vann hos Hansen & Østerhus (2000: Tabell 2). 
	Tilpasninger til hypersalinitetsforhold medfører variasjon i artssammensetning som ikke bare kan ses på som en forlengelse av artssammensetningsgradienten langs marin salinitet (SA) og er derfor behandlet som en separat LKM, saltanriking av mark i fjærebeltet (SF). Trinnet SA∙+ utgjør derfor et overgangstrinn mellom de to gradientene.
''',
)

# %% SE
se_lec = LEC(
    _id='SE',
    structuringProcess=d_structuring_process,
    patternOfVariation=ga_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=1,
    spatialScale=6,
)
se_lec_info_en = LECInfo(
    language=en_language,
    lec=se_lec,
    name='Sedimentation intensity',
    description='Variation in the intensity of sedimentation in freshwater and marine sites where decelerating river water loses its mass transportation capacity and sedimentation regularly dominates over ero-sion, typically found in the outer parts of deltas; at high intensity ending in a species-thinning situation',
)
se_lec_info_nb = LECInfo(
    language=nb_language,
    lec=se_lec,
    name='Sedimentbasert forstyrrelse',
    description='''Massebalansen (hvorvidt materiale tilføres eller fjernes) er en svært viktig miljøvariabel i mange natursystemer. Massebalansen er negativ når substratet eroderes (i og langs elver først og fremst på steder der vannhastigheten er økende) og positiv når nytt substrat akkumuleres (først og fremst der vannhastigheten er avtakende, hvor transportert suspendert materiale sedimenteres). I havet og i større innsjøer er normalsituasjonen svak sedimentasjon fordi det meste av det tilførte materialet sedimenteres og blir ikke fjernet. Sedimentasjonsbasert forstyrrelse (SE) adresserer forstyrrelseseffekter av vedvarende, sterk sedimentasjon i ferskvannsbunnsystemer og saltvannsbunnsystemer. Sedimentasjon finner først og fremst sted i ytre deler av deltaområder utenfor utløpet av breelver og andre elver som transporterer mye masse. Der finner det sted en gradert sedimentasjon, slik at de største (tyngste) partiklene sedimenteres innerst, det minste (letteste) ytterst. Også forekomsten av moving dunes på saltvannsbunn kan muligens ses på som sedimentbasert forstyrrelse (SE).
	Til grunn for basistrinninndelingen av sedimentbasert forstyrrelse (SE) er lagt at dette er en artsuttynningsgradient, der artsuttynningsintervallet starter allerede ved overgangen mellom trinnene ER∙0 og ER∙a og at endepunktet befinner seg der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i) skal da sedimentbasert forstyrrelse (SE) deles i fire basistrinn.
	Også vannforstyrrelsesintensitet (VF) adresserer effekter av vann som forstyrrelsesagens i ferskvannssystemer, men VF adresserer mark/bunn med balanse mellom sedimentasjon og erosjon (SE∙0), og mellom vannets forstyrrelseseffekt og substratets kornstørrelsesfordeling. Sedimentasjonsbasert forstyrrelse (SE) er motsatsen til erosjonsutsatthet (ER) i den forstand at ER adresserer forstyrrelseseffekter av gjentatte erosjonsepisoder.
''',
)

# %% SF
sf_lec = LEC(
    _id='SF',
    structuringProcess=s_structuring_process,
    patternOfVariation=ga_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=3,
    spatialScale=2,
)
sf_lec_info_en = LECInfo(
    language=en_language,
    lec=sf_lec,
    name='Littoral hypersalinity',
    description='Variation in the extent to which seasalt concentrations in geolittoral and supralittoral soils are elevated above normal levels due to evaporation from stagnant saline water, e.g., in temporal tidal pools and depressions in tidal meadows; ends in a species-thinning situation characterised by a few, halophyte specialists',
)
sf_lec_info_nb = LECInfo(
    language=nb_language,
    lec=sf_lec,
    name='Saltanriking av mark i fjærebeltet',
    description='''Variasjon i vannets saltinnhold fra ferskvann til saltvann med normalt saltinnhold er en viktig årsak til variasjon i artssammensetning i saltvannssystemer og områder i umiddelbar tilknytning til disse (først og fremst fjærebeltesystemer). Marin salinitet (SA) benyttes for å beskrive denne variasjonen, både i vann og i bunn/mark. Enkelte steder i fjærebeltet, der stagnerende saltvann får stå i lengre perioder og fordampe (pøler, litoralbasseng og saltenger), øker markas salinitet over normalnivået (hypersalinitetsepisoder). Tilpasninger til hypersaline forhold medfører variasjon i artssammensetning som ikke bare kan ses på som en forlengelse av artssammensetningsgradienten langs marin salinitet (SA). Saltanriking av mark i fjærebeltet (SF) er derfor er behandlet som en separat lokal kompleks miljøvariabel i NiN 2. 
	Til grunn for basistrinninndelingen av saltanriking av mark i fjærebeltet (SF) er lagt at dette er en artsuttynningsgradient, der artsuttynningsintervallet starter allerede ved overgangen mellom trinnene ER∙0 og ER∙a og at endepunktet for gradienten befinner seg der disruptivt miljøstress forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da saltanriking av mark i fjærebeltet (SF) deles i fire basistrinn.
''',
)

# %% SH
sh_lec = LEC(
    _id='SH',
    structuringProcess=r_structuring_process,
    patternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=8,
)
sh_lec_info_en = LECInfo(
    language=en_language,
    lec=sh_lec,
    name='Categories of ground characterized by historical environmental stress or disturbance',
    description='Complex environmental factor that sorts ground characterised by historic disruptive stress and/or disturbance processes into categories with substantially different species composition; examples of categories are: landslide areas, glacier forelands, blockfields, polar deserts and pebble beaches',
)
sh_lec_info_nb = LECInfo(
    language=nb_language,
    lec=sh_lec,
    name='Spesiell mark/bunn preget av historisk miljøstress eller forstyrrelse',
    description='Denne komplekse miljøfaktoren fanger opp alle kjente tilfeller av spesiell mark/bunn som er resultatet av historiske disruptive stress- og/eller forstyrrelsesprosesser, som har gitt opphav til systemer med artssammensetning som er vesentlig forskjellig fra artssammensetningen i tilsvarende normale systemer, og dermed skal oppfattes som egne natursystem-hovedtyper i henhold til kriteriene i NiN[2] Artikkel 1: kapittel B4 og Vedlegg 5. For beskrivelse av hver enkelt klasse, se de respektive hovedtypene.',
)

# %% SM
sm_lec = LEC(
    _id='SM',
    structuringProcess=r_structuring_process,
    patternOfVariation=ga_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=1,
    spatialScale=10,
)
sm_lec_info_en = LECInfo(
    language=en_language,
    lec=sm_lec,
    name='Size-related environmental variation in marine and freshwater systems',
    description='Complex-gradient that expresses co-ordinated variation in environmental variables related to the surface area and depth of water masses, such as annual temperature amplitude (and, accordingly, the risk of overheating and freezing), hypersalinity, hypoxia and anoxia; the LEC covers variation from the open sea and large lakes to temporary pools which may lack persistent populations and thus represent a species-thinning situation',
)
sm_lec_info_nb = LECInfo(
    language=nb_language,
    lec=sm_lec,
    name='Størrelsesrelatert miljøvariabilitet (i vannsystemer)',
    description='''Miljøstabilitet (og miljøforutsigbarhet) er en viktig rammebetingelse for hvilke tilpasninger som er nødvendige for å overleve på et levested over tid. I romlig avgrensete vannforekomster (innsjøer, litoralbasseng, poller, fjorder) er størrelse (både horisontal og vertikal utstrekning) en av de viktigste prediktorer for miljøstabilitet. Størrelsen bestemmer langt på veg den årlige temperaturamplituden (maksimums- og minimumstemperaturen), og dermed faren for overoppheting og bunnfrysing, hypersalinitet og anoksi. Ett viktig skille i går mellom vannforekomster som er så grunne at de mangler sjiktning og dypere vannforekomster som to ganger årlig får ‘fornyet’ vannmassene. 
	Viktigheten av størrelsesrelatert miljøstabilitet for artssammensetning i vannforekomster kommer klart til uttrykk i Vannrammedirektivets innsjøtypologi (Anonym 2013), der to av sju ‘typologifaktorer’ (tilsvarer komplekse miljøvariabler) uttrykker størrelse; ‘Størrelse (overflateareal)’ med fire klasser [1 = små (< 0,5 km2); 2 = middels (0,5–5 km2); 3 = store (5–50 km2); 4 = svært store (> 50 km2)] og ‘Dybde innsjøer (middeldyp)’ med tre klasser [1 = svært grunn (< 3 m); 2 = grunn (3–15 m); 3 = dyp (> 15 m)]. Noen artsgrupper, som f.eks. fisk, forsvinner gradvis når innsjøene blir mindre. Men til tross for at kunnskapen om artenes fordeling langs en gradient i størrelsesrelatert miljøstabilitet er mangelfull, er det åpenbart at artssammensetningen varierer over et større spekter enn langs en rein artsuttynningsgradient når størrelsen går fra Mjøsa til en liten dam. I NiN 2er horisontal og vertikal utstrekning tentativt kombinert til én kompleks miljøvariabel som skal gi uttrykk for de to størrelsesdimensjonenes samlete betydning for miljøstabiliteten.
	Til grunn for basistrinninndelingen av størrelsesrelatert miljøvariabilitet (i vannsystemer) (SM) er lagt at gradienten ender i et artsuttynningsintervall, at artsuttynningsintervallets nedre endetrinn er SM∙d, og at gradientens naturlige øvre endetrinn er temporære vannforekomster der akvatiske arter opplever uttørking som disruptivt miljøstress som forhindrer opprettholdelse av permanente populasjoner. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da størrelsesrelatert miljøvariabilitet (i vannsystemer) (SM) deles i åtte basistrinn. I tillegg kommer trinnet g som er nødvendig for å fange opp den betydelige størrelsesrelaterte variasjonen innenfor litoralbasseng.
''',
)

# %% SP
sp_lec = LEC(
    _id='SP',
    structuringProcess=r_structuring_process,
    patternOfVariation=t_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=4,
    spatialScale=6,
)
sp_lec_info_en = LECInfo(
    language=en_language,
    lec=sp_lec,
    name='Hay-meadow character',
    description='Binary variable that separates hayfields from pastures; hayfields are cultivated areas with haymaking, periodic harvesting of biomass (up to three times a year) with no nutrient return; pastures are areas characterised by livestock grazing, trampling, manuring and continuous, selective removal of biomass',
)
sp_lec_info_nb = LECInfo(
    language=nb_language,
    lec=sp_lec,
    name='Slåttemarkspreg',
    description='''Todelingen i beitemark og slåttemark representerer en grov generalisering av de sammensatte og svært mangfoldige hevdregimene som har gitt opphav til semi-naturlig og sterkt endret jordbruksmark. De to kategoriene omfatter egentlig variasjon i mange andre egenskaper enn bare beiting og/eller slått (f.eks. rydding, brenning, gjødsling, pløying, tilsåing etc.), og kunne (burde?) derfor kanskje heller vært beskrevet som en flervariabel lokal kompleks miljøvariabel (fLKM). Hevdregimene har utviklet seg gjennom mange hundre år i nært samspill mellom befolkningens næringsbehov, kulturelle og økonomiske rammebetingelser, klima og andre naturgitte betingelser for utnyttelse av arealer til matproduksjon. Betegnelsene ‘beitemark’ og ‘slåttemark’ adresserer den dominerende hevdfaktoren. Innenfor hver av de to klassene finnes stor variasjon, for eksempel i beite- eller slåtteintensitet (slåttehyppighet), beite- og slåttetidspunkt (vår- og/eller høstbeite), beitetrykk, mellom ulike beitedyr, intervall mellom avsviinger, omfanget av manuell rydding av vedvekster, etc. Mens slåttemarkspreg (SP) er en lokal kompleks miljøvariabel som adresserer jordbruksmarkas dominerende hevdpreg beitemark eller slåttemark, brukes tilstandsvariabelen aktuelt brukspreg til å beskrive nåtidig bruk. Endret bruk (eller opphør av bruk) vil over år (hvor mange år vil avhenge av en lang rekke forhold) føre til at slåtte- eller beitemarkspreget svekkes og til slutt viskes helt ut.
	Semi-naturlige slåtte- og beiteenger har en felles flora av lyselskende arter, men slått og beite påvirker plantene på forskjellig måte slik at artssammensetningen under ellers like forhold er noe forskjellig i en beite- og i en slåttemark. Beitedyr er mer eller mindre selektive mens slått fjerner alle arter. Giftige arter, arter som smaker vondt, har torner eller høyt silikatinnhold i bladene har derfor konkurransefortrinn i beitemark, men ikke i slåttemark. Omvendt kan smakelige plantearter greie seg bedre i slåttemark. I beitemarka må ellers planteartene tåle å bli avbeitet gjentatte ganger og kunne regenerere raskt. Også i slåttemarka (som tradisjonelt ikke ble slått før tidligst 10. juli) er evne til regenerering viktig, men mange arter klarer seg godt i slåttemark fordi de gjør seg tidlig ferdig med blomstring og frøspredning, det vil si at de spirer seinhøstes eller tidlig om våren og rekker å sette frø før slåtten. 
	Slått medfører større uttak av næringsstoffer enn hva beite gjør. Semi-naturlige slåttemarker ble derfor vanligvis bare utviklet på relativt produktiv mark. For planter i slåttemark er også tidlig utvikling en fordel i seg sjøl fordi planten da kan rekke både å produsere biomasse og å trekke tilstrekkelig mye næring ned i rot og knopper nær jordoverflata før slåtten. I beitemark blir næringsstoffene i beiteplantene delvis tilbakeført med gjødsel og urin. Ved kjøttproduksjon tilbakeføres for eksempel inntil 95 % av den fosfor og det kalium som beiteplantene inneholder. Men næringsstoffene havner ikke på samme sted i beitemarka som de ble ‘høstet’ av beitedyra; dyrene forflytter næringsstoffene slik at arealer der dyrene ofte beiter etter hvert blir utarmet, mens blant annet hvileplasser blir tilført mye ekstra næring. Gjødselruker påvirker også vegetasjonen ved at planter blir ’kvalt’, men åpner samtidig nye muligheter, særlig for nitrogenelskende arter. Dyra skyr ofte gjødselflekker i lang tid slik at for eksempel brennesle som gjerne etablerer seg der, kan stå igjen i en ellers godt nedbeitet vegetasjon og spre seg derfra. Næringsstoffene i urin er lettere tilgjengelige enn næringsstoffene i gjødsel, men mye av nitrogeninnholdet i urin forsvinner til luft. Nedbryting av gjødsel og tilgjengeliggjøring av næringsstoffer for plantene går vanligvis fortere i semi-naturlige enn i sterkt endrete jordbunnsøkosystemer (oppdyrket varig eng). 
	I beitemark påvirkes plantene også av tråkk. Tråkk kan ha en direkte ødeleggende effekt (forstyrrelseseffekt) på plantene. For å tåle tråkk må en plante enten ha evne til å tåle mekanisk påvirkning eller den må kunne respondere raskt. Arter som tåler tråkk har konkurransefordeler i beitemark. Også for ett- og toårige arter kan tråkk være fordelaktig. Dyrenes tråkking lager hull og åpne flekker i tette grasmatter, noe som er gunstig for mange arter med kort livssyklus, som ofte trenger gode spiringsforhold for å forynge seg effektivt. Kortlivete arter er derfor vanligere i beite- enn i slåttemark. Tråkk påvirker også plantene indirekte ved å forandre jordstrukturen og dermed jordtemperaturen og jordas evne til å holde på vann og oksygen. Mange tråkktolerante beitemarksarter har derfor grunne rotsystemer. Semi-naturlig slåttemark ble ofte høstbeitet og kanskje også vårbeitet, men ikke ’kontinuerlig’ (jevnlig) påvirket av tråkk på samme måte som beitemarka. 
	De forskjellige effektene av slått og beite som dominerende hevdform gjør at beiteeng generelt er mer grasdominert enn slåtteeng, og at beiteenga kan ha et sterkt innslag av arter som ikke beites, som for eksempel engsoleie (Ranunculus acris) og tistler. Fordelingen av arter er mer ujevn enn i slåttemark på grunn av tråkk, dyrenes beitepreferanser og forekomsten av gjødsel- og urinflekker. Nitrogenkrevende arter er vanlig i beitemark (på grunn av gjødsel- og urintilførsel), og det er også forekomst av busker som ikke beites som for eksempel einer og nyperose (Rosa spp.). Beitemark med glissen tresetting (’hagemark’), kan inneholde mange ulike treslag og/eller buskarter, også som dominanter (eikehage, bjørkehage, einerhage, blandingshage med videre). Eksempler på arter som først og fremst forekommer i beitemark er knegras (Sieglingia decumbens), blåkoll (Prunella vulgaris), finnskjegg (Nardus stricta), kvitkløver (Trifolium repens), engsoleie (Ranunculus acris), markjordbær (Fragaria vesca), kattefot (Antennaria dioica) og einstape (Pteridium aquilinum).


	Slåtteenger er mer artsrike og rikere på urter enn beiteenger, gitt tilsvarende naturforhold, og artene (og individene av hver art) er jevnere fordelt. Slåttemark har ofte en tett grasmatte med flere sjikt som veksler i betydning gjennom sesongen. Flerårige arter dominerer, men vinterannueller finnes også. Arter som ikke ’tåler’ beite (det vil si tråkk og avbeiting), som for eksempel mange orkidéer, og arter som blir preferert ved beiting, som for eksempel rødkløver (Trifolium pratense), er vanlige. Den semi-naturlige slåttemarka var oftest helt åpen, men spredte hasselbusker har vært et vanlig innslag noen steder. Slåttemarka kunne imidlertid også være glissent tresatt med trær som ble styvet/lauvet (’lauveng’) eller tettere tresatt (’slåttemarksskog’). I Lierne (Ntr) ble slåttemark i utmark betegnet ‘høyskogja’, i Nordland ‘skogslått’. Utslått eller utmarksslått er den vanligste betegnelsen, som omfatter alle slags slåttemarker i utmark. Det som ble slått i skogen var vanligvis åpne glenner (kanskje etter svedjebruk eller svirydding), der det fantes et feltsjikt å slå.
	I gammel slåttemark (det vil si slåttemark som har vært i hevd i lang tid, gjerne hundrevis av år) er ofte mindre stein samlet i rydningsrøyser, mens store steiner ligger att på marka. Eksempler på arter som først og fremst forekommer i slåttemark er flekkgrisøre (Hypochoeris maculata), ballblom (Trollius europaeus), rødknapp (Knautia arvensis), hvitmaure (Galium boreale), orkidéene brudespore (Gymnadenia conopsea) og søstermarihånd (Dactylorhiza sambucina), hjertegras (Briza media), prestekrage (Chrysanthemum leucanthemum), storengkall (Rhinanthus major), ormetunge (Ophioglossum vulgatum), rødkløver (Trifolium pratense), storblåfjær (Polygala vulgaris), dunhavre (Avenula pubescens), enghavre (A. pratense), villtimotei (Phleum pratense ssp. nodosum) og jåblom (Parnassia palustis).
	For noen arters del varierer preferanse for slåtteeng eller beiteeng (og dermed også deres indikatorverdi for slått kontra beite som grunnleggende hevdform) mellom regioner innen Norge. Flere arter er sterkere avhengig av hevd (og dermed bedre indikatorer på slåttemarkspreg) nær kanten av sitt utbredelsesområde. Et eksempel er ballblom, som er sterkt knyttet til semi-naturlig slåttemark (og særlig kantene av slåttemarka) i lavlandet i den sørvestre delen av sitt utbredelsesområde, mens den i fjellet og nordover også kan forekomme i beitemark og er en kvantitativt viktig art også i kildevannspåvirket fastmarksskogsmark (høgstaudeskog).
	Selv om forskjellen i påvirkningsregime mellom beitemark og slåttemark i bruk gjenspeiles i en rekke egenskaper, blant annet artenes fordeling innenfor hver eng og vegetasjonsstrukturen, kan det være vanskelig å skille slåttemark og beitemark fra hverandre. Forskjellene blir dessuten gradvis mindre desto lengre tid som har gått siden siste gang et engstykke var i bruk. En hovedgrunn til at det i praktisk kartlegging i dag oftest er vanskelig å skille semi-naturlig beitemark og slåttemark fra hverandre, er at store arealer som tidligere var slåttemark ble lagt ut til beite i løpet av det forrige århundret, etter hvert som produksjon av fôr ble konsentrert til oppdyrka mark (varig oppdyrket eng) og etter hvert som kunstgjødsel overtok for husdyrgjødsel som viktigste gjødselkilde for innmarka. De gamle semi-naturlige beitemarkene, som ofte hadde lavere produksjonsevne enn slåttemarkene, ble da mange steder overlatt til gjengroing med trær mens semi-naturlige slåtteenger, som gjerne også lå nærmere gårdene, ble brukt som beitemarker. Slåtteenger kan beholde ’slåttemarkspreget’ relativt lenge, særlig hvis de beites av storfe og beitetrykket ikke er for hardt. Etter hvert vil imidlertid de ’beiteømfintlige’ artene som karakteriserte slåttemarka forsvinne, mens arter som begunstiges av beite vil øke i mengde. Også i tidligere tider fant det sted endringer i hvordan jordbruksarealer ble utnyttet, og arealer kan derfor ha blitt brukt på ulike måter i ulike perioder. Noen slike forskjeller reflekteres i artssammensetningen den dag i dag (Gustavsson 2007).
	Analyser av generaliserte artslistedatasett fra semi-naturlige enger og varig oppdyrket mark (B07, se NiN[2] Artikkel 2, kapittel B7], viser en observerbar forskjell mellom beitemark og slåttemark. Slåttemarkspreg (SP) er derfor delt i to basisklasser.
''',
)

# %% SS
ss_lec = LEC(
    _id='SS',
    structuringProcess=d_structuring_process,
    patternOfVariation=gs_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=2,
    spatialScale=3,
)
ss_lec_info_en = LECInfo(
    language=en_language,
    lec=ss_lec,
    name='Sand stabilisation',
    description='Variation in sand-dune stability, brought about by the tendency of sand to become more stable at increasing distances from the sand source (typically the coastline); LEC SS runs from naked sand-dominated littoral seabeds via active sand-dune systems to forests on stabilised sand and thus is a primary successional gradient starting with vascular plants colonising naked sand (this contrasts primary successions on rock substrates, which start with colonisation by mosses and lichens and continues with slow soil accumulation)',
)
ss_lec_info_nb = LECInfo(
    language=nb_language,
    lec=ss_lec,
    name='Sandstabilisering',
    description='''Strender som tilføres store mengder sand fra havsida, som transporteres videre innover land av sterke vinder, vil normalt utvikle seg til sanddynemark. Sandstabilisering (SS) er en kompleks miljøvariabel som gir uttrykk for den økende stabiliseringen av sanddynene med økende avstand fra strandlinja, som er resultatet av primær suksesjon (vegetasjonsetablering). Med økende avstand fra stranda øker tiden siden suksesjonen startet, samtidig som en rekke viktige miljøegenskaper endrer seg: sandtilførselen avtar, vindforstyrrelsen avtar, sanda stabiliseres og en gradvis jordsmonnutvikling finner sted som innebærer akkumulering av humus og økende evne til å holde på jordfuktigheten, men også utvasking av næringsstoffer og forsuring. Artstettheten øker et langt stykke ut i denne primære suksesjonen før det flater ut og etter hvert synker igjen.
	Begrepet ’stabilisering’ er valgt framfor alternative begreper som for eksempel ’etablering’ fordi sandbindingen (stabiliseringen av sanda) og etter hvert også oppbyggingen av et humuslag er de fundamentale prosessene i sanddynedynamikken..
	Sandstabilisering (SS) er beskrevet som en egen kompleks miljøvariabel fordi primærsuksesjonsforløpet ved stabilisering og kolonisering av flygesand skiller seg fra alle andre primærsuksesjonsforløp i en rekke henseender, både med hensyn til økologiske og geologiske prosesser. Dominerende geomorfologiske (landformdannende) prosess er vindvirkning (aeoliske prosesser; se NiN[1] Artikkel 17). I motsetning til suksesjoner på bergsubstrat, er karplanter (først og fremst sandbindende gras) de første innvandrerne mens moser og lav først kommer inn når sanda begynner å bli stabilisert. Primær suksesjon i andre fastmarkssystemer kjennetegnes ved oppbygging av et jordsmonn og akkumulering av mineralnæringsstoffer. Jordsmonnoppbygging finner også sted gjennom et sandstabiliseringsforløp; økende grad av stabilisering innebærer økende tjukkelse på humuslaget. Men i motsetning til langs andre primærsuksesjonsgradienter er den ’friske’ sanda som tilføres i tidlige suksesjonstrinn rikest på mineralnæring. 
	Sandstabilisering (SS) kommer til uttrykk som mer eller mindre distinkte soner fra strandlinja gjennom åpen sanddynemark til bakenforliggende skogsmark. Sonasjon og suksesjon følger hverandre derfor i stor grad langs denne komplekse miljøvariabelen. Endringen i artssammensetning er stor. De tidlige suksesjonstrinnene består av enkelt- eller få-artssamfunn eller vegetasjonsfrie sandflater som i henhold til retningslinjene for trinndeling skal oppfattes som separate basistrinn (SS∙a–c). Det foreligger ikke analyser som tallfester omfanget av endringer i artssammensetning i de mer etablerte delene av gradienten (SS∙dd–j); basistrinninndelingen for disse delene er derfor tentativ. 
''',
)

# %% SU
su_lec = LEC(
    _id='SU',
    structuringProcess=d_structuring_process,
    patternOfVariation=ga_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=3,
    spatialScale=4,
)
su_lec_info_en = LECInfo(
    language=en_language,
    lec=su_lec,
    name='Landslide intensity',
    description='Variation in the intensity of disturbance by landslides in clay- to gravel-dominated quaternary deposits; the term ‘landslide’ is used for situations where a part of the substrate with its biomass is detached and new mineral material is exposed; ends in a species-thinning situation at which a primary succession is initiated after each landslide event',
)
su_lec_info_nb = LECInfo(
    language=nb_language,
    lec=su_lec,
    name='Skredutsatthet',
    description='''Med skred menes spontan utrasing og nedadrettet transport av stedegne materialmasser (jord-, sand-, silt- eller leirskred) i en skråning, forårsaket av erosjon nedenfra eller fra sidene, eller av prosesser i massene. Skred, til forskjell fra ras (forstyrrelse i skråning forårsaket av at snø-, is- eller vannmasser passerer over marka), innebærer at marka med sitt innhold av organismer, går tapt og at ny mark eksponeres. Skred innebærer derfor (i utgangspunktet) en mer gjennomgripende forstyrrelse av marka enn ras, og innebærer starten på et primærsuksesjonsforløp.
	Skredutsatthet (SU) adresserer intensiteten i forstyrrelseseffekten av skred slik denne gir seg utslag i artssammensetningen, sammenliknet med tilsvarende mark som ikke utsettes for skred. Fordi skredintensiteten varierer [intensiteten av en forstyrrelse, eller dens omfang; bestemmes av tre ’dimensjoner’: grad (severity), frekvens (recurrence) og romlig utstrekning (spatial extent)], og denne variasjonen gir seg utslag i hvor sterkt artssammensetningen på skredutsatt mark avviker fra artssammensetningen på sammenliknbar, ikke skredutsatt mark, blir skredutsatthet (SU) beskrevet som en kompleks miljøgradient. Variasjonen i artssammensetning som respons på variasjon i skredutsatthet (SU) vil imidlertid bare være kontinuerlig inntil det punktet der skredintensiteten passer ei grense, først og fremst med hensyn til grad og romlig utstrekning, og skred forekommer så sjelden, at skredområdet vil fungere som et eget økosystem preget av historisk disruptiv forstyrrelse og gå inn i en langsom primær suksesjon (LA). Hvor stor forskjell i artssammensetningen i forhold til sammenliknbar, ikke skredutsatt natur som kan forekomme før denne grensa passeres, vil sannsynligvis variere mellom natursystemer. Skredutsatthet (SU) er tentativt delt inn i tre basistrinn mellom MU∙0 (ikke skredutsatt mark) og endetrinnet MU∙¤, som inneholder mark preget av historisk disruptiv forstyrrelse og som etter kriteriene for hovedtypeinndeling skal tilordnes en annen hovedtype (jf. NiN[2] Artikkel 1, kapittel B4). Til grunn for trinninndelingen er lagt at det finnes et mellom-basistrinn før artsuttynning inntreffer (i trinn MU∙b), og at det er rom for ett basistrinn før disruptiv forstyrrelse inntreffer. Det finnes imidlertid ikke empirisk materiale som rettferdiggjør mer enn ett basistrinn (i skredutsatt fastmarksskogsmark; se NiN[2] Artikkel 2, kapittel B9).
	Små, hyppige skred resulterer i at mineraljord blottlegges ofte nok til at artssammensetningen får innslag av arter som prefererer eller tolererer denne formen for forstyrrelse (f.eks. små mosearter som har evne til rask kolonisering av ny mark, og karplantearter som er avhengig av blottlagt mineraljord for å spire).
''',
)

# %% SV
sv_lec = LEC(
    _id='SV',
    structuringProcess=s_structuring_process,
    patternOfVariation=ga_pattern_of_variation,
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

# %% SX
sx_lec = LEC(
    _id='SX',
    structuringProcess=d_structuring_process,
    patternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=7,
)
sx_lec_info_en = LECInfo(
    language=en_language,
    lec=sx_lec,
    name='Categories of strongly modified ground',
    description='Complex environmental factor that sorts ground/ bottom strongly modified by anthropogeneous disturbances (but not contingent on historical land management) into categories such as: sites with upper layer removed, sites where a new substrate is deposited, e.g., resulting from regulation of watercourses or construction',
)
sx_lec_info_nb = LECInfo(
    language=nb_language,
    lec=sx_lec,
    name='Sterkt endret mark/bunn uten hevdpreg, preget av menneskebetinget forstyrrelse',
    description='Denne komplekse miljøfaktoren sorterer sterkt endret mark/bunn som er resultatet av menneskebetingete forstyrrelsesprosesser og som ikke er betinget av hevd i kategorier som antas å ha innbyrdes vesentlig forskjellig artssammensetning (se NiN[2] Artikkel 2: kapittel B4 og Vedlegg 5.) For beskrivelse av hver enkelt klasse, se de respektive hovedtypene.',
)

# %% SY
sy_lec = LEC(
    _id='SY',
    structuringProcess=d_structuring_process,
    patternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=10,
)
sy_lec_info_en = LECInfo(
    language=en_language,
    lec=sy_lec,
    name='Categories of strongly modified water masses',
    description='Complex environmental factor that sorts water masses strongly modified by anthropogeneous disturbances such as physical, chemical or biological interventions, and/or new water masses (artificial lakes, pools, etc.), into categories',
)
sy_lec_info_nb = LECInfo(
    language=nb_language,
    lec=sy_lec,
    name='Sterk endring av vannmasser',
    description='Denne komplekse miljøfaktoren sorterer sterkt endrete vannmasser som er resultatet av menneskebetingete forstyrrelsesprosesser i kategorier som antas å ha innbyrdes betydelig forskjellig artssammensetning (se NiN[2] Artikkel 1: kapittel B4 og Vedlegg 5.) For beskrivelse av hver enkelt klasse, se de aktuelle hovedtypene.',
)

# %% S3
s3_lec = LEC(
    _id='S3',
    structuringProcess=s_structuring_process,
    patternOfVariation=mf_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
s3_lec_info_en = LECInfo(
    language=en_language,
    lec=s3_lec,
    name='Sediment sorting',
    description='Complex environmental variable consisting of three single LECs: erosion resistance (NiN code S3E; running from suspended material with no resistance to erosion, to bedrock); fine-matter content (S3F; the fraction of substrate made up by silt and clay); and special sediments (S3S; a categorical variable that includes, e.g., shellsand, coral gravel and submerged peat)',
)
s3_lec_info_nb = LECInfo(
    language=nb_language,
    lec=s3_lec,
    name='Sedimentsortering',
    description='''Sedimentsortering er en flerdimensjonal lokal kompleks miljøvariabel (fLKM) som adresser hele spekteret av økologiske effekter av viktige prosesser knyttet til sedimentenes kornstørrelsesfordeling. I NiN versjon ble dette komplekset av variasjon håndtert som én ‘lokal basisøkoklin’, kornstørrelse (KO), som fordelte variasjonen i dominerende kornstørrelse fra leire til fast fjell på 9 kornstørrelsesklasser med tillegg av 6 såkalte ‘spesialtrinn’ for spesielle, først og fremst biogene, substrater. Kornstørrelsen blir beskrevet ved bruk av Wentworths kornstørrelsesskala (Wentworth 1922) med 25 klasser som hver omfatter et intervall der kornstørrelsen dobles (gjengitt som NiN[2] Artikkel 1, Tabell B3–5). Dette er ulogisk i NiN-sammenheng fordi det ikke er noen entydig, monoton sammenheng mellom gradienter i artssammensetning og gradienter i sedimentenes kornstørrelsesfordeling. Derfor er det heller ikke er mulig å transformere fysisk kornstørrelse til én variabel som artssammensetningen er lineært relatert til ved én enkel transformasjon. I NiN versjon 2 er sedimentsortering derfor behandlet på to måter. På saltvannsbunn er det identifisert to viktige gradienter i artssammensetning som er nært knyttet til prosessene som forårsaker variasjon i sedimentenes kornstørrelsesfordeling. Disse inngår som to komplekse miljøgradienter i den flerdimensjonale lokale komplekse miljøvariabelen (fLKM) sedimentsortering (S3): erosjonsmotstand (S3E) og finmaterialinnhold (S3F). I tillegg finnes flere kategorier av biogene substrater som har egenskaper som gjør at deres artssammensetning skiller seg betydelig eller vesentlig fra sorterte sedimenter som er sammenliknbare med hensyn til plassering langs S3E og S3F). Disse er inkludert i S3 som en kategorisk variabel, spesielle sedimenter (S3S). I ferskvannsbunnsystemer er kornstørrelsesfordelingen enten et direkte uttrykk for vannforstyrrelsesintensitet (VF), eller av mindre betydning og opphav til mindre forskjeller i artssammensetning mellom spesifikke substratkategorier. Det samme er tilfellet i fastmarkssystemer. I disse systemene benyttes derfor en forenklet oppdeling, operasjonalisert som faktorvariabelen dominerende kornstørrelsesklasse (S1) som inneholder basisklasser for ulike kornstørrelser som fritt kan kombineres til hovedtypetilpassete trinn på grunnlag av kunnskap eller antakelser om omfanget av variasjon i artssammensetning som de gir opphav til. De to alternative måtene å beskrive variasjon relatert til sedimentsortering og kornstørrelse blir betegnet henholdsvis S3 (trevariabel-skjemaet; se NiN[2] Artikkel 1 Fig. B3–6) og S1 (envariabel-skjemaet). 
''',
)

# %% S3E
s3e_lec = LEC(
    _id='S3E',
    parentLec=s3_lec,
    structuringProcess=s_structuring_process,
    patternOfVariation=mf_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
s3e_lec_info_en = LECInfo(
    language=en_language,
    lec=s3e_lec,
    name='Erosion resistance',
    description='Running from suspended material with no resistance to erosion, to bedrock',
)
s3e_lec_info_nb = LECInfo(
    language=nb_language,
    lec=s3e_lec,
    name='Erosjonsmotstand',
    description='''Erosjonsmotstand (S3E) er første ‘dimensjon’ i S3-skjemaet fordi erosjonsmotstanden, eller eroderbarheten, anses som viktigste LKMg for å forklare variasjon i artssammensetning relatert til sedimentsammensetning. En presis definisjon av erosjonsmotstand er ‘et sediments evne til å motstå vannerosjon; målt som kritisk skjærstyrke, samt sedimentets evne til å motstå andre ytre påvirkninger slik det kommer til uttrykk gjennom sedimentets kornstørrelsesfordeling’. Begrepet kritisk skjærstyrke (critical shear strength) defineres i NiN med utgangspunkt i Bjerkeng & Molvær (2002) som ’kraften som må utøves for å gi begynnende oppvirvling, enten for enkeltkorn for grovere sedimenter (sand og grovere) eller for sedimentet som helhet for såkalt kohesive sedimenter som har betydelig innslag av silt og leire’. Kritisk skjærstyrke (og erosjonsmotstand) følger en J-formet kurve, den såkalte ‘Hjulström-figuren’, som funksjon av dominerende kornstørrelse (se NiN[2] Artikkel 1, Fig. B3–7; se også NiN[1] Artikkel 14, Hjulström 1935, Shields 1936, Bjerkeng & Molvær 2002 og Sulebak 2007). Kurvens form gjør at det innenfor hvert eroderbarhetsnivå finnes sedimenter med svært ulike dominerende kornstørrelser; stor erosjonsmotstand finner vi både i faste leirsedimenter og steindominerte sedimenter mens fin sand er det lettest eroderbare sedimentet. Innenfor silt- og leirdominerte sedimenter øker erosjonsmotstanden med økende ’pakking’ av sedimentene; det er en gradvis overgang mellom leirsedimenter og leirstein (forsteinet leire). Istidsavsetninger av fast blåleire (’moreneleire’) kan være nesten like faste som (løse) bergarter som f.eks. sandsteiner. Leirrike sedimenters erosjonsmotstand er også avhengig av sedimentenes vanninnhold, og vanninnholdet er indirekte og direkte viktig for sedimentenes funksjon som livsmedium, både for planter og for dyr.
	I sublitorale sedimentbunnsystemer er sedimentene i stor grad vasket ut og sortert av eroderende krefter (bølge- og strømvirkning) slik at kornstørrelsesfordelingen gjenspeiler sedimentenes (iboende) motstand mot erosjon. Erosjonsmotstand er derfor et godt begrep for den første dimensjonen innenfor S3 i disse systemene.
''',
)

# %% S3F
s3f_lec = LEC(
    _id='S3F',
    parentLec=s3_lec,
    structuringProcess=s_structuring_process,
    patternOfVariation=mf_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
s3f_lec_info_en = LECInfo(
    language=en_language,
    lec=s3f_lec,
    name='Fine-matter content',
    description='The fraction of substrate made up by silt and clay',
)
s3f_lec_info_nb = LECInfo(
    language=nb_language,
    lec=s3f_lec,
    name='Finmaterialinnhold',
    description='''Finmaterialinnhold (S3F) er viktig for å beskrive variasjon i artssammensetningen fordi det på hvert trinn langs eroderbarhetsgradienten finnes finere og grovere sedimenter. Forskjellen mellom disse er avgjørende for sedimentenes innhold av gravende fauna (infauna) og påvekstorganismer (epifauna). Fra artssammensetningssynspunkt er ’mellomklasser’ med hensyn til finmaterialinnhold, som f.eks. finmaterialrik steinbunn, viktige fordi finmaterialet skaper levevilkår for arter som er knyttet til finere sedimenter (sedimenter med lavere erosjonsmotstand). Årsaken til at slike blandete sedimenter forekommer, er at partikler som stikker opp fra bunnen får redusert erosjonsmotstand, mens partikler som gjemmer seg mellom større partikler får økt erosjonsmotstand i forhold til et homogent sediment (Shvidchenko et al. 2001). Med finmateriale menes i denne sammenhengen organisk og uorganisk materiale med kornstørrelse < 1/16 mm (silt og leire). Finamterialinnhold angis som vektprosentandel i sedimentet.
	Finmaterialinnholdet på sublitoral sedimentbunn er resultatet av en dynamisk balanse mellom erosjon av det opprinnelige sedimentet og tilførsler av finmateriale. Sedimentene inneholder det materialet som under de rådende forholdene, fram til i dag, ikke har blitt vasket vekk. Finmaterialinnhold er derfor valgt som betegnelse for den andre dimensjonen innenfor S3 uten at man går inn på hvilke prosesser som er involvert i å bestemme sedimentenes finmaterialinnhold (mange ulike prosesser, historiske og aktive, er sikkert involvert).
''',
)

# %% S3S
s3s_lec = LEC(
    _id='S3S',
    parentLec=s3_lec,
    structuringProcess=s_structuring_process,
    patternOfVariation=mf_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
s3s_lec_info_en = LECInfo(
    language=en_language,
    lec=s3s_lec,
    name='Special sediments',
    description='A categorical variable that includes, e.g., shellsand, coral gravel and submerged peat',
)
s3s_lec_info_nb = LECInfo(
    language=nb_language,
    lec=s3s_lec,
    name='Spesielt sediment',
    description='Innenfor flere av sedimentkategoriene definert ved en gitt kombinasjon av erosjonsmotstand og finmaterialinnhold finnes i tillegg til normale mineraljordssedimenter også bioklastiske sedimenter, det vil si ’sedimenter som for en stor del består av partikler av biologisk opprinnelse’. Når disse sedimentene har spesielle egenskaper som resulterer i en artssammensetning som er betydelig eller vesentlig forskjellig fra sedimenter som er sammenliknbare med hensyn til erosjonsmotstand og finmaterialinnhold, skal de etter prinsippene for typeinndeling i NiN versjon 2 gi grunnlag for inndeling i egne grunn- eller hovedtyper. Slike bioklastiske sedimenter (som utgjør de fleste av klassene i S3S) utgjør derfor den tredje dimensjonen innenfor S3, faktorvariabelen spesielle sedimenter (S3S).',
)

# %% S1
s1_lec = LEC(
    _id='S1',
    parentLec=s3_lec,
    structuringProcess=s_structuring_process,
    patternOfVariation=mf_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
s1_lec_info_en = LECInfo(
    language=en_language,
    lec=s1_lec,
    name='Particle size',
    description='Dominant grain size class in the substrate; ranging from bedrock (> 4096 mm) via blocks, stones, pebbles, sand and silt to clay (< 1/512 mm)',
)
s1_lec_info_nb = LECInfo(
    language=nb_language,
    lec=s1_lec,
    name='Dominerende kornstørrelsesklasse',
    description='Inneholder basisklasser for ulike kornstørrelser som fritt kan kombineres til hovedtypetilpassete trinn på grunnlag av kunnskap eller antakelser om omfanget av variasjon i artssammensetning som de gir opphav til. De to alternative måtene å beskrive variasjon relatert til sedimentsortering og kornstørrelse blir betegnet henholdsvis S3 (trevariabel-skjemaet; se NiN[2] Artikkel 1 Fig. B3–6) og S1 (envariabel-skjemaet).',
)

# %% TE
te_lec = LEC(
    _id='TE',
    structuringProcess=r_structuring_process,
    patternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=5,
    knowledgeBaseDivision=5,
    spatialScale=-1,
)
te_lec_info_en = LECInfo(
    language=en_language,
    lec=te_lec,
    name='Peat-producing ability',
    description='Fine-scaled variation in the rate of peat production (and peat accumulation), from low (‘regressive’ mire sites dominated by liverworts, lichens and weakly peat-producing mosses) to high (‘progressive’ mire sites dominated by rapidly growing Sphagnum spp.)',
)
te_lec_info_nb = LECInfo(
    language=nb_language,
    lec=te_lec,
    name='Torvproduserende evne',
    description='Akkumulering av torv finner sted når produksjonen av organisk materiale er større enn nedbrytningen. Et stort og komplekst sett av miljøvariabler bestemmer hvorvidt torvakkumulering finner sted i en torvmark, og i så fall med hvilken hastighet. Eksempler på viktige variabler er forstyrrelser (isskuring, metanutslipp, etc.) og temperatur og fuktighetsforhold i vekstsesongen. På nedbørsmyr, til dels også på jordvannsmyr, er det stor variasjon i torvakkumuleringsarter på fin skala (få m; Ohlson & R. Økland 1998). Den viktigste umiddelbare grunnen til dette er stor fin-skala variasjon i hvilke arter (av torvmoser, levermoser og lav) som dominerer i bunnsjiktet, også mellom steder med samme plassering langs alle de viktigste miljøvariablene. De bakenforliggende årsakene til denne fin-skalavariasjonen er ikke helt klarlagt, men det er vel dokumentert at dominansforholdene på myr endrer seg over tid og dermed sannsynlig at det finnes en fin balanse mellom de ulike artsgruppene [dette er drøftet i detalj av R. Økland (1989a)]. På en åpen myr er det først og fremst graden av torvmosedominans (og om høy- eller lavproduktive arter dominerer) som bestemmer mengden organisk materiale som akkumuleres på hvert sted. Gradienten i torvproduserende evne er dermed også en gradient i artssammensetning fra steder med normal torvproduserende evne til steder der ingen torvakkumulering finner sted. Denne artssammensetningsgradienten er vel dokumentert (Malmer 1962, R. Økland 1989a, 1990b), og analyser av artslistedatasett B11E viser at den representerer en gradientlengde i overgang av 1 ØAE (NiN[2] Artikkel 2, kapittel B11). Begrepet ‘torvproduserende evne’ er uttrykk for en egenskap ved vegetasjonen (dens produktivitet) og ikke egentlig for en underliggende kompleks miljøvariabel. Til tross for at torvproduserende evne (TE) ikke har sin årsak i en veldefinert underliggende kompleks miljøgradient, er den inkludert som en LKM i NiN 2 for å gi mulighet for å beskrive en veldokumentert og lett observerbar gradient i artssammensetning. Gradienter som denne utvider dermed LKM-begrepet på samme vis som reine suksesjonsgradienter som langsom primær suksesjon (LA).',
)

# %% TU
tu_lec = LEC(
    _id='TU',
    structuringProcess=s_structuring_process,
    patternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=9,
)
tu_lec_info_en = LECInfo(
    language=en_language,
    lec=tu_lec,
    name='Turbidity',
    description='Variation in the content of suspended inorganic material in water, e.g., glacial rivers, which, like high concentrations of organic material (LEC HU) reduces light penetration but unlike the latter also causes mechanical abrasion of the substrate and ends in a species-thinning situation',
)
tu_lec_info_nb = LECInfo(
    language=nb_language,
    lec=tu_lec,
    name='Turbiditet',
    description='''Turbiditeten er et uttrykk for mengden suspendert uorganisk materiale i ferskvann – økende innhold av uorganisk materiale gir vannet en gråere farge. Store mengder suspendert mineralmateriale reduserer lysgjennomtrengeligheten i vannet på samme måten som høyt humusinnhold (HU), og har i tillegg en slipende effekt på underlaget. Det uorganiske materialet stammer oftest fra breerosjon og fraktes med breelver inn i større elvesystemer, men det kan også stamme fra erosjon av marine leirsedimenter elva renner gjennom. 
	Til tross for at variasjonen i artssammensetning relatert til turbiditet (TU) er mangelfullt kjent, er TU inkludert som en LKM i NiN 2. Dette er i tråd med typologien i Vannveilederen (Anonym 2013) der turbiditet er inkludert som egen ‘typefaktor’ på samme vil som, og parallelt med, humusinnhold.
''',
)

# %% TV
tv_lec = LEC(
    _id='TV',
    structuringProcess=s_structuring_process,
    patternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=5,
    knowledgeBaseDivision=5,
    spatialScale=0,
)
tv_lec_info_en = LECInfo(
    language=en_language,
    lec=tv_lec,
    name='Duration of period without inundation',
    description='Variation in duration of the period emergent above water vs immersed in water; used to characterise variation across river banks, lake shores, tidal belts and in wetlands; In the littoral belt of lake and sea shores divided into hydro-, geo-, supra- and epilitoral belts, in mires divided into carpets, lawns and hummocks',
)
tv_lec_info_nb = LECInfo(
    language=nb_language,
    lec=tv_lec,
    name='Tørrleggingsvarighet',
    description='''Gradienten fra fullstendig til ingen vanndekning er den viktigste årsaken til variasjon i artssammensetning i den fysiske overgangen mellom vann og land, både langs kysten og langs ferskvannsforekomster, på steder der vannet ikke har så stor bevegelsesenergi at forstyrrelseseffekten overstyrer virkningen av alle andre miljøforhold. Denne gradienten har en direkte parallell i mikrotopografivariasjonen på myr, fra de lavestliggende mykmattene til de høyeste tuetoppene. I NiN versjon 1 ble separate ‘lokale basisøkokliner’ benyttet til å beskrive variasjon relatert til oversvømmings- og tørrleggingsvarighet i fjærebelte/flomsone og i myr. Begge disse kan imidlertid beskrives med samme fysiske variabel (tørrleggingsvarighet), og de tradisjonelle trinninndelingene av dem er helt parallelle (sjøl om ulike begrepsapparater har vært brukt). Derfor blir denne variasjonen beskrevet med en og bare en kompleks miljøvariabel i NiN versjon 2. 
	Varigheten av vanndekning er en viktig faktor i seg sjøl fordi ulike organismer har ulike toleranser og krav i forhold til vannbehov og uttørkingstoleranse. I tillegg virker vannet som forstyrrelsesfaktor (eroderende eller sedimenterende, og gjennom isskuring om vinteren). 
	Strandbeltet eller fjærebeltet omfatter arealet som nedad er avgrenset av laveste normale vannstand og som oppad er avgrenset av høyeste normale vannstand eller som regelmessig blir påvirket av bølgeslag eller sjøsprøyt). Den vertikale utstrekningen av fjærebeltet (TV∙a–g) bestemmes hovedsakelig av tidevannsforskjellen, med unntak for supralitoralbeltets høydeutstrekning (basistrinn TV∙g) som bestemmes av graden av eksponering for vær og vind (tilførsel av havsalt gjennom sjøsprøyt). Den vertikale utstrekningen av flomsonen bestemmes av forhold som påvirker vannføringen i elver og vannstanden i innsjøer (for eksempel vanntilførselen og, i regulerte vannforekomster, reguleringsregimet).
	I motsetning til alle andre trinngrenser, som er klart definert på grunnlag av varigheten av oversvømmelse/tørrlegging, kan strandbeltets øvre grense (dvs. grensa mellom TV∙k og TV∙l) være vanskeligere å definere entydig. På svært eksponerte kyststrekninger står saltspruten til tider langt innover land, og på slike steder finnes derfor saltelskende arter (halofytter) på bergknauser og i klippevegger flere hundre meter innenfor øvre flomål. Grønlie (1948) beskriver dette fra de ytterste øyene på Røst i Lofoten (Nordland). Til tross for at disse øyene har en bredde (langs framherskende vindretning) på inntil 1 km og når 250 m over havet, skriver Grønlie (1948) at det ikke er mulig å finne det vanlige skillet mellom kystberg og innlandsberg på disse øyene fordi også øyenes indre deler er eksponert for betydelig sjøsprøyt (’washing by sea’) og hele vegetasjonen derfor får innslag av halofile arter. Idéen om to belter over normalt flomål, ’supralitoralbeltet’ som tilføres havvann i form av direkte sjøsprøyt (TV∙ijk) og ’epilitoralbeltet’ (TV∙l) som tilføres havsalt i form av aerosoler, går i hvert fall tilbake til Sernander (1917). Du Rietz (1932) bruker begrepene ’hygrohalofytt’ og ’aerohalofytt’ om planter som kan leve henholdsvis i supralitoralbeltet og epilitoralbeltet. Supra- og epilitoralbeltene øker i horisontal og vertikal utstrekning med økende grad av eksponering for vær og vind. På de mest eksponerte stedene består kysten av nakent fjell, og det er derfor først og fremst på nakent bergsubstrat at det er vanskelig å trekke en klar øvre grense for fjærebeltet. På steder som er mindre sterkt eksponert finnes oftest ei skarp grense mellom de to beltene fordi den direkte påvirkningen fra saltvann er direkte utslagsgivende for landplanters nedre grenser mot stranda. Et typisk trekk, som kan gi grunnlag for operasjonell grensetrekking mellom strandbeltet og ‘land’ er at lyngarter som for eksempel krekling (Empetrum nigrum) og røsslyng (Calluna vulgaris) alltid mangler i supralitoralbeltet.
	Med vekslende intervaller forekommer sjøsaltepisoder; det vil si spesielle vær- og vindforhold som medfører transport av sjøsalt langt (i ekstreme tilfeller inntil 10–15 km) innover land. Sjøsaltepisoder kan ta livet av eller sterkt redusere vitaliteten til landlevende arter med lav salttoleranse, som for eksempel furu og krekling. Fordi sjøsaltepisoder finner sted så sporadisk (og de biologiske effektene er til dels dårlig dokumentert), er det vanskelig å avgrense epilitoralbeltet (som sporadisk utsettes for sjøsaltepisoder) fra landsystemene innenfor, som aldri utsettes for saltpåvirkning, ikke engang i form av aerosoler (TV∙+).
	‘Mykmatte–tue-gradienten’ er en av de 'klassiske gradientene' i fennoskandisk myrvegetasjonsøkologi. I tillegg til å uttrykke oversvømmelsesvarighet, som er viktig som miljøstress- (og i noen grad også som forstyrrelsesvariabel) i myr, kjennetegnes også trinnene TV∙c–j i myr ved karakteristiske torvegenskaper (pH, redokspotensiale, torvfasthet etc.). Karplanteartenes fordeling langs denne komplekse miljøvariabelen på myr begrenses nedad først og fremst av toleranse for oversvømmelse. Arter som lever i fast- og mykmatter har tilpasninger til å tåle oksygenmangel i rotsjiktet (f.eks. gjennomluftingsvev i røttene).
	Parallelliteten mellom de tørrleggingsvarighet i flomsonen og på myr illustreres av at mange myk- og fastmattearter, f.eks. dikesoldogg (Drosera intermedia) og stivtorvmose (Sphagnum compactum), også forekommer i midtre/øvre landstrand på innsjøstrender. Det er betydelig variasjon i forstyrrelsesintensitet langs tørrleggingsvarighet (TV); først og fremst på grunn av iserosjon men også på grunn av vannerosjon (bølgevirkning). Forstyrrelse er sannsynligvis en viktigere faktor langs innsjøstrender enn på torvmark.
'''
)

# %% UE
ue_lec = LEC(
    _id='UE',
    structuringProcess=d_structuring_process,
    patternOfVariation=g_pattern_of_variation,
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

# %% UF
uf_lec = LEC(
    _id='UF',
    structuringProcess=d_structuring_process,
    patternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=5,
    spatialScale=5,
)
uf_lec_info_en = LECInfo(
    language=en_language,
    lec=uf_lec,
    name='Risk of drought',
    description='Variation in the risk of damage during periods with exceptionally low soil moisture content, i.e., the most severe drought spells in 50–100 years; variation along LEC UF is affected by topographic position and soil depth; at low drought risk, herbs, grasses, deciduous dwarf shrubs and mosses dominate while at high drought risk evergreen dwarf shrubs and lichens dominate',
)
uf_lec_info_nb = LECInfo(
    language=nb_language,
    lec=uf_lec,
    name='Uttørkingsfare',
    description='''Uttørkingsfare (UF) beskriver, sammen med vannmetning (VM), variasjon relatert til jordfuktighet på jorddekt fastmark. Miljøvariabelen uttørkingsfare (UF) adresserer faren for ekstrem uttørking, kanskje 50- eller 100-årstørken, og er korrelert med topografi, jorddybde og jordsmonnutvikling, mens vannmetning (VM) adresserer fuktighetsforholdene slik de stort sett er (‘median jordfuktighet’; R. Økland & Eilertsen 1993). Variasjonen langs UF og VM er i stor grad er frikoblet i rom, i tid og med hensyn til artenes responser; i fastmarksskogsmark er f.eks. alle kombinasjoner av UF (variasjonen fra frisk blåbærskog til tørkeutsatt lavskog) og VM [forekomsten av større eller mindre flekker, gjerne i små forsenkninger, av vegetasjon dominert av torvmoser (Sphagnum spp.) og andre arter som foretrekker fuktige voksesteder, men som også tåler langvarig uttørking)] realisert.
	Uttørkingsfare (UF) omfatter variasjonen fra blåbær- og lågurtskog på frisk mark med djupere jordsmonn, gjerne i lisider, til lavskog på koller med grunt jordsmonn eller svært veldrenerte morener. Uttørkingsfare (UF) er også relevant for semi-naturlig mark (semi-naturlig eng og kystlynghei) oppstått fra fastmarksskogsmark gjennom langvarig ekstensiv hevd, samt for fjellhei, leside og tundra.
	Det finnes ikke empirisk eller eksperimentelt basert kunnskap som entydig klargjør hvilke miljøfaktorer som er utslagsgivende for variasjonen i artssammensetning langs denne komplekse miljøvariabelen, men ‘uttørkingsfare-hypotesen’ (R. Økland & Eilertsen 1993; se NiN[1] Artikkel 22) postulerer at hovedforklaringen på variasjonen i artssammensetning langs uttørkingsfare (UF) er variasjon i faren for ekstrem uttørking, som i sin tur er bestemt av en rekke forhold som virker sammen, blant annet topografi, jorddybde og jordstruktur. Hypotesen støttes av at mange flekker i skogbunnen (og andre steder), også på grunn mark, tilføres sigevann som bidrar til en høy normal fuktighet, men at disse flekkene i ekstreme tørkeperioder (kanskje hvert10. eller 100. år) blir like sterkt tørkeutsatt som andre flekker i skogbunnsmosaikken når sigevannstilførselen stopper opp. ‘Uttørkingsfare-hypotesen’ forklarer variasjonen i artssammensetning langs gradienten med at artene i fuktige år vil spre seg i retning den tørkeutsatte gradientenden, men at de elimineres utenfor sitt egentlige toleranseområde i svært tørre år. Observasjoner i Finland (Erkamo 1958) og Norge (R. Økland & Eilertsen 1993) støtter denne forklaringen.
	I en serie av sammenliknbare naturtyper som fordeler seg langs uttørkingsfare (UF) fra liten til stor uttørkingsfare, avtar produktiviteten betydelig. Dette gir seg f.eks. utslag i variasjon i trærnes tilvekstrate (f.eks. uttrykt som H40-bonitet).
	R. Økland & Bendiksen (1985) viser at det omkring skoggrensa finner sted en ’forskyvning’ av artssammensetningen i karplantesjiktet (feltsjiktet) i forhold til i bunnsjiktet (moser og lav) idet en gitt karplanteartssammensetning er assosiert med et bunnsjikt med langt sterkere lavdominans enn under skoggrensa. Dette forklares med at vinden s uttørrende effekt over skoggrensa, og er grunnen til at trinn UF∙a ikke anses å være til stede i særlig grad der; god markfukting innebærer gjerne kildevannspåvirkning. I den motsatte enden av gradienten innebærer sterk tørkeutsatthet også så sterk vindvirkning at vindutsatthet (VI) overtar for uttørkingsfare (UF) som viktig miljøvariabel. Lavheia blir da et overgangstrinn langs UF, mens lesida blir et overgangstrinn mot snøleiene der snødekkebetinget vekstsesongreduksjon overtar som viktigste komplekse miljøvariabel langs ‘rabbe-snøleiegradienten’ (se NiN[2] Artikkel 2, kapittel B11).
''',
)

# %% VF
vf_lec = LEC(
    _id='VF',
    structuringProcess=d_structuring_process,
    patternOfVariation=ga_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=3,
)
vf_lec_info_en = LECInfo(
    language=en_language,
    lec=vf_lec,
    name='Water-mediated disturbance intensity',
    description='Variation in the intensity of water-mediated distur-bance in marine, freshwater and adjacent littoral and flooded-ground systems; from protected sites (still waters, slow-flowing rivers) to strongly exposed sites (large, fast-flowing rivers and strong tidal currents) where not even stone-dominated substrates are stable',
)
vf_lec_info_nb = LECInfo(
    language=nb_language,
    lec=vf_lec,
    name='Vannpåvirkningsintensitet',
    description='''Vann som forstyrrelsesagens er viktig både på fast bunn og på sedimentbunn. På marin sedimentbunn råder gjerne en likevekt mellom ytre påvirkning fra strøm, bølger etc. og sedimentenes dominerende kornstørrelse. I NiN 2 kommer variasjonen relatert til vannforårsaket forstyrrelse til uttrykk gjennom miljøvariabelen erosjonsmotstand (S3E), en av de tre enkeltvariablene som utgjør den flervariable komplekse miljøvariabelen sedimentsortering (S3). På fast bunn og i flomsonen langs elver med stor transportkapasitet, der det er store skiftninger mellom perioder med avsetning (sedimentasjon) og perioder med bortvasking (erosjon) av masser, og følgelig også stor variasjon i toppsedimentenes sammensetning, må vannets maksimale bevegelsesenergi brukes mer direkte til å beskrive vannforstyrrelsesintensiteten. To sett begreper og to uttrykk for vannets bevegelsesenergi blir brukt i NiN; for bølge- og strømenergi langs kysten og på fast bunn i innsjøer og i havet brukes Isæus’ ESWM-indeks og det tilhørende begrepsapparatet for grader av beskyttelse/eksponering, for rennende vann (inkludert flommarker langs elver) brukes begrepsapparatet for bevegelsesenergi i NiN 1, med vannhastighet og størrelse på partikler elva er i stand til å flytte som nøkkelegenskaper. Disse to seriene av begreper kobles sammen ved bruk av vannets evne til å transportere materiale, gitt av ‘Hjulström-figuren’ (NiN[2] Artikkel 2, kapittel B3k).
	Katastrofeflommene levner ingen tvil om at ekstremsituasjonene (de aller største flommene) har avgjørende betydning for artssammensetningen i flommarker. I havet er det mer usikkert hvordan bølger og strøm regulerer artssammensetningen. De studiene som er gjort (E. Oug, pers. medd.) finner bare svake sammenhenger mellom måleresultater for normalsituasjonen og biologisk respons. Det indikerer at det også i saltvannssystemer det er forstyrrelse forårsaket av sjeldnere forekommende ekstremsituasjoner som er utslagsgivende for gradienten i artssammensetning.
	Flommarker blir unngåelig utsatt for vann i en viss grad av bevegelse, slik at nulltrinnet ikke vil være det samme i stillestående vann og i elver. Plasseringen av flommarksskogsmark langs vannpåvirkningsintensitet (VF) i trinn VF∙b–e er tentativ, og litt skjematisk, men konsistent med resultatene av analyser av generalisert artslistedatasett B09F, som indikerer at det er grunnlag for å skille ut 2 hovedtypespesifikke standardtrinn med 4 basistrinn innenfor flommarksskogsmark. Den øvrige trinndelingen av gradienten er tentativ, og trenger å testes ved bruk av generaliserte artslistedata. Dette gjelder både i saltvanns- og i ferskvannssystemer. I flommark ender vannpåvirkningsintensitet (VF) i et artsuttynningsintervall. Til grunn for basistrinninndelingen av steder med høy vannpåvirkningsintensitet (VF) er lagt at artsuttynningsintervallets nedre endetrinn er VF∙f, og at gradientens naturlige øvre endetrinn VF∙¤ er realisert på steder der disruptivt miljøstress forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal vannpåvirkningsintensitet (VF) deles i fire basistrinn i artsuttynningsintervallet, slik at det totale antallet basistrinn blir 10. Sannsynligvis blir ikke det disruptive forstyrrelsestrinnet realisert på saltvannsbunn (med mulig unntak for særlig utsatte kyststrekninger). På dyp der vannpåvirkning bare skjer som følge av strøm er, i hvert fall i norske farvann, når vannhastigheten bare unntaksvis opp i 0,5 m/s (dvs. basistrinn VF∙c).
''',
)

# %% VI
as_lec = LEC(
    _id='AS',
    structuringProcess=s_structuring_process,
    patternOfVariation=t_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=5,
)
as_lec_info_en = LECInfo(
    language=en_language,
    lec=as_lec,
    name='Arid terrestrial salinity',
    description='Variation from \'normal\' ground with predominantly downward water flow and maximal pH (in mineral soil rich in lime) ca. 8.0, to ground with predominantly upward water flow and salt precipitated as a white soil topsoil crust and pH up to 10.5; salt-enriched soils are typical for deserts and steppes but also occur locally in Arctic climates (e.g., at Svalbard) in sites characterised by a combination of extreme rain-shadow effect and dry winds',
)
as_lec_info_nb = LECInfo(
    language=nb_language,
    lec=as_lec,
    name='Arid terrestrisk salinitet',
    description='Variasjonen fra ’normal’ mark med overveiende nedadgående vannstrøm og maksimale pH-verdier (i rein kalkdominert mineraljord) opp til ca. 8,0, til finjordsrik mark med overveiende oppadgående vannstrøm, som fører til saltanriking i øvre jordlag og pH-verdier helt opp i 10,5. Saltanriket mark kan lettest diagnostiseres ved en kombinasjon av synlig hvitt saltlag på overflaten (som vaskes vekk av regn, men snart kommer tilbake). Saltjord er typisk for ørkener, stepper og halvstepper i alle verdensdeler, men er i Norge bare kjent fra områder ved Wijdefjorden med sidefjorder på Svalbard, der en kombinasjon av regnskygge (svært tørt klima) og uttørkende vinder skaper helt spesielle forhold som gjør utvikling av saltanriket jord mulig også i et kaldt klima.',
)
