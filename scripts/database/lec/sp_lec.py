# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% SP
sp_lec = LEC(
    _id='SP',
    structuringProcess_id='R',
    patternOfVariation_id='t',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=4,
    spatialScale=6,
)
sp_lec_info_en = LECInfo(
    language_id='en',
    lec=sp_lec,
    name='Hay-meadow character',
    description='Binary variable that separates hayfields from pastures; hayfields are cultivated areas with haymaking, periodic harvesting of biomass (up to three times a year) with no nutrient return; pastures are areas characterised by livestock grazing, trampling, manuring and continuous, selective removal of biomass',
)
sp_lec_info_nb = LECInfo(
    language_id='nb',
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

# nul
nul_elem_segment=ElementarySegment(
    _id='SP.0',
    lec=sp_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='grazing'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='characterized by grazing as the dominant form of claim'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='beitepreget'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='preget av beite som dominerende hevdform'
)
# a
a_elem_segment=ElementarySegment(
    _id='SP.a',
    lec=sp_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='mowing'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='characterized by beaten as the dominant form of assertion'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='slåttepreget'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='preget av slått som dominerende hevdform'
)
