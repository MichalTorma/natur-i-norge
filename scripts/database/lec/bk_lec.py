# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% BK
bk_lec = LEC(
    _id='BK',
    structuringProcess_id='S',
    patternOfVariation_id='f',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=5,
)
bk_lec_info_en = LECInfo(
    language_id='en',
    lec=bk_lec,
    name='Categories of bedrock with deviating chemical composition',
    description='Complex environmental factor that separates from \'normal\' bedrock four categories of bedrock with systematically deviating elemental composition: ultramafic rock (rich in heavy metals); acidic sulphide mineral- and iron-rich rocks; less acidic sulphide mineral- and copper-rich rocks; and lava.',
)
bk_lec_info_nb = LECInfo(
    language_id='nb',
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

# 0
nul_elem_segment=ElementarySegment(
    _id='BK.0',
    lec=bk_lec,
    value='0',
    order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='Class',
    value='normal'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='Trinnbetegnelse',
    value='normal'
)

# a
a_elem_segment=ElementarySegment(
    _id='BK.a',
    lec=bk_lec,
    value='a',
    order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='Class',
    value='ultramafic'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='Trinnbetegnelse',
    value='ultramafisk'
)

# b
b_elem_segment=ElementarySegment(
    _id='BK.b',
    lec=bk_lec,
    value='b',
    order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='Class',
    value='iron-rich'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='Trinnbetegnelse',
    value='jern-rikt'
)

# c
c_elem_segment=ElementarySegment(
    _id='BK.c',
    lec=bk_lec,
    value='c',
    order=3
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='Class',
    value='copper-rich'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='Trinnbetegnelse',
    value='kobber-rikt'
)

# d
d_elem_segment=ElementarySegment(
    _id='BK.d',
    lec=bk_lec,
    value='d',
    order=4
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='Class',
    value='lava'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='Trinnbetegnelse',
    value='lava'
)