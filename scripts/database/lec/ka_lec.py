# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% KA
ka_lec = LEC(
    _id='KA',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=5,
    spatialScale=7,
)
ka_lec_info_en = LECInfo(
    language_id='en',
    lec=ka_lec,
    name='Lime richness',
    description='Coordinated variation in many chemical characteristics of soil and water, such as alkalinity (pH) and availability of micro- and macronutrients such as Ca, K, Na, Mg, often also N and P, which regulate many important biological processes; position along KA is influenced by the mineral composition of bedrock, parallelling a gradient from silicate-rich to carbonate-rich bedrock with different weathering properties',
)
ka_lec_info_nb = LECInfo(
    language_id='nb',
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

# a
a_elem_segment=ElementarySegment(
    _id='KA.a',
    lec=ka_lec,
    value='a',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='very low in calcium'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='in woodland characterized by a small species pool with common, frugal and widespread species and occurrence of typical podsol profiles; soil typically formed by quartzite and sparagmite (and gneiss and granite; anorthosite in southwestern Norway)'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='svært kalkfattig'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='i skogsmark karakterisert ved liten artspool med vanlige, nøysomme og vidt utbredte arter og forekomst av typiske podsolprofiler; jord typisk dannet av kvartsitt og sparagmitt (og gneis og granitt; anortositt på Sørvestlandet)'
)
# bc
bc_elem_segment=ElementarySegment(
    _id='KA.bc',
    lec=ka_lec,
    value='bc',
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='en',
    key='<class>',
    value='fairly / slightly low in calcium'
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='en',
    key='<description>',
    value='in woodland characterized by the presence of typical podsol profiles; soil typically formed by gneiss and granite (bedrock)'
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='nb',
    key='<class>',
    value='temmelig/litt kalkfattig'
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='nb',
    key='<description>',
    value='i skogsmark karakterisert ved forekomst av typiske podsolprofiler; jord typisk dannet av gneis og granitt (grunnfjellsbergarter)'
)

# b
b_elem_segment=ElementarySegment(
    _id='KA.b',
    lec=ka_lec,
    value='b',
    order=1,
    relative_order=0,
    parent=bc_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='rather low in calcium'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='temmelig kalkfattig'
)
# c
c_elem_segment=ElementarySegment(
    _id='KA.c',
    lec=ka_lec,
    value='c',
    order=2,
    relative_order=1,
    parent=bc_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='slightly low in calcium'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<class>',
    value='litt kalkfattig'
)
# de
de_elem_segment=ElementarySegment(
    _id='KA.de',
    lec=ka_lec,
    value='de',
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='en',
    key='<class>',
    value='weak / strong intermediate'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='en',
    key='<description>',
    value='in woodland characterized by the presence of podsol-like soil profiles; soil typically formed by poorer shale rocks, amphibolite and sandstone'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='nb',
    key='<class>',
    value='svak/sterk intermediær'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='nb',
    key='<description>',
    value='i skogsmark karakterisert ved forekomst av podsol-liknende jordprofiler; jord typisk dannet av fattigere skiferbergarter, amfibolitt og sandstein'
)
# d
d_elem_segment=ElementarySegment(
    _id='KA.d',
    lec=ka_lec,
    value='d',
    order=3,
    relative_order=0,
    parent=de_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<class>',
    value='weak intermediate'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<class>',
    value='svak intermediær'
)
# e
e_elem_segment=ElementarySegment(
    _id='KA.e',
    lec=ka_lec,
    value='e',
    order=4,
    relative_order=1,
    parent=de_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<class>',
    value='strong intermediate'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<class>',
    value='sterk intermediær'
)
# fg
fg_elem_segment=ElementarySegment(
    _id='KA.fg',
    lec=ka_lec,
    value='fg',
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=fg_elem_segment,
    language_id='en',
    key='<class>',
    value='slightly / rather calcareous'
)
ElementarySegmentInfo(
    elementarySegment=fg_elem_segment,
    language_id='en',
    key='<description>',
    value='in forest land characterized by the presence of real brown soil profiles; soil typically formed by mica shale and fillites'
)
ElementarySegmentInfo(
    elementarySegment=fg_elem_segment,
    language_id='nb',
    key='<class>',
    value='litt/temmelig kalkrik'
)
ElementarySegmentInfo(
    elementarySegment=fg_elem_segment,
    language_id='nb',
    key='<description>',
    value='i skogsmark karakterisert ved forekomst av ekte brunjordsprofiler; jord typisk dannet av glimmerskifer og fyllitter'
)
# f
f_elem_segment=ElementarySegment(
    _id='KA.f',
    lec=ka_lec,
    value='f',
    order=5,
    relative_order=0,
    parent=fg_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='en',
    key='<class>',
    value='a little calcareous'
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='nb',
    key='<class>',
    value='litt kalkrik'
)
# g
g_elem_segment=ElementarySegment(
    _id='KA.g',
    lec=ka_lec,
    value='g',
    order=6,
    relative_order=1,
    parent=fg_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=g_elem_segment,
    language_id='en',
    key='<class>',
    value='rather calcareous'
)
ElementarySegmentInfo(
    elementarySegment=g_elem_segment,
    language_id='nb',
    key='<class>',
    value='temmelig kalkrik'
)
# hi
hi_elem_segment=ElementarySegment(
    _id='KA.hi',
    lec=ka_lec,
    value='hi',
    relative_order=4
)
ElementarySegmentInfo(
    elementarySegment=hi_elem_segment,
    language_id='en',
    key='<class>',
    value='very / extremely calcareous'
)
ElementarySegmentInfo(
    elementarySegment=hi_elem_segment,
    language_id='en',
    key='<description>',
    value='characterized by the occurrence of a very large species pool with many less common species; soils typically formed of pure carbonate rocks such as limestone, dolomite and marble; the extreme step (i) comprises sites with direct influence from carbonate rocks, e.g. naked limestone mountain'
)
ElementarySegmentInfo(
    elementarySegment=hi_elem_segment,
    language_id='nb',
    key='<class>',
    value='svært/ekstremt kalkrik'
)
ElementarySegmentInfo(
    elementarySegment=hi_elem_segment,
    language_id='nb',
    key='<description>',
    value='karakterisert ved forekomst svært stor artspool med mange mindre vanlige arter; jord typisk dannet av reine karbonatbergarter som kalkstein, dolomitt og marmor; ekstremtrinnet (i) omfatter steder med direkte innflytelse fra karbonatbergarter, f.eks. nakent kalkberg'
)
# h
h_elem_segment=ElementarySegment(
    _id='KA.h',
    lec=ka_lec,
    value='h',
    order=7,
    relative_order=0,
    parent=hi_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=h_elem_segment,
    language_id='en',
    key='<class>',
    value='very calcareous'
)
ElementarySegmentInfo(
    elementarySegment=h_elem_segment,
    language_id='nb',
    key='<class>',
    value='svært kalkrik'
)
# i
i_elem_segment=ElementarySegment(
    _id='KA.i',
    lec=ka_lec,
    value='i',
    order=8,
    relative_order=1,
    parent=hi_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=i_elem_segment,
    language_id='en',
    key='<class>',
    value='extremely calcareous'
)
ElementarySegmentInfo(
    elementarySegment=i_elem_segment,
    language_id='nb',
    key='<class>',
    value='ekstremt kalkrik'
)