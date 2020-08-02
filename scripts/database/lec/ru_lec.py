# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

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