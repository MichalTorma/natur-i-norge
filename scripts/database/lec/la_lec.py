# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% LA
la_lec = LEC(
    _id='LA',
    structuringProcess_id='L',
    patternOfVariation_id='gs',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
la_lec_info_en = LECInfo(
    language_id='en',
    lec=la_lec,
    name='Slow primary succession',
    description='Stages along a primary succession that takes more than 100–200 years to complete (rapid successions, lasting <100 years, are considered as short-term environmental variation), from the initial, pioneer stage, via colonization, establishment and consolidation stages to the post-successional stage in which species composition is in a dynamic equilibrium with the environment',
)
la_lec_info_nb = LECInfo(
    language_id='nb',
    lec=la_lec,
    name='Langsom primær suksesjon',
    description='''Primære suksesjoner, dvs. suksesjoner på uorganiske (minerogene) livsmedier, er vanligvis, men ikke alltid, resultatet av en forutgående forstyrrelse. Forstyrrelser, naturlige så vel som menneskebetingete, forårsaker suksesjoner hvis og bare hvis forstyrrelsesfrekvensen er så lav at ’tilbakebetalingen’ av endringsgjelden kommer i gang før neste forstyrrelsesbegivenhet inntreffer. Systemer preget av aktiv destabiliserende forstyrrelse (f.eks. urer og rasmarker, sandskredmarker og sanddynemark), kjennetegnet ved (relativt) høy forstyrrelsesfrekvens, er derfor mer eller mindre kontinuerlig i en dynamisk tidligsuksesjonsfase og framviser derfor i liten grad eller ikke i det hele tatt grad variasjon langs en suksesjonsgradient. Systemer preget av tidligere (historisk) disruptiv og regulerende forstyrrelse (systemer med ekstremverdiregulering, der forstyrrelsen bortimot er en engangsbegivenhet i et økologisk tidsperspektiv på noen tusen år), gjennomgår oftest en langsom suksesjon, definert som ʼprimær suksesjon som forventes ikke å nå ettersuksesjonstilstanden i løpet av (100–)200 årʼ. Det finnes natur som fortsatt, tusener av år etter at marka eller bunnen ble lagt åpen for primær suksesjon, mangler slike, mer eller mindre stabile ettersuksesjonssamfunn. Dette kan skyldes at substratet er hardt, grovkornet, værutsatt eller utsatt for gjentatte forstyrrelser. 
	Motsatsen til langsom primær suksesjon (LA) er tilstandsvariabelen rask suksesjon. Det finnes ingen skarp grense mellom rask og langsom suksesjon. Om et suksesjonsforløp skal bli langsomt eller raskt, bestemmes først og fremst av markas/bunnens beskaffenhet. Suksesjoner på grove uorganiske livsmedier (fast fjell, blokker og stein) kan gå svært langsomt og ikke fullføres i løpet av et økologisk relevant tidsintervall (>> 100 år), mens suksesjoner på finere substrater kan fullføres i løpet av under 100 år. I førstnevnte tilfelle skal suksesjonsforløpet etter definisjonene beskrives som tilstandsvariasjon, i sistnevnte tilfelle skal det beskrives som lokal basal øko-variasjon [LKM langsom primær suksesjon (LA)]. Suksesjoner innenfor systemer som er skapt av omfattende forstyrrelse, naturlig eller menneskebetinget, skal beskrives som variasjon langs den lokale basale variabelen langsom primær suksesjon (LA) hvis (og bare hvis) markas eller bunnens beskaffenhet (fjell, blokker og stein) gjør at suksesjonsforløpet ikke fullføres i løpet av et tidsintervall på 100–200 år. Dette gjelder også suksesjoner i sterkt endrete systemer med tilsvarende mark/bunnegenskaper.
	Den prinsipielle håndteringen av artrsuttynningssituasjoner spesielt, og langsom primær suksesjon (LA) spesielt (se NiN[2] Artikkel 2, kapittel B2i punkt 3 og kapittel B3j), er å foreta en standardisert inndeling i fire hovedtypetilpassete standardtrinn før ettersuksesjonsfasen nås (se framlegg til trinndeling nedenfor, der de tre mellomtrinnene hver er delt i to basistrinn og betegnet henholdsvis LA∙0, LA∙ab, LA∙cd og LA∙ef). Denne løsningen forutsetter at hele artssammensetningen skiftes ut i løpet av suksesjonsforløpet og at gradientlengden LA∙0 – LA∙+ > 5 ØAE; en virkelighetsbeskrivelse som forutsetter at pionérarter og tidligsuksesjonsarter avløser hverandre langs suksesjonsgradienten. Et slikt suksesjonsforløp kan tenkes å finne sted ved vegetasjonsetablering på lite forstyrrelsesutsatte sedimenter blottlagt når snø og is trekker seg tilbake (breforland og snøavsmeltingsområde) og når land stiger av hav (grus-, stein- og blokkstrand). Langsom suksesjon kan imidlertid også forløpe som en omvendt artsuttynningssituasjon (se NiN[2] Artikkel 2, kapittel B2d punkt 5, B2h punkt 6, B2i punkt 3), i blant med stor grad av tilfeldighet med hensyn til artenes innvandringsorden. I slike tilfeller skal langsom primær suksesjon (LA) trinndeles deretter (se NiN[2] Artikkel 2, kapittel B2h, punkt 9). Standardavstanden mellom typiske utforminger av endetrinnsnaturtyper langs en ren artsuttynningsgradient er satt til 2,4 ØAE, som gir grunnlag for oppdeling i 3 hovedtypespesifikke trinn og 4 basistrinn (se NiN[2] Artikkel 2, kapittel B2i punkt 3). Imidlertid er det nok vanligere at tidlige faser i primære suksesjonsforløp preges av stor grad av tilfeldighet i artssammensetningen (det vil si at det i liten grad er forutsigbart på hvilket stadium i suksesjonen hver art kommer inn) og ikke av systematisk artsutskifting. Tilfeldig etablering inntil systemet begynner å mettes med arter og viktige lokale komplekse miljøvariabler blir viktige for strukturering av artssammensetningen, innebærer at er det langt mindre økologisk avstand mellom det nakne starttrinnet og etablerte samfunn fordi ingen eller bare et fåtall arter har artsspesifikke, distinkte responskurver i forhold til suksesjonsgradienten. Forskjellen i artssammensetning mellom suksesjonsfasene består da først og fremst i forskjeller i total artsmengde, ikke i systematiske forskjeller i hver enkelt arts mengde. Til grunn for trinndeling av langsomme suksesjoner med stor grad av tilfeldighet i artenes etablering, skal legges at den økologiske avstanden fra og med ekstrempunktet (utgangspunktet for suksesjonen) til ettersuksesjonstilstanden ligger i intervallet 2–3 ØAE. Dette synes f.eks. å være tilfellet ved primær suksesjon på bergvegger, i åpen flomfastmark etc., der arter gradvis akkumuleres over tid inntil det er etablert et økosystem der interaksjoner mellom arter også finner sted. Den viktigste interaksjonsprosessen er vanligvis kontramensalisme, hvorved en art favoriseres av å kunne benytte en annen art som substrat. I slike tilfeller skal antallet trinn reduseres, ved sammenslåing av to eller alle de tre trinnene naken mark, koloniserings- og etableringsfasen (fellesbetegnelsen pionérfase skal brukes om sammenslåtte trinn som inkluderer LA∙0)
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='LA.0',
    lec=la_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='initial phase'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='with intact signs of extensive disturbance'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='Species accumulation index',
    value='<0.1'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='initialfase'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='med intakt preg av omfattende forstyrrelse'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='Artsakkumuleringsindeks',
    value='<0,1'
)
# ab
ab_elem_segment=ElementarySegment(
    _id='LA.ab',
    lec=la_lec,
    value='ab',
    relative_order=1
)
ElementarySegment(
    _id='LA.a',
    lec=la_lec,
    value='a',
    order=1,
    relative_order=0,
    parent=ab_elem_segment
)
ElementarySegment(
    _id='LA.b',
    lec=la_lec,
    value='b',
    order=2,
    relative_order=1,
    parent=ab_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='en',
    key='<class>',
    value='colonization phase'
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='en',
    key='<description>',
    value='colonization of the substrate in progress, no still no indications of establishment of processes typical of natural soil (the expected state of post-succession)'
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='en',
    key='Species accumulation index',
    value='0.1-0.25'
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='nb',
    key='<class>',
    value='koloniseringsfase'
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='nb',
    key='<description>',
    value='kolonisering av substratet pågår, ingen fortsatt ingen indikasjoner på etablering av prosesser typisk for naturlig mark (den forventete ettersuksesjonstilstanden)'
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='nb',
    key='Artsakkumuleringsindeks',
    value='0,1-0,25'
)
# cd
cd_elem_segment=ElementarySegment(
    _id='LA.cd',
    lec=la_lec,
    value='cd',
    relative_order=2
)
ElementarySegment(
    _id='LA.c',
    lec=la_lec,
    value='c',
    order=3,
    relative_order=0,
    parent=cd_elem_segment
)
ElementarySegment(
    _id='LA.d',
    lec=la_lec,
    value='d',
    order=4,
    relative_order=1,
    parent=cd_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='<class>',
    value='establishment phase'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='<description>',
    value='incipient establishment of a system of natural soil, but most species typical of the post-succession state are missing; Some ecological processes that are typical of natural soil may be established'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='Species accumulation index',
    value='0.25-0.5'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='<class>',
    value='etableringsfase'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='<description>',
    value='begynnende etablering av et system med naturlig mark, men de fleste artene som er typisk for ettersuksesjonstilstanden mangler; enkelte økologiske prosesser som er typisk for naturlig mark kan være etablert'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='Artsakkumuleringsindeks',
    value='0,25-0,5'
)
# ef
ef_elem_segment=ElementarySegment(
    _id='LA.ef',
    lec=la_lec,
    value='ef',
    relative_order=3
)
ElementarySegment(
    _id='LA.e',
    lec=la_lec,
    value='e',
    order=5,
    relative_order=0,
    parent=ef_elem_segment
)
ElementarySegment(
    _id='LA.f',
    lec=la_lec,
    value='f',
    order=6,
    relative_order=1,
    parent=ef_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='<class>',
    value='consolidation phase'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='<description>',
    value='artssammensetning mer eller mindre dominert av arter typisk for ettersuksesjonstilstanden; prosesser som kjennetegner naturlig mark er tydelig observerbare og artssammensetningen er, eller begynner å bli, strukturert av lokale komplekse miljøvariabler; ett helhetlig økosystem kan være etablert, men dette vil over tid fortsette å endres, f.eks. ved jordsmonnsoppbygging'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='Species accumulation index',
    value='0.5-0.9'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='<class>',
    value='konsolideringsfase'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='<description>',
    value='artssammensetning mer eller mindre dominert av arter typisk for ettersuksesjonstilstanden; prosesser som kjennetegner naturlig mark er tydelig observerbare og artssammensetningen er, eller begynner å bli, strukturert av lokale komplekse miljøvariabler; ett helhetlig økosystem kan være etablert, men dette vil over tid fortsette å endres, f.eks. ved jordsmonnsoppbygging'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='Artsakkumuleringsindeks',
    value='0,5-0,9'
)
# plus
plus_elem_segment=ElementarySegment(
    _id='LA.+',
    lec=la_lec,
    value='+',
    order=7,
    relative_order=4
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='<class>',
    value='post-succession phase'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='<description>',
    value='without clear indications that changes that may be related to previous disturbance are still taking place; species composition more or less without species not typical of the post-succession condition; holistic system characterized by processes typical of natural soil'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='Species accumulation index',
    value='>0.9'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='<class>',
    value='ettersuksesjonsfase'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='<description>',
    value='uten tydelige indikasjoner på at endringer som kan relateres til tidligere forstyrrelse fortsatt finner sted; artssammensetning mer eller mindre uten arter som ikke er typisk for ettersuksesjons¬tilstanden; helhetlig system kjennetegnet av prosesser som er typisk for naturlig mark'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='Artsakkumuleringsindeks',
    value='>0,9'
)
