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

# %% AS
as_lec = LEC(
    _id='AS',
    structuringProcess=s_structuring_process,
    paternOfVariation=t_pattern_of_variation,
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

# %% BK
bk_lec = LEC(
    _id='BK',
    structuringProcess=s_structuring_process,
    paternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=5,
)
bk_lec_info_en = LECInfo(
    language=en_language,
    lec=bk_lec,
    name='Categories of bedrock with deviating chemical composition',
    description='Complex environmental factor that separates from \'normal\' bedrock four categories of bedrock with systematically deviating elemental composition: ultramafic rock (rich in heavy metals); acidic sulphide mineral- and iron-rich rocks; less acidic sulphide mineral- and copper-rich rocks; and lava.',
)
bk_lec_info_nb = LECInfo(
    language=nb_language,
    lec=bk_lec,
    name='Berggrunn med avvikende kjemisk sammensetning',
    description='''Identifiserer bergarter med systematisk avvikende grunnstoffsammensetning i forhold til ’normalen’, og som gir opphav til avvikende artssammensetning. Tre kategorier av bergarter med avvikende kjemisk sammensetning er identifisert; ultramafiske, jern- og/eller kopper-rike bergarter (de to sistnevnte kan betegnes ‘kis-rike’). 	Ultramafiske bergarter har høyt innhold av en del tungmetaller som jern, krom, kobolt, magnesium og nikkel, mens kalsium mangler (se også NiN[1] Artikkel 19). I Norge er peridotitter de kvantitativt viktigste ultramafiske bergartene. Peridotitter er størkningsbergarter med høyt innhold av mineralet olivin (= peridot), et enkeltsilikat med magnesium og/eller jern. Peridotitter med > 90 % innhold av olivin kalles olivinstein (dunitt). Et omdanningsprodukt fra olivinstein er serpentinstein (serpentinitt). Serpentinstein er dominert av serpentin, som er et magnesium-jern-nikkeldominert sjiktsilikat. Fordi metamorfosegraden varierer mye finnes ofte serpentinitt sammen med peridotitt. Begge inngår i BK∙a, Både olivinstein og serpentinitt har en karakteristisk gulbrun–rødbrunbrun overflatefarge; distinkte landformer (åser, topper) dominert av ultramafiske bergarter som har mye nakent berg og har derfor ofte en karakteristisk rødbrun farge (forstavelsen ’raud-’ inngår ofte i navn på disse, jf. stedsnavnene Rødøy og Raudeberg. Det største sammenhengende området dominert av ultramafiske bergarter i Norge (BK∙a) utgjøres av størsteparten av øyene Leka (Leka, NT) og Rødøy (Rødøy, No), men hovedtyngden av norske olivinsteinforekomster finnes i Møre og Romsdal og tilgrensende områder, der hundrevis av større og mindre olivinsteinforekomster finnes innsprengt som øyer i gneis.
	Bergarter som inneholder rike forekomster av sulfid- eller kismineraler, for eksempel alunskifer, kleberstein, fyllitter og glimmerskifer, er kjernen i bK∙b–c. Pyritt eller svovelkis (FeS2) er den kvantitativt viktigste blant kismineralene, men også kobberkis eller chalkopyritt (CuFeS2) og andre tungmetall-sulfider, for eksempel blyglans (PbS) og sinkblende ((Zn, Fe)S) forekommer i Norge. Kisbergarter er ofte knyttet til kobberrike årer, synlige som små grønne oksyderte flekker i berg som kan være ekstremsure enklaver med pH rundt 3 og en karakteristisk moseflora med kismoser (Mielichhoferia spp.) som typiske innslag. Sulfidmineralrike bergarter favner et betydelig spekter av variasjon i kalkinnhold (KA), fra (surt) berg særlig rikt på jern til (mindre surt) berg som er rikere på kobber. Begge disse kjennetegnes ved høyt innhold av tungmetaller som for eksempel kopper, bly, jern og sink. Forekomster av jern-rikt berg (BK∙b) utgjør oftest bare små flekker; inntil 10 m lineær utstrekning er typisk. Kis-rikt berg rikt på kobber (BK∙c) forekommer først og fremst som ganger i dypbergarter. De største forekomstene finnes i Nordland, der ulike dekkeenheter møtes og hvor slike bergarter kan dekke sammenhengende arealer på flere km. Forekomster av kis-rikt berg har imidlertid knapt noen nedre utstrekningsgrense.
	Lavamark (ny mark dannet ved vulkanutbrudd) er inkludert som BK∙d. Lava er størknede bergarter som har rent ut av en vulkan. Lavaen er mørk og porøs, av varierende kjemisk sammensetning, dominert av basalt, men ofte med store innslag av gulgrønne olivinbergarter. Lavamark inneholder i tillegg til lava også varierende innslag av tefra og slagg. Tefra er vulkansk materiale som er slynget ut av vulkanen og som har størknet, mer eller mindre fullstendig, i lufta. Tefraen kan variere i størrelse fra støvaktig aske til større stein, kalt bomber. Slagg er en mellomting mellom lava og tefra, som oppstår når flytende masse som er slynget ut i lufta ikke størkner før den treffer bakken. Pimpstein er ekstra porøs stein som er dannet av svært gassrik vulkansk masse. 
Lavamark finnes først og fremst på Jan Mayen. En naturfaglig beskrivelse av øya finnes i Gabrielsen et al. (1997). Vulkanen Beerenberg på Jan Mayen, 2277 m høy, er verdens nordligste aktive vulkan. De to siste utbruddene fant sted der i 1970 og 1985. I 1970 ble et 100 km2 stort landareal der dekket av aske og 4 km2 nytt land ble dannet. Seinere er de vulkanske massene erodert bort på halvparten av dette nye arealet. 1985-utbruddets omfang, målt i lavamengde, var bare 1 % av 1970-utbruddet. Både de gamle og de helt ferske vulkanske områdene har sitt særpreg, ulik vanlige tundradominerte områder. 
	Det eneste andre området i Norge med natur som blir typifisert som lavamark, er vulkanen Sverrefjellet ved Bockfjorden på Svalbard. Dette er også en relativt ung vulkan i geologisk tidsperspektiv, som sannsynligvis var aktiv for mellom 100 000 og 250 000 år siden (Skjelkvåle et al. 1989). Sverrefjellet har fremdeles sin regulære kjegleform intakt. Skråningene er dominert av løs og veldrenert porøs tefragrus med store innslag av gulgrønne olivinsteiner, avsatt under tidligere utbrudd. De mest typiske lavafeltene har porøs, størknet lava som ikke er dekket av jord.
 	I og omkring varme havbunnskilder dannes også et substrat med avvikende kjemisk sammensetning. Berggrunnen i havbunnsspredningsområdene består i hovedsak av peridotitter (bergartsgruppa som inneholder olivinstein), som blir brakt opp til havbunnen ved tektoniske prosesser. Dette ultramafiske materialet er rikt på magnesium og jern, og har høyt innhold av H2S-gass. Når varm peridotitt, som består av en blanding av fayalitt (Fe2SiO4) og forsteritt (MgSiO4), kommer i kontakt med vann, reagerer fayalitten med vann og danner magnetitt (Fe3O4) og flytende kvarts (SiO2). Forsteritten reagerer i sin tur med kvartsen og danner serpentin (Mg3Si2O5(OH)4), som er hovedmineralet i den ultramafiske bergarten serpentinitt. Denne prosessen kalles serpentinisering, og er en av de viktigste bergartsdannende prosessene i nåtida. Denne typen ny bergart er knyttet til de kaldere ’hvite havbunnsskorsteinene’, men det finnes også varm havkildebunn med temperatur på 200–400 ºC (’svarte skorsteiner’). ’Hvit’ og ’svart’ refererer til fargen på partiklene som slippes ut. Fra de svarte havbunnsskorsteinene strømmer det ut partikler med sulfidholdige mineraler (inkludert metaller), mens det fra de hvite havbunnsskorsteinene strømmer ut lysere partikler som inneholder barium, kalsium og silisium. Begge disse kategoriene av ny havbunn er samlet i klasse BK∙a ultramafisk.
''',
)

# %% DD
dd_lec = LEC(
    _id='DD',
    structuringProcess=s_structuring_process,
    paternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=1,
    spatialScale=9,
)
dd_lec_info_en = LECInfo(
    language=en_language,
    lec=dd_lec,
    name='Depth-related variation in deep fjords',
    description='Depth-related variation in the deepest fjords (> 700 m), which differs from the general pattern of depth-related environmental variation in open sea (addressed by LEC DM) by these fjords containing Atlantic water masses (with temperatures rarely falling below 4 °C) to the greatest depths',
)
dd_lec_info_nb = LECInfo(
    language=nb_language,
    lec=dd_lec,
    name='Dybderelatert variasjon i dype terskelfjorder',
    description='I det afotiske beltet finner det sted en betydelig artsutskifting mot dypet, relatert til de mange enkeltvariablene som er korrelert med dyp (trykk, temperatur, mattilgang etc.). Det er til dels uklart hvilke av disse som er utslagsgivende for den vertikale fordelingen av arter innen ulike artsgrupper eller om det er den økte stabiliteten i en lang rekke viktige miljøvariabler med økende dyp som er utslagsgivende. Med økende dyp avtar variasjonen i temperatur gjennom året, variasjonen i salinitet og i bevegelsesenergi. I tillegg avtar temperaturen. Graden av dybderelatert miljøstabilisering øker med skiftende vannmassetyper fra kystvann via atlantisk vann og intermediært vann til dyphavsvann (‘minusvann’). Disse forskjellene i vannmasseegenskaper kommer til uttrykk langs LKM dybderelatert miljøstabilisering (DM). I det åpne havet varierer dybdenivåene der vannmassene møtes og avløser hverandre litt fra sør til nord, men denne variasjonen er likevel begrenset. Dype terskelfjorder, som f.eks. Sognefjorden (som med sine 1 308 m er Norges dypeste fjord) og Tysfjord , avviker imidlertid sterkt fra det alminnelige mønsteret: disse fjordene har atlantisk vann, med temperaturer som vanligvis ikke faller under 4 °C, helt ned til de største dyp. De tilhører derfor i sin helhet DM trinn DM∙b, nedre sublitoral fordi vannmassetilhørighet er overordnet dyp ved tilordning til DM. Den lokale komplekse miljøvariabelen DD er opprettet som redskap for å kunne beskrive den dybderelaterte variasjonen i artssammensetning i svært dype fjorder. Det er kjent at afotisk sedimentbunn på store dyp i fjordene har en artssammensetning som er forskjellig fra artssammensetningen på mindre dyp, blant annet ved forekomst av arter som ellers mangler langs norskekysten og først finnes igjen langs østkysten av Canada (P.B. Mortensen, pers. medd.). Årsaken til dette er ikke klarlagt, men kombinasjonen av atlantisk, relativt varmt vann, store dyp og det faktum at det dype fjordvannet ikke tilføres kaldt dyphavsvann, kan være utslagsgivende.',
)

# %% DL
dl_lec = LEC(
    _id='DL',
    structuringProcess=s_structuring_process,
    paternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=2,
    spatialScale=5,
)
dl_lec_info_en = LECInfo(
    language=en_language,
    lec=dl_lec,
    name='Depth-related light attenuation',
    description='Reduction of radiation intensity with water depth due to diffusion by light-absorbing particles and water molecule;. the rate of light attenuation depends on wavelength and the the compensation depth, below which respiration exceeds production and photosynthesising organisms cannot maintain stable populations, therefore varies strongly among water bodies',
)
dl_lec_info_nb = LECInfo(
    language=nb_language,
    lec=dl_lec,
    name='Dybderelatert lyssvekking',
    description='Dybderelatert lyssvekking er en av de viktigste LKM, både i saltvannssystemer og i ferskvannssystemer. Lyssvekking skyldes dels at vannet inneholder partikler (også organismer) som absorberer lys, dels at vannmolekylene og partikler i vannet sprer lyset. Den økologisk viktigste grenselinja langs dybderelatert lyssvekking i vann (DL) er kompensasjonsdypet (mellom trinn DL∙d og ∙e). Over kompensasjonsdypet er planteproduksjonen større enn nedbrytningen (respirasjonen) og fotosyntetiserende planter kan opprettholde rimelig stabile populasjoner over lang tid. Fordi lys av ulike bølgelengder svekkes med ulik hastighet mot dypet, gjenspeiler planteartenes dybdefordeling deres innhold av ulike pigmenter (og deres evne til å absorbere av lys med ulike bølgelengder).',
)

# %% DM
dm_lec = LEC(
    _id='DM',
    structuringProcess=s_structuring_process,
    paternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=9,
)
dm_lec_info_en = LECInfo(
    language=en_language,
    lec=dm_lec,
    name='Depth-related environmental stabilisation',
    description='Gradual stabilisation of marine environments with increasing depth, reflected in reduced amplitudes of temperature, salinity and kinetic energy; depths > 2000 m are characterised by constant temperature < –0.5°C, food shortage and high hydrostatic pressure',
)
dm_lec_info_nb = LECInfo(
    language=nb_language,
    lec=dm_lec,
    name='Dybderelatert miljøstabilisering',
    description='I den afotiske t finner det sted en betydelig artsutskifting mot dypet. Mange enkeltvariabler er korrelert med dyp (trykk, temperatur, mattilgang etc.). Det er til dels uklart hvilke av disse som er utslagsgivende for den vertikale fordelingen av arter innen ulike artsgrupper eller om det er den økte stabiliteten i en lang rekke viktige miljøvariabler med økende dyp som er utslagsgivende. Med økende dyp avtar variasjonen i temperatur gjennom året, variasjonen i salinitet og i bevegelsesenergi. I tillegg avtar temperaturen. Graden av dybderelatert miljøstabilisering øker med skiftende vannmassetyper fra kystvann via atlantisk vann og intermediært vann til dyphavsvann (‘minusvann’). Vannmassetilhørighet er hovedkriterium for tilordning til DM-trinn; dybdeangivelsene i tabellen er omtrentlige og avvik forekommer. Dybdegrenser for de ulike stabilitetsnivåene varierer regionalt og med strømforholdene, f.eks. ligger grensene på mye større dyp i dype fjorder enn på åpent hav, og de ligger noe dypere i sør enn i nord. Sognefjorden, Tysfjord og andre dype terskelfjorder har atlantisk vann til de største dyp, med temperaturer som vanligvis ikke faller under 4 °C, og tilhører derfor i sin helhet DM∙b. Dybderelatert variasjon i dype terskelfjorder beskrives ved bruk av LKM dybderelatert variasjon i dype terskelfjorder (DD).',
)

# %% ER
er_lec = LEC(
    _id='ER',
    structuringProcess=d_structuring_process,
    paternOfVariation=ga_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=8,
)
er_lec_info_en = LECInfo(
    language=en_language,
    lec=er_lec,
    name='Erosion intensity',
    description='Variation in the intensity of water-mediated disturbance on river bottoms and the adjacent flooded ground, in sites where erosion clearly dominates over sedimentation (e.g., along seasonal meltwater rivers with negligible sediment transport); ends in a species-thinning situation.',
)
er_lec_info_nb = LECInfo(
    language=nb_language,
    lec=er_lec,
    name='Erosjonsutsatthet',
    description='''Massebalansen (hvorvidt materiale tilføres eller fjernes) er en svært viktig miljøvariabel i mange natursystemer. Massebalansen er negativ når substratet eroderes (i og langs elver først og fremst på steder der vannhastigheten er økende) og positiv når nytt substrat akkumuleres (først og fremst der vannhastigheten er avtakende, hvor transportert suspendert materiale sedimenteres). Erosjonsutsatthet (ER) adresserer effekter av vannforstyrrelse som er relatert til massebalansen i ferskvannsbunnsystemer og flommarker langs rennende vann. Denne LKM skiller steder der vannet tidligere har fjernet alt materialet den enkelt har transportkompetanse til å fjerne (og som nå tilføres små eller ubetydelige sedimentmengder og derfor utsettes for erosjon) fra steder med god balanse mellom tilførsel (sedimentasjon) og fjerning (erosjon) av sedimenter. Den blir benyttet til å beskrive forskjellen i T30 Flomskogsmark mellom erosjonspregete krattsamfunn på grove sedimenter langs store elver, på Østlandet typisk dominert av doggpil (Salix daphnoides), fra mer sedimentasjonsutsatte krattsamfunn typisk dominert av mandelpil (Salix triandra) (se Fremstad 1981). 
	Til grunn for basistrinninndelingen av erosjonsutsatthet (ER) er lagt at dette er en artsuttynningsgradient, der artsuttynningsintervallet starter allerede ved overgangen mellom trinnene ER∙0 og ER∙a og endepunktet er der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da erosjonsutsatthet (ER) deles i fire basistrinn.
	Også vannforstyrrelsesintensitet (VF) adresserer effekter av vann som forstyrrelsesagens i ferskvannssystemer, men VF adresserer mark/bunn med balanse mellom sedimentasjon og erosjon (ER∙0), og mellom vannets forstyrrelseseffekt og substratets kornstørrelsesfordeling. Sedimentasjonsbasert forstyrrelse (SE) er motsatsen til erosjonsutsatthet (ER) i den forstand at SE adresserer forstyrrelseseffekter av vedvarende sedimentasjon.
	I tidligere framlegg til NiN versjon 2 ble også erosjonsutsatthet (ER) benyttet til å karakterisere de spesielle flommarkene i dødislandskapet på Gardermo-sletta (Ullensaker, Akershus). Disse blir i NiN versjon 2 karakterisert ved hjelp av LKM flomregime (FR).
''',
)

# %% FK
fk_lec = LEC(
    _id='FK',
    structuringProcess=s_structuring_process,
    paternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=1,
    spatialScale=10,
)
fk_lec_info_en = LECInfo(
    language=en_language,
    lec=fk_lec,
    name='Categories of fresh-water with deviating chemical composition',
    description='Complex environmental factor that separates from \'normal\', circulating freshwater masses five categories of non-circulating water masses that have been found in meromictic, with systematically deviating elemental composition, e,g., high concen-trations of seasalt, iron, calcium and/or humus',
)
fk_lec_info_nb = LECInfo(
    language=nb_language,
    lec=fk_lec,
    name='Ferskvannsforekomster med avvikende kjemisk sammensetning',
    description='Det ikke-sirkulerende bunnvannet (monimolimnion) i meromiktiske innsjøer (det vil si innsjøer med et vannlag på bunnen som aldri blander seg med resten av vannet i innsjøen) kjennetegnes ofte ved svært spesielle kjemiske forhold, som gir opphav til spesiell artssammensetning. I noen grad er hver meromiktiske innsjø unik, men det er likevel mulig å foreta en viss gruppering på grunnlag av det stagnerende bunnvannets egenskaper. FK adresserer variasjonen i bunnvannmassenes egenskaper.',
)

# %% FR
fr_lec = LEC(
    _id='FR',
    structuringProcess=d_structuring_process,
    paternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=4,
    spatialScale=10,
)
fr_lec_info_en = LECInfo(
    language=en_language,
    lec=fr_lec,
    name='Flooding regime',
    description='Binary variable that separates a \'normal\' flooding regime typically with a seasonal peak discharge in spring during to snowmelt and shorter peaks after intense rain storms, and a regime characterised by prolonged inundation (for months) by stagnant water, e.g., in flooded kettle holes after snowmelt.',
)
fr_lec_info_nb = LECInfo(
    language=nb_language,
    lec=fr_lec,
    name='Flomregime',
    description='''Det normale flomregimet i norske elver og vassdrag kjennetegnes ved en tydelig flomtopp om våren under snøsmeltingen som kan ha noen ukers varighet og mindre og/eller mer kortvarige flomtopper etter kraftige og/eller langvarige regnværsepisoder. Slike flomtopper forekommer i norsk klima særlig om høsten. Dette normale flomregimet kjennetegnes ved at vannpåvirkningsintensiteten (VF) samvarierer med vannføringen i elva og er størst under flomtoppen. Da er også, generelt, massebalansen i utsatte bunnsubstrater mest negativ, det vil si at substratet da blir erodert. Massebalansen skifter til positiv når flommen avtar og transportert, suspendert materiale sedimenteres. Et svært avvikende flomregime finnes på Gardermo-sletta (Ullensaker, Akershus), der mange km2 dekkes av et relativt flatt dødislandskap med mange dødisgroper og store, lettdrenerte, tjukke sand- og grusavsetninger. Fra seinvåren til langt utpå høsten er størstedelen av dette området sjøldrenerende ved at nedbørvann siger gjennom grunnen og blir del av grunnvannet. Noen dødisgroper har myr eller små innsjøer i bunnen, men de fleste er veldrenerte. Frost i marka (marka er typisk frossen fra november–desember til april–mai) forhindrer imidlertid dreneringen, alle groper i terrenget fylles etter hvert med vann (og snø) som fryser til. Så lenge marka er frosset fortsetter vannstanden å stige til den eventuelt når en terskel. Da renner ytterligere vanntilførsel bort som overflatevann. Snøsmeltingen om våren medfører store vanntilførsler til den fortsatt frosne marka, og fyller groper som ikke allerede er fylt med vann ytterligere. Først når frosten i marka tiner opp godt utpå våren, begynner vannstanden å synke, først sakte, deretter raskere. I april–mai blir marka igjen tørrlagt, etter flere måneders nedsenking i mer eller mindre stagnerende vann. Sand- og grussedimentene tørker da raskt opp og marka blir sterkt tørkingsutsatt i tørre somre.
	Mark som gjennomgår en slik årssyklus med vannakkumulering gjennom mange måneder og gradvis tørrlegging og til sist uttørking av marka gjennom sommeren, for så å fylles opp på ny gjennom neste vinter, har en artssammensetning med så mange kjennetegn felles med flommarker med et normalt flomregime, at de utvilsomt plasserer seg sammen med disse i en og samme hovedtype; T18 Åpen flomfastmark. Samtidig setter det spesielle flomregimet et tydelig særpreg på miljøforhold og artssammensetning, som tentativt svarer til en betydelig forskjell i artssammensetning. Karakteristiske arter er bleikfiol (Viola persicifolia), trådsiv (Juncus filiformis), åkermynte (Mentha arvensis) og myrmaure (Galium palustre). Flomregime (FR) beskriver forskjellen mellom et normalt flomregime og et flomregime preget av forlenget oversvømmelse, slik vi finner på Gardermo-sletta. Det er uvisst om tilsvarende flomregime finnes andre steder i landet.
	I NiN versjon 1 ble dette spesielle flomregimet beskrevet som negativ massebalanse, og i tidlige framlegg til NiN versjon 2 (NiNnot124) som erosjonsutsatthet. Det faktum at flomregimet som preget dødislandskapet på Gardermo-sletta ikke i særlig grad innebærer sedimentasjon (fordi flomvannets transportkapasitet er liten), medfører imidlertid ikke at erosjon er den utslagsgivende prosessen. Mer sannsynlig er det at vannet heller ikke har noen sterk eroderende effekt, men at det er det spesielle flomregimet i seg sjøl, med langvarig oversvømmelse, i kombinasjon med et lettdrenert substrat som i perioder er sterkt uttørkingsutsatt, som er hovedårsakene til den spesielle artssammensetningen.
	Årssyklusen i dødisgropene på Gardermo-sletta har likhetstrekk med årssyklusen i dødisgropene lengst nord på Østlandet, der klimaet er mer kontinentalt med mindre nedbør og lengre perioder med frossen mark. Der fryser marka raskt inn i is, og den beskjedne nedbøren som kommer har også en tendens til å ende opp som is. Artssammensetningen blir dermed preget av arter som tåler isinnfrysing i stedet for arter som tåler langvarig oversvømming. Dette isforstyrrelsesregimet blir beskrevet ved hjelp av isbetinget forstyrrelse (IF).
''',
)

# %% GS
gs_lec = LEC(
    _id='GS',
    structuringProcess=s_structuring_process,
    paternOfVariation=ga_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=1,
    spatialScale=4,
)
gs_lec_info_en = LECInfo(
    language=en_language,
    lec=gs_lec,
    name='Cave-induced sheltering',
    description='Light attenuation and reduced amplitudes of temperature and air humidity along the physical gradient from open ground via overhanging rocks to the interior of deep caves, ending in a species-thinning situation',
)
gs_lec_info_nb = LECInfo(
    language=nb_language,
    lec=gs_lec,
    name='Grottebetinget skjerming',
    description='''Kompleks miljøgradient som beskriver lyssvekking og redusert amplitude i flere enkeltvariabler som luftfuktighet og lys langs en fysisk gradient fra åpen mark til det indre av dype grotter. Grottebetinget skjerming er relevant for variasjon i artssammensetning både i terrestre og akvatiske systemer, og for en lang rekke artsgrupper. Artssammensetningen i indre deler av grotter (sterk grottebetinget skjerming) er dårlig kjent
	Til grunn for trinndeling av GS er lagt at gradienten ender i artsuttynning med nedre endetrinn for artsuttynningsintervallet i trinn GS∙b.
''',
)

# %% HF
hf_lec = LEC(
    _id='HF',
    structuringProcess=r_structuring_process,
    paternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=1,
)
hf_lec_info_en = LECInfo(
    language=en_language,
    lec=hf_lec,
    name='Slope-related disturbance intensity',
    description='Variation in the inclination of rock substrates (submerged or terrestrial); with increasing slope the tebdency for loss of sessile organisms’ biomass increases due to strengthening of downward forces (water erosion, transport of snow, ice, soil etc.)',
)
hf_lec_info_nb = LECInfo(
    language=nb_language,
    lec=hf_lec,
    name='Helningsbetinget forstyrrelsesintensitet',
    description='Helningsbasert forstyrrelsesintensitet beskriver den økende faren for tap av biomasse av fastsittende organismer på nakent berg, på land og i vann, med økende helning. Den økende forstyrrelsesintensiteten skyldes at nedadrettete krefter (vannerosjon, isskuring, snø- og jordras etc.) som virker på organismene forsterkes når substratoverflata blir brattere (inntil bergveggen er loddrett). Da øker faren for at organismene skal løsne, og miljøet stiller økende krav til tilpasninger (tett tiltrykt substratet som skorpelav, gode festeanordninger etc.). Grensa mellom bergknaus og bergvegg er en gradvis overgang, men et gjennomgående trekk ser ut til å være at artssammensetningen endrer seg sterkt omkring 80˚ (en stigning på minst 6 vertikalmeter pr. horisontalmeter når berghyller ikke regnes med), både på land og i vannsystemer. Denne grensa er imidlertid basert på skjønn og ikke på empiriske data. Bergveggen representerer overgangstrinnet langs en helningsgradient mellom helningsgrader der helningsbetinget forstyrrelsesintensitet (HF) og grottebetinget skjerming (GS) benyttes til å beskrive variasjonen. Første mellomtrinn i GS er overheng, der helningsbetinget forstyrrelse fortsatt finner sted, men der andre mekanismer enn de som er virksomme i åpent terreng anses for viktigere.',
)

# %% HI
hi_lec = LEC(
    _id='HI',
    structuringProcess=d_structuring_process,
    paternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=5,
    spatialScale=6,
)
hi_lec_info_en = LECInfo(
    language=en_language,
    lec=hi_lec,
    name='Land management intensity',
    description='Variation in the intensity of agricultural land management activities, including related anthropogeneous impacts not intended to increase production; running from natural sites with no traces of management, via extensively managed (e.g.,  by grazing, haymaking or prescribed burning), semi-natural sites to intensively managed sites (managed by ploughing, fertilisation, treatment with herbicides and sowing of crops)',
)
hi_lec_info_nb = LECInfo(
    language=nb_language,
    lec=hi_lec,
    name='Hevdintensitet',
    description='''Hevd, i motsetning til annen menneskebetinget forstyrrelse, defineres som ’regelmessig menneskebetinget aktivitet som opprettholder spesifikke naturtyper gjennom forstyrrelse, eventuelt i kombinasjon med tiltak for å fremme landbruksproduksjon; aktiviteter og påvirkninger som inkluderes i hevdbegrepet er slått, beiting og husdyrtråkk, brenning, jordbearbeiding, rydding, sprøyting, gjødsling, høsting av tresjiktet, såing og vanning; bestemte hevdbetingete naturtyper forutsetter bestemte hevdregimer’. Sammenhenger mellom ulike hevdrelaterte påvirkninger og hevdintensiteten er sammenstilt i NiN[2] Artikkel 1; Tabell B3–2 og Fig. B3–3. Hevd impliserer forstyrrelse i henhold til definisjonen av dette begrepet fordi hevden medfører fjerning av biomasse. Hevd-intensitet defineres som ’hevdens omfang, vurdert på grunnlag av grad [severity] og frekvens [recurrence]’. Definisjonen av hevd omfatter også andre menneskebetingete aktiviteter enn de som har som formål å fremme produksjon, f.eks. er slått og sprøyting av vegkanter, plenslått etc., etter definisjonen hevd. Fordi systemer tilrettelagt for jordbruksproduksjon, det vil si ’produksjon av mat, dyrefor, pryd- og nytteplanter og enkelte råvarer og tjenester for energi-, industri- eller andre formål’, skiller seg vesentlig fra andre hevdpregete systemer, blant annet med hensyn til artssammensetningen, skilles i NiN 2 mellom jordbruksmark (’mark preget av hevd med sikte på jordbruksproduksjon’) og annen hevdpreget mark. 
	Begrepene semi-naturlig hevdpreget mark og sterkt endret hevdpreget mark brukes til å karakterisere to hoveddeler av hevdintensitetsgradienten. Innenfor hver av disse kategoriene skilles mellom semi-naturlig jord-bruksmark, definert som ’jordbruksmark preget av hevd med en intensitet som resulterer i, eller opprettholder, et system som tilfredsstiller definisjonen av semi-naturlig mark’, og oppdyrka mark (= jordbruksmark preget av intensiv hevd), definert som ‘jordbruksmark som preges av hevd med en intensitet som resulterer i, eller opprettholder, et system som tilfredsstiller definisjonen av sterkt endret mark’, på hevdpreget mark med jordbruksproduksjon som hovedformål, og fra hevdpreget mark uten jordbruksproduksjon som hovedformål. 
''',
)

# %% HR
hr_lec = LEC(
    _id='HR',
    structuringProcess=d_structuring_process,
    paternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=5,
    knowledgeBaseDivision=5,
    spatialScale=7,
)
hr_lec_info_en = LECInfo(
    language=en_language,
    lec=hr_lec,
    name='Semi-natural land management regime',
    description='Binary variable that distinguishes between two fundamentally different land management regimes on semi-natural ground: grazing and/or haymaking (resulting in grassland) vs prescribed burning (resulting in heathland)',
)
hr_lec_info_nb = LECInfo(
    language=nb_language,
    lec=hr_lec,
    name='Semi-naturlig hevdregime',
    description='Denne komplekse miljøfaktoren beskriver de to fundamentalt forskjellige hevdregimene som har gitt opphav til hovedkategoriene av semi-naturlig jordbruksmark; lyngbrenning som nøkkelelementet i hevdregimet som, i kombinasjon med beiting hele eller store deler av året, eventuelt også slått, har gitt opphav til kystlynghei, og beite og/eller slått, gjerne i kombinasjon (se NiN[2] Artikkel 1: kapittel B3g), som har gitt opphav til semi-naturlig eng. Brenning kan også ha vært viktig ledd i tidlige faser av et beite- og/eller slåtteregime (landnåmsfasen), eller som et vedvarende tiltak, f.eks. for å forbedre beitekvaliteten på mager mark. For nærmere beskrivelse av hver enkelt klasse, se de respektive hovedtypene.',
)

# %% HU
hu_lec = LEC(
    _id='HU',
    structuringProcess=s_structuring_process,
    paternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=10,
)
hu_lec_info_en = LECInfo(
    language=en_language,
    lec=hu_lec,
    name='Freshwater humus content',
    description='Variation in the concentration of particulate and dissolved organic matter in water, from oligohumous and transparent (<2 mg TOC/L; TOC = total organic carbon) via mesohumous to polyhumous, dark-coloured (> 15 mg TOC/L)',
)
hu_lec_info_nb = LECInfo(
    language=nb_language,
    lec=hu_lec,
    name='Humusinnhold',
    description='''Humusinnholdet, eller vannfargen, er et uttrykk for mengden partikulært og løst organisk materiale i ferskvann – økende innhold av organisk materiale gir vannet en mørkere farge. Det organiske materialet kan være produsert i vannsystemet (autoktont, stedegent) eller, oftere, er det tilført (alloktont) fra omgivelsene. De viktigste kildene til høyt humusinnhold i ferskvann er tilførsler fra myrer og skogsmark i nedbørfeltet. Turbiditet (TU) er et uttrykk for mengden suspendert uorganisk materiale i ferskvann.
	Av de 929 sjøene i NIVAs vannegenskapsdatabase som inkluderer målinger av pH, Ca og vannfarge (se NiN[1] Artikkel 18), hører 57,8 % til trinn HU∙a oligohumøs (definert som < 15 mg Pt/l), 17,0 % til trinn HU∙b (15–30 mg Pt/l), 6,5 % til trinn HU∙c (30–45 mg Pt/l), 12,7 % til trinn HU∙d (45–90 mg Pt/l) og 4,7 % til trinn HU∙e (> 90 mg Pt/l).
''',
)

# %% IF
if_lec = LEC(
    _id='IF',
    structuringProcess=d_structuring_process,
    paternOfVariation=ga_pattern_of_variation,
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

# %% IO
io_lec = LEC(
    _id='IO',
    structuringProcess=d_structuring_process,
    paternOfVariation=mf_pattern_of_variation, #TODO supposed to be 'mf'
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=3,
)
io_lec_info_en = LECInfo(
    language=en_language,
    lec=io_lec,
    name='Organic matter content',
    description='Variation in the substrate’s content of organic matter ranging from predominantly inorganic (<10% organic matter) to predominantly organic substrates (<10% inorganic matter)',
)
io_lec_info_nb = LECInfo(
    language=nb_language,
    lec=io_lec,
    name='Innhold av organisk materiale',
    description='Akkumulering av organisk materiale finner sted i fastmarkssystemer, i våtmarkssystemer, i ferskvannssystemer og i saltvannssystemer. Det organiske materialet kan være produsert på stedet (autoktont, stedegent), det kan være tilført (alloktont; se NiN[1] Artikkel 12, kapittel A) eller det kan dels være stedegent, dels tilført. Akkumulering av stedegent organisk materiale er resultatet av at det over lengre tid (gjerne tusener av år) produseres mer organisk materiale enn det som brytes ned (dvs. at produksjonshastigheten er større enn nedbrytnings¬hastigheten, slik som f.eks. i torvmarker). Torv er stedegent akkumulert materiale, avsatt i fuktig/vannmettet miljø, hvis tørrvekt utgjøres av mer enn 30 % dødt organisk materiale. Tilført organisk materiale akkumuleres når tilførselen over lengre tid er større enn summen av bortførselen og nedbrytningen på stedet. Dy er akkumulert organisk materiale bestående av ukonsoliderte (løse) innsjøsedimenter som først og fremst inneholder utfelte humuspartikler og torvmosesrester, for det meste produsert alloktont. Gytje er innsjøsedimenter som hovedsakelig består av rester av planter og dyr som har levd i innsjøen, det vil si som er produsert autoktont. Mengden av organisk materiale har betydning for artssammensetning og økosystemfunksjon både i landsystemer og i vannsystemer. I landsystemer (fastmarks- og våtmarkssystemer) skiller torvmarker (IO∙b¤) seg fra mark dominert av uorganisk materiale med hensyn til mange viktige økosystemegenskaper [dynamikk, evne til vannlagring, artssammensetning dominert av moser, ofte torvmoser (Sphagnum spp.)]. I vannsystemer har sedimentenes innhold av organisk materiale betydning bl.a. fordi det organiske materialet fungerer som mat for detritusspisere og fordi det påvirker sedimentenes erosjonsutsatthet og dermed dets egnethet for organismer med ulike mekanismer for å holde seg fast i substratet.',
)

# %% JF
jf_lec = LEC(
    _id='JF',
    structuringProcess=d_structuring_process,
    paternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=4,
    spatialScale=3,
)
jf_lec_info_en = LECInfo(
    language=en_language,
    lec=jf_lec,
    name='Solifluction',
    description='Variation in topsoil stability; i.e., the tendency of soil to become saturated with water during snowmelt and subsequently move downslope; high intensity of solifluction typically results in formation of soli-fluction lobes at which woody plants are lacking and small bryophytes and lichens dominates on fine soil',
)
jf_lec_info_nb = LECInfo(
    language=nb_language,
    lec=jf_lec,
    name='Jordflyt',
    description='''Jordflyt (solifluksjon) forekommer først og fremst i arktiske og alpine områder, og er resultatet av fullstendig vannmetning av jordsmonnet, gjerne under snøsmeltingen eller ved kontinuerlig overrisling med smeltevann fra ovenforliggende snøfonner. Hvis den vannmettete jorda får en viskøs konsistens, kan den begynne å flyte nedover i terrengets helningsretning. Hastigheten på flytjordas bevegelser varierer fra langsom i vegetasjonsdekte skråninger der jordflyt er synlig som valkeaktige flytjordstunger [NiN 1: landformenheten flytjordsvalk (ML–8)], til raskere i brattere skråninger med mer sparsomt vegetasjonsdekke. Når flytjorda tørker opp utover sommeren, får den en skorpeliknende overflate. Alle faktorer som fremmer langvarig vannmetting av jorda, deriblant regionale faktorer som økende nedbør (i form av snø), det vil si et mer humid klima og lavere temperaturer (økende snødekkevarighet), og lokale faktorer som økende helning og lokal snøakkumulasjon, øker sannsynligheten for jordflyt. Solifluksjonstendensen øker derfor med økende høyde over havet og økende breddegrad, og fra rabbe mot snøleie. I seine snøleier og ekstremsnøleier og i mellomalpin sone bærer nesten all mark preg av jordflyt.
	Dahl (1957) bruker begrepet ’solifluksjon’ (som på norsk betyr jordbevegelse) i vid betydning, både om jordflyt i snever betydning (slik begrepet er definert i NiN 2) og om oppfrysing (‘amorphous solifluction’ og ‘structured solifluction’).
	Vedplanter har en vekstform som gjør dem følsomme for jordustabilitet (langsom vekst, lav toleranse for mekanisk skade) og faller derfor ut mot høyden, både på grunn av lave temperaturer og fordi all jorddekt mark er oppfrysings- eller flytjordsmark. Over vedplantegrensa. Små, forstyrrelsestoleranse levermoser og noen bladmoser og lav dominert på flytjordsmark. Det finner sted en artsuttynning langs JF, men forstyrrelseseffekten av jordflyt er ikke sterk nok til å ende i et disruptivt trinn som f.eks., for erosjonsutsatthet (ER) og vindutsatthet (VI).
''',
)

# %% JV
jv_lec = LEC(
    _id='JV',
    structuringProcess=s_structuring_process,
    paternOfVariation=ga_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
jv_lec_info_en = LECInfo(
    language=en_language,
    lec=jv_lec,
    name='Geothermal influence',
    description='Variation in geothermal energy supplies, carried by water or gas, ranging from no influence on the species composition via increasing dominance by specialist organisms (eventually only bacteria), at >100 °C ending in a species-thinning situation; no sessile organism maintains persistent populations in such sites',
)
jv_lec_info_nb = LECInfo(
    language=nb_language,
    lec=jv_lec,
    name='Jordvarmeinnflytelse',
    description='''Jordvarme (JV) er uttrykk for intensitet i tilførsler av geotermisk energi utover det normale for et gitt område. Jordvarmeinfluert natur finnes på land, i våre områder med vann som varmebærer (varm kilde), og på havbunnen (varm havkilde) med vann eller gass som varmebærere. Liksom variasjonen i graden av kildestyrke (konsentrert kildevannstilførsel) fra kildesentrum til kildeperiferi i kaldkilde, varierer graden av jordvarmeinnflytelse fra sentrum til periferi i varm kilde og i varm havkilde. 
	Jordvarmeinfluerte kildeområder (JV∙ab) forekommer på Spitsbergen som et fåtall små ’øyer’ av varm kilde, og på havbunnen flere steder (alle trinn) tilknytning til den midtatlantiske rygg (f.eks. Lokeslottet og Mohnryggen).
	Til grunn for basistrinninndelingen av jordvarmeinnflytelse (JV) er lagt at dette er en gradient som ender i et artsuttynningsintervall, at artsuttynningsintervallets nedre endetrinn er JV∙c, og at gradientens naturlige øvre endetrinn er der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da erosjonsutsatthet (ER) deles i sju basistrinn.
''',
)

# %% KA
ka_lec = LEC(
    _id='KA',
    structuringProcess=s_structuring_process,
    paternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=5,
    spatialScale=7,
)
ka_lec_info_en = LECInfo(
    language=en_language,
    lec=ka_lec,
    name='Lime richness',
    description='Co-ordinated variation in many chemical charac-teristics of soil and water, such as alkalinity (pH) and availability of micro- and macronutrients such as Ca, K, Na, Mg, often also N and P, which regulate many important biological processes; position along KA is influenced by the mineral composition of bedrock, parallelling a gradient from silicate-rich to carbonate-rich bedrock with different weathering properties',
)
ka_lec_info_nb = LECInfo(
    language=nb_language,
    lec=ka_lec,
    name='Kalkinnhold',
    description='''Variasjonen i markas reaksjon (surhet) og normale innhold av viktige mineralnæringsstoffer er en av de aller viktigste kildene til variasjon i planteartssammensetning og jordfauna, både i fastmarkssystemer og i våtmarkssystemer.  Grunnlaget for variasjon langs kalkinnhold (KA) i naturen er variasjon i kjemisk sammensetning og fotvitringsegenskaper langs en berggrunnsgeologisk gradient fra silikat- til karbonatbergarter. Viktige enkeltvariabler som bidrar til denne komplekse miljøgradienten er surhetsgrad (som kan uttrykkes ved pH i vann, vannekstrakt av jord eller i vannvaskete bergartstuffer) og konsentrasjonen av en rekke mineralnæringsstoffer (viktigst er makronæringsstoffene K, Na, Ca, Mg, men en rekke mikronæringsstoffer som B, Se, Fe og andre er også viktige). Makronæringsstoffene N og P følger i stor grad innholdet i marka av de andre makronæringsstoffene (særlig følger N gjerne Ca). Plantenes tilgang på fosfat (P) avtar ofte når Ca-innholdet (og pH) øker, fordi fosfatet da blir sterkere kjemisk bundet. Det samme gjelder for jern og mangan. Kalkinnhold (KA) er valgt som betegnelse for denne lokale komplekse miljøvariabelen, ikke fordi kalsiuminnhold i seg sjøl er en hovedårsak til variasjonen i artssammensetning, men fordi kalsiumkonsentrasjonen i substratet (jorda, vannet) er et godt uttrykk for variasjon langs den. Kalkinnhold (KA) er også relevant for ferskvannsforekomster; såvel bunnsystemene som vannmassene.
	 Den grunnleggende årsaken til variasjon i kalkinnhold (KA) i landsystemer er den store variasjonen mellom bergarter med hensyn til kjemisk sammensetning og forvitringsegenskaper (se NiN[1] Artikkel 19). Karbonatbergarter eller kalksteinsbergarter domineres totalt av karbonat (CO32–), som kan finnes som kalsiumkarbonat (kalkstein, kalkmarmor) eller som kodominant med magnesium (dolomitt eller dolomittmarmor). Det fins også en karbonatbergart med kun magnesium (magnesitt), men denne er sjelden i Norge og finnes ikke rein over større områder. Magnesitt kan finnes med innblanding (årer) av andre bergarter, eller forekommer som årer i andre dominerende bergarter. Det er ikke påvist at variasjonen fra Ca-dominerte til Mg-dominerte karbonatbergarter har betydning for sammensetningen av assosierte arter. 
De fleste viktige næringsstoffene (K, N, P, Mg) er positivt korrelert med innholdet av Ca (kalkinnholdet). Dette gjelder også for rein skjelettjord av kalkbergarter (som forekommer i høgalpine og arktiske områder), men med den viktige forskjellen at P, Fe og Mn her er negativt korrelert med kalsiumkonsentrasjonen. Dette kommer av at disse grunnstoffene er sterkere kjemisk bundet ved høyere enn ved lavere pH (dette er utdypet i NiN[1] Artikkel 27). Også et viktig næringsstoff som kalium kan ha lavere konsentrasjoner i slik jord enn i jord dannet ved forvitring av intermediære bergarter som for eksempel glimmerskifer. I harde silikatbergarter finnes kalsium i veldig små mengder samtidig som konsentrasjonene av de andre mineralnæringsstoffene er lave. Endringen i kalsiuminnholdet i jorda gjennom podsolering (som er utførlig forklart i NiN[1] Artikkel 27) følges av utvasking av de fleste næringsstoffer som vanligvis er korrelert med kalsiuminnholdet. Én og samme bergart kan dekke et område med (lineær) utstrekning på flere titalls mil (for eksempel grunnfjelldekket i Sørøst-Norge og gneisdekket på Nordvestlandet), men forekomster av bergarter (og mineraler) som skiller seg vesentlig fra omgivelsene også være svært små (noen nedre grense finnes ikke). ’Normal’ skala for variasjon i bergartsegenskaper med betydning for plassering av marksystemer langs kalkinnhold (KA) er i størrelsesorden 1–100 km.
	Berggrunnens innflytelse på markas kalkinnhold (KA) modifiseres gjennom to prosesser; forekomsten av et løsmassedekke oppå det faste fjellet, og utviklingen av et jordsmonn (oppå det eventuelle løsmassedekket). Løsmasser består av knust og blandet mineralmateriale og inneholder ofte en blanding av bergarter fra opprinnelsessteder langt unna stedet der løsmassene blir avsatt. Jordsmonnsutviklingen innebærer akkumulering av organisk materiale og utvasking av mineralnæringsstoffer. Resultatet blir en toppjord som kan være (vesentlig) surere enn mineraljordsmaterialet toppjorda hviler på (se NiN[1] Artikkel 27). Jordsmonnsutviklingen har ulike forløp på ulike steder, avhengig av en lang rekke faktorer som varierer på finere skala enn berggrunnsegenskapene (helning, vanntilgang, løsmassefordeling, eksposisjon etc.). Toppjorda viser derfor variasjon i kalkinnhold (KA ) over stor skalaspennvidde. Flere undersøkelser viser at torv-pH og innholdet av mineralnæringsstoffer i torva varierer både mellom torvmarksområder, avhengig av terrengformvariasjon og vanntilførsler (f.eks. R. Økland et al. 2001a), og innen hvert enkelt myrområde som følge av myras hydromorfologi (Sjörs 1948, Malmer 1962, R. Økland 1989a). På høymyrer er overgangen mellom ombrogene og minerogene (jordvannspåvirkete) områder område ofte gradvis, men den kan også være skarp. Både på åpen myrflate og i myrskogsmark finnes variasjon i kalkinnhold (KA) også på fin skala på grunn av interaksjon mellom kalkinnhold (KA) og mikrotopografi [som kommer til uttrykk som LKM oversvømmingsvarighet (OV)]: tuenivå har lavere pH og lavere mineralnæringsinnhold enn fastmatte og mykmatte på grunn av forskjeller i kjemiske prosesser mellom torv med ulik grad av gjennomlufting (Malmer 1962). Tyler (1981) viser at artenes fordeling innenfor myr som overveiende er ekstremt mineralnæringsrik kan gjenspeile variasjon i avstand til grunnvannsspeil og pH på skalaer ned til under 10 cm.

	Helt tilsvarende variasjon i kalkinnhold (KA), for eksempel uttrykt ved pH, finnes i humuslaget i fastmarksskogsmark. På steder med kalkrik berggrunn kan variasjonen i artssammensetning på relativt fin skala være stor, med forekomst av naturtyper som kjennetegner svakt kalkfattig mark (KA∙ab) på steder med grunt jordsmonn og av naturtyper som kjennetegner KA∙cd eller opp til og med KA∙f litt kalkfattig (mark) på steder med tjukt jordsmonn rikt på organisk materiale. På steder med berggrunn som i utgangspunktet er kalkfattig kan gunstige topografiske forhold, finmaterialrike løsmasser og/eller tilførsel av kildevann kunne resultere i mark som er opp til 4–5 basistrinn mer kalkrik enn berggrunnen i seg sjøl skulle tilsi (R. Økland & Eilertsen 1993). Også i skogsmark finnes imidlertid variasjon i kalkinnhold (KA) på svært fine skalaer, ned mot centimetere, som følge av biologiske prosesser (dyreaktivitet, for eksempel gravende maur; Lyford 1964), tilførsel av død ved, små jordskred etc. (Troedsson & Lyford 1973). ’Normal’ skala for variasjon på trinn-nivå langs økoklinen kalkinnhold (KA) i skogsmark er imidlertid i området 10–100(–1000) m.
	I ferskvannssystemer, i noen grad også i våtmarkssystemer, skjer en sterk utjevning av variasjonen i kalkinnhold (KA) på grunn av vannmasseblanding. Vannmassene i innsjøer, også store innsjøer, kan derfor (vanligvis) plaserers innenfor ett og samme trinn langs kalkinnhold (KA). Relevant skala er lik skalaen for variasjon i bergartsegenskaper, det vil si 1–100 km (103–105 m).
	Saltvannssystemer er, i likhet med de enkelte ferskvannsforekomstene, homogene med hensyn til kalkinnhold (KA) på grunn av vannmasseblanding.
	De viktigste enkeltmiljøvariablene som varierer langs kalkinnhold (KA), og som kan nyttes/har vært nyttet til å karakterisere trinn langs denne komplekse miljøgradienten, er pH og kalsiumionekonsentrasjonen. Ingen av disse egenskapene kan imidlertid nyttes til å karakterisere trinnene entydig, av flere grunner. For det første utgjør miljøvariablene som varierer langs kalkinnhold (KA) en kompleks gradient i ordets egentlige betydning; den består av mange enkeltvariabler som slett ikke følger hverandre helt. Dessuten modifiseres trinngrensene av mediets egenskaper; samme arter vil normalt ha sitt forekomstområde ved lavere pH i jord med høyt organisk innhold enn i rein mineraljord, og ved lavere pH når målinger blir foretatt direkte i fuktig torv enn i vannekstrakt.
	Målinger av pH og kalsiuminnhold både i myrvann og i myrtorv er nøkkelen til koblingen mellom trinndelingen av kalkinnhold (KA) i ferskvann slik den blir benyttet i Vannveilederen (Anonym 2013) og i fastmarkssystemer. En sammenlikning mellom Ca-konsentrasjoner som karakteriserer trinn betegnet ‘ekstremfattig’, ‘middelfattig’, ‘intermediært’, ‘middelrikt’ og ‘ekstremrikt’ hos Sjörs & Gunnarsson (2002) med trinn betegnet ‘svært kalkfattig’, ‘kalkfattig’, ‘moderat kalkrik’ og ‘kalkrik’ i Vannveilederen avslører at samme betegnelse benyttes om forskjellige intervaller langs Ca-konsentrasjonsgradienten i de to fagtradisjonene. I NiN versjon 2 er betegnelsene i våtmarks/fastmarkstradisjonen, som også inkluderer begrepet ‘intermediært’, benyttet.
''',
)

# %% KI
ki_lec = LEC(
    _id='KI',
    structuringProcess=s_structuring_process,
    paternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=5,
    spatialScale=1,
)
ki_lec_info_en = LECInfo(
    language=en_language,
    lec=ki_lec,
    name='Strength of spring-water influence',
    description='Variation in the degree to which the water supplied to terrestrial, wetland, limnic or marine systems have characteristics of spring water, i.e., constancy throughout the year of flow and chemical composition of water including high concentrations of dissolved O2, and temperature near the annual mean temperature of the area. In wetlands, spring-water influence increases from a level (topogeneous) to a sloping (soligenous) ground-water table.',
)
ki_lec_info_nb = LECInfo(
    language=nb_language,
    lec=ki_lec,
    name='Kildevannspåvirkning',
    description='''Uttrykker variasjon i ’kildestyrke’ langs en gradient som kan følges i våtmarkssystemer som fuktes av vann med horisontalt (topogent) grunnvannsspeil, via myr og fastmark som fuktes av (soligent) vann med hellende grunnvannsspeil, til fuktmark og kilder som tilføres vann med kildevannsegenskaper. Stabile (eustatiske) kilder (Bilde 7) utgjør endepunktet for økoklinen. Kildevannspåvirkning finner også sted i fastmarkssystemer, fra systemer uten regelmessig tilførsel av grunnvann til frodige lier med tydelig tilførsel av friskt grunnvann (KI∙c) med kildevannsegenskaper (wet flushing; Dahl 1957; se også Samuelsson 1917, Nordhagen 1943, Malmström 1949, R. Økland & Bendiksen 1985, R. Økland & Eilertsen 1993). Begrepet kildestyrke adresserer arealenhetenes totale ‘kildekarakter’, det vil si deres plassering langs en kompleks miljøvariabel som omfatter vanntilførselsstabilitet, ’friskhet’ (oksygeninnhold), temperaturstabilitet, stabilitet i kjemisk innhold og kanskje også konsentrasjoner av enkelte kjemiske stoffer. Det er fortsatt ikke klarlagt hvilken eller hvilke økologiske enkeltfaktorer som er viktigste årsak(er) til variasjon i artssammensetning langs kildevannspåvirkning (KI).
	Variasjonen langs kildevannspåvirkning (KI) finnes ikke bare mellom kildevannspåvirkete områder, men gir seg tydelig til kjenne også innen hvert enkelt område, f.eks. som vegetasjonssonering og variasjon i temperatur fra sentrum til periferi innenfor store kilder med eustatisk kildesentrum [se eksempler fra Rondane i Dahl (1957)], og variasjon fra kildesentrum nedstrøms via svak kilde til kildemyr og myr uten synlig kildevannspåvirkning der eustatiske kilder forekommer i overkanten av større bakkemyrer. Fransson (1972: 28) beskriver denne gradienten slik: 'Teoretiskt borde det (...) existera en gradient källvegetation – soligen kärrvegetation – topogen vegetation'. 
	Variasjon relatert til kildevannspåvirkning (KI) er en særlig viktig årsak til variasjon i artssammensetningen i områder med stor storskala-topografisk variasjon (på Vestlandet, i Nord-Norge og i fjellet), fordi grovt relieff fremmer forekomsten av kildehorisonter.
	Kildevannspåvirkning (KI) er en kompleks miljøvariabel med nulltrinn der det ikke er noen sporbar effekt av tilførsel av vann med ‘kildevannsegenskaper’ og naturlig endetrinn i stabile kilder med en kontinuerlig strøm av vann med nær konstant temperatur.
''',
)

# %% KO
ko_lec = LEC(
    _id='KO',
    structuringProcess=s_structuring_process,
    paternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=5,
    spatialScale=9,
)
ko_lec_info_en = LECInfo(
    language=en_language,
    lec=ko_lec,
    name='Connectivity',
    description='Binary variable that separates isolated water bodies from water bodies that are part of more or less extensive watercourse networks; connectedness increases species richness of organisms with dispersal limitations such as fish, larger molluscs and crustaceans',
)
ko_lec_info_nb = LECInfo(
    language=nb_language,
    lec=ko_lec,
    name='Konnektivitet',
    description='En rekke ferskvannsorganismer (fisk, større bløtdyr, krepsdyr etc.) mangler i enkelte vannforekomster fordi de ikke har spredd seg dit; i mange tilfeller fordi vannforekomsten ligger isolert uten tilknytning til et større vassdrag gjennom en utløpsbekk eller -elv. Miljøfaktoren konnektivitet angir om en innsjø er forbundet med et større vassdrag gjennom en utløpsbekk eller -elv.',
)

# %% KT
kt_lec = LEC(
    _id='KT',
    structuringProcess=s_structuring_process,
    paternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=7,
)
kt_lec_info_en = LECInfo(
    language=en_language,
    lec=kt_lec,
    name='Spring category',
    description='Complex environmental factor by which springs are sorted by ecological context into six categories: peaty spring, spring without peat formation; spring in river or lake, cold marine water and gas spring, cold marine mud spring, and marine magma spring',
)
kt_lec_info_nb = LECInfo(
    language=nb_language,
    lec=kt_lec,
    name='Kildetype',
    description='Konsentrerte framspring av grunnvann, kilder, forekommer i mange ulike økologiske sammenhenger (deres økologiske kontekst eller ‘setting’). Kildenes økologisk sammenheng er gitt av det eller de natursystemene som dominerer omkring kildeframspringet. Her videreføres begrepet ‘kildetype’ om kildenes økologiske sammenheng jf. J. Økland & K. Økland 1996: 258–259). Inndelingen i kildetyper tar utgangspunkt i tredelingen hos J. Økland & K. Økland (1996), men modifiserer og utvider denne, og kobler den tydeligere til den økologiske sammenhengen kilden forekommer i, gitt av det omkringliggende natursystemet. Kildetype (KT) inkluderer også differensiering mellom ulike kategorier av havbunnskilder på basis av utstrømmingsmaterialets egenskaper; hva som strømmer ut er også et uttrykk for de geologiske prosessene som forårsaker utstrømming. ',
)

# %% KY
ky_lec = LEC(
    _id='KY',
    structuringProcess=s_structuring_process,
    paternOfVariation=t_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=10,
)
ky_lec_info_en = LECInfo(
    language=en_language,
    lec=ky_lec,
    name='Coastal water character',
    description='Variation in the degree to which marine water bodies have properties of coastal vs oceanic water masses; characteristics of the former are: more strongly fluctuating temperature and salinity throughout the year and larger supplies of river-transported sediments, organic material and nutrients',
)
ky_lec_info_nb = LECInfo(
    language=nb_language,
    lec=ky_lec,
    name='Kysttilknytning',
    description='Kystvann (og grunt fjordvann) skiller seg fra havvannmassene som levested for vannmassetilknyttete (pelagiale) organismer med hensyn til miljøstabilitet og variasjonsmønster, lokalt og over tid, for en lang rekke viktige miljøvariabler. Kystvannet har en større temperaturvariasjon gjennom året, som følger en noe annen årstidsrytme, enn havvannet. Mens havvannets salinitet varierer lite (i området 34,2–35,5 ‰), er det betydelig variasjon i kystvannets salinitet, på lokal/regional skala (som følge av variasjon i ferskvannstilførsler fra store elver). Variasjonen i tilførsler av sedimenter, løst og partikulært organisk materiale, næringsstoffer (N, P) etc. følger samme mønstre. Dette gir opphav til variasjon i artssammensetningen langs en gradient fra havtilknyttete (oseaniske) til kysttilknyttete (nerittiske) arter.',
)

# %% LA
la_lec = LEC(
    _id='LA',
    structuringProcess=l_structuring_process,
    paternOfVariation=gs_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
la_lec_info_en = LECInfo(
    language=en_language,
    lec=la_lec,
    name='Slow primary succession',
    description='Stages along a primary succession that takes more than 100–200 years to complete (rapid successions, lasting <100 years, are considered as short-term environmental variation), from the initial, pioneer stage, via colonization, establishment and consolidation stages to the post-successional stage in which species composition is in a dynamic equilibrium with the environment',
)
la_lec_info_nb = LECInfo(
    language=nb_language,
    lec=la_lec,
    name='Langsom primær suksesjon',
    description='''Primære suksesjoner, dvs. suksesjoner på uorganiske (minerogene) livsmedier, er vanligvis, men ikke alltid, resultatet av en forutgående forstyrrelse. Forstyrrelser, naturlige så vel som menneskebetingete, forårsaker suksesjoner hvis og bare hvis forstyrrelsesfrekvensen er så lav at ’tilbakebetalingen’ av endringsgjelden kommer i gang før neste forstyrrelsesbegivenhet inntreffer. Systemer preget av aktiv destabiliserende forstyrrelse (f.eks. urer og rasmarker, sandskredmarker og sanddynemark), kjennetegnet ved (relativt) høy forstyrrelsesfrekvens, er derfor mer eller mindre kontinuerlig i en dynamisk tidligsuksesjonsfase og framviser derfor i liten grad eller ikke i det hele tatt grad variasjon langs en suksesjonsgradient. Systemer preget av tidligere (historisk) disruptiv og regulerende forstyrrelse (systemer med ekstremverdiregulering, der forstyrrelsen bortimot er en engangsbegivenhet i et økologisk tidsperspektiv på noen tusen år), gjennomgår oftest en langsom suksesjon, definert som ʼprimær suksesjon som forventes ikke å nå ettersuksesjonstilstanden i løpet av (100–)200 årʼ. Det finnes natur som fortsatt, tusener av år etter at marka eller bunnen ble lagt åpen for primær suksesjon, mangler slike, mer eller mindre stabile ettersuksesjonssamfunn. Dette kan skyldes at substratet er hardt, grovkornet, værutsatt eller utsatt for gjentatte forstyrrelser. 
	Motsatsen til langsom primær suksesjon (LA) er tilstandsvariabelen rask suksesjon. Det finnes ingen skarp grense mellom rask og langsom suksesjon. Om et suksesjonsforløp skal bli langsomt eller raskt, bestemmes først og fremst av markas/bunnens beskaffenhet. Suksesjoner på grove uorganiske livsmedier (fast fjell, blokker og stein) kan gå svært langsomt og ikke fullføres i løpet av et økologisk relevant tidsintervall (>> 100 år), mens suksesjoner på finere substrater kan fullføres i løpet av under 100 år. I førstnevnte tilfelle skal suksesjonsforløpet etter definisjonene beskrives som tilstandsvariasjon, i sistnevnte tilfelle skal det beskrives som lokal basal øko-variasjon [LKM langsom primær suksesjon (LA)]. Suksesjoner innenfor systemer som er skapt av omfattende forstyrrelse, naturlig eller menneskebetinget, skal beskrives som variasjon langs den lokale basale variabelen langsom primær suksesjon (LA) hvis (og bare hvis) markas eller bunnens beskaffenhet (fjell, blokker og stein) gjør at suksesjonsforløpet ikke fullføres i løpet av et tidsintervall på 100–200 år. Dette gjelder også suksesjoner i sterkt endrete systemer med tilsvarende mark/bunnegenskaper.
	Den prinsipielle håndteringen av artrsuttynningssituasjoner spesielt, og langsom primær suksesjon (LA) spesielt (se NiN[2] Artikkel 2, kapittel B2i punkt 3 og kapittel B3j), er å foreta en standardisert inndeling i fire hovedtypetilpassete standardtrinn før ettersuksesjonsfasen nås (se framlegg til trinndeling nedenfor, der de tre mellomtrinnene hver er delt i to basistrinn og betegnet henholdsvis LA∙0, LA∙ab, LA∙cd og LA∙ef). Denne løsningen forutsetter at hele artssammensetningen skiftes ut i løpet av suksesjonsforløpet og at gradientlengden LA∙0 – LA∙+ > 5 ØAE; en virkelighetsbeskrivelse som forutsetter at pionérarter og tidligsuksesjonsarter avløser hverandre langs suksesjonsgradienten. Et slikt suksesjonsforløp kan tenkes å finne sted ved vegetasjonsetablering på lite forstyrrelsesutsatte sedimenter blottlagt når snø og is trekker seg tilbake (breforland og snøavsmeltingsområde) og når land stiger av hav (grus-, stein- og blokkstrand). Langsom suksesjon kan imidlertid også forløpe som en omvendt artsuttynningssituasjon (se NiN[2] Artikkel 2, kapittel B2d punkt 5, B2h punkt 6, B2i punkt 3), i blant med stor grad av tilfeldighet med hensyn til artenes innvandringsorden. I slike tilfeller skal langsom primær suksesjon (LA) trinndeles deretter (se NiN[2] Artikkel 2, kapittel B2h, punkt 9). Standardavstanden mellom typiske utforminger av endetrinnsnaturtyper langs en ren artsuttynningsgradient er satt til 2,4 ØAE, som gir grunnlag for oppdeling i 3 hovedtypespesifikke trinn og 4 basistrinn (se NiN[2] Artikkel 2, kapittel B2i punkt 3). Imidlertid er det nok vanligere at tidlige faser i primære suksesjonsforløp preges av stor grad av tilfeldighet i artssammensetningen (det vil si at det i liten grad er forutsigbart på hvilket stadium i suksesjonen hver art kommer inn) og ikke av systematisk artsutskifting. Tilfeldig etablering inntil systemet begynner å mettes med arter og viktige lokale komplekse miljøvariabler blir viktige for strukturering av artssammensetningen, innebærer at er det langt mindre økologisk avstand mellom det nakne starttrinnet og etablerte samfunn fordi ingen eller bare et fåtall arter har artsspesifikke, distinkte responskurver i forhold til suksesjonsgradienten. Forskjellen i artssammensetning mellom suksesjonsfasene består da først og fremst i forskjeller i total artsmengde, ikke i systematiske forskjeller i hver enkelt arts mengde. Til grunn for trinndeling av langsomme suksesjoner med stor grad av tilfeldighet i artenes etablering, skal legges at den økologiske avstanden fra og med ekstrempunktet (utgangspunktet for suksesjonen) til ettersuksesjonstilstanden ligger i intervallet 2–3 ØAE. Dette synes f.eks. å være tilfellet ved primær suksesjon på bergvegger, i åpen flomfastmark etc., der arter gradvis akkumuleres over tid inntil det er etablert et økosystem der interaksjoner mellom arter også finner sted. Den viktigste interaksjonsprosessen er vanligvis kontramensalisme, hvorved en art favoriseres av å kunne benytte en annen art som substrat. I slike tilfeller skal antallet trinn reduseres, ved sammenslåing av to eller alle de tre trinnene naken mark, koloniserings- og etableringsfasen (fellesbetegnelsen pionérfase skal brukes om sammenslåtte trinn som inkluderer LA∙0)
''',
)

# %% LK
lk_lec = LEC(
    _id='LK',
    structuringProcess=l_structuring_process,
    paternOfVariation=f_pattern_of_variation,
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
    paternOfVariation=f_pattern_of_variation,
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
    paternOfVariation=g_pattern_of_variation,
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
    paternOfVariation=f_pattern_of_variation,
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
    paternOfVariation=ga_pattern_of_variation,
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
    paternOfVariation=g_pattern_of_variation,
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
    paternOfVariation=g_pattern_of_variation,
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
    paternOfVariation=g_pattern_of_variation,
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
    paternOfVariation=f_pattern_of_variation,
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
    paternOfVariation=ga_pattern_of_variation,
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
    paternOfVariation=g_pattern_of_variation,
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
    paternOfVariation=ga_pattern_of_variation,
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
    paternOfVariation=ga_pattern_of_variation,
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
    paternOfVariation=f_pattern_of_variation,
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
    paternOfVariation=ga_pattern_of_variation,
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
    paternOfVariation=t_pattern_of_variation,
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
    paternOfVariation=gs_pattern_of_variation,
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
    paternOfVariation=ga_pattern_of_variation,
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
    paternOfVariation=ga_pattern_of_variation,
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
    paternOfVariation=f_pattern_of_variation,
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
    paternOfVariation=f_pattern_of_variation,
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
    paternOfVariation=mf_pattern_of_variation,
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
    paternOfVariation=mf_pattern_of_variation,
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
    paternOfVariation=mf_pattern_of_variation,
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
    paternOfVariation=mf_pattern_of_variation,
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
    paternOfVariation=mf_pattern_of_variation,
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
    paternOfVariation=g_pattern_of_variation,
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
    paternOfVariation=g_pattern_of_variation,
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
    paternOfVariation=g_pattern_of_variation,
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
    paternOfVariation=g_pattern_of_variation,
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
    paternOfVariation=g_pattern_of_variation,
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
    paternOfVariation=ga_pattern_of_variation,
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
    paternOfVariation=t_pattern_of_variation,
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
