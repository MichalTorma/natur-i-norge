from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_9_mt = MinorType(
    _id = 'T4-9',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_9_mt,
    language_id='nb',
    key='<name>',
    value='Lyngskog',
)
MinorTypeInfo(
    minorType=t4_9_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Oftest halvåpne skoger hvor røsslyng gjerne spiller en svært viktig rolle. Bunnsjiktet er dominert av reinlaver i de mest kontinentale strøkene; andelen moser øker mot mer oseaniske strøk. Furu er det dominerende treslaget i mesteparten av landet. I BN, særlig på Sørlandet, kan også eik være et viktig innslag. Innenfor granas utbredelsesområde barblandingsskog, som varierer fra grandominans med konstant innslag av furu til mer likeverdig blanding av de to. Utviklet som furu- og/eller bjørkeskog utenfor granas utbredelsesområde, som ren bjørkeskog opp mot fjellet.',
)
MinorTypeInfo(
    minorType=t4_9_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Feltsjiktet typisk dominert av nøysomme og tørketolerante arter, i tillegg til røsslyng også bærlyng-arter. Furumose er ofte viktigste moseart og kan dominere på veldrenert mark, mens furutorvmose er viktigste dominant på fuktmark. Heigråmose spiller stor rolle og er dominerende mengdeart i oseaniske strøk. Lys og grå reinlav er karakteristiske innslag i bunnsjiktet. Kartleggingsenheten er knyttet til kalkfattig og tørkeutsatt grunn. Jordprofilet er et podsolprofil, men på mark med tynt jordsmonn utvikles ikke noen karakteristisk jordprofil. Kan dekke store arealer på elve- og breelvavsetninger (”furumoer”). ',
)
MinorTypeInfo(
    minorType=t4_9_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Opptrer under ulike eksposisjons- og helningsforhold, men særlig på veldrenerte flater, rygger og toppområder. Kan dekke store arealer på elve- og breelvavsetninger (”furumoer”). Farge varierer avhengig av dominerende treslag og tresjiktstetthet. Furudominans i tresjiktet gir olivengrønn farge, oftest med brun til mørkere grønnbrun farge i skogglenner. Ved høyere innslag av heigråmose (O2-O3) eller lyse lavarter dår enheten en mer grålig farge. Tekstur ofte varierende. Tekstur og farge ofte konsistent innen og mellom regioner gitt sammenliknbare dominansforhold i tre- og bunnsjikt.',
)

MinorTypeInfo(
    minorType=t4_9_mt,
    language_id='en',
    key='<name>',
    value='Lime-poor subxeric forest',
)
MinorTypeInfo(
    minorType=t4_9_mt,
    language_id='en',
    key='Physiognomy',
    value='Most often semi-open forests where heather often play a very important role. The bottom layer is dominated by reindeer lichens in the most continental regions; the proportion of mosses is increasing towards more oceanic areas. Pine is the dominant tree species in most of the country. In BN, especially in Sørlandet, oak can also be an important element. Within the spruce distribution area, bare-mixed forest, which varies from grandominance with a constant element of pine to a more equal mixture of the two. Developed as a pine and / or birch forest outside the spruce distribution area, as pure birch forest up against the mountain.',
)
MinorTypeInfo(
    minorType=t4_9_mt,
    language_id='en',
    key='Ecological characteristics',
    value='The field layer is typically dominated by frugal and drought tolerant species, in addition to heather also berry heather species. Pine moss is often the most important moss species and can dominate on well-drained soil, while pine peat moss is the most dominant on moist soil. Heigråmose plays a major role and is the dominant abundant species in oceanic areas. Light and gray reindeer lichen are characteristic elements in the bottom layer. The mapping unit is linked to low-calcium and drought-prone soil. The soil profile is a podsol profile, but on soil with thin soil no characteristic soil profile is developed. Can cover large areas on river and glacial deposits ("furumos").',
)
MinorTypeInfo(
    minorType=t4_9_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs under different exposure and inclination conditions, but especially on well-drained surfaces, ridges and top areas. Can cover large areas on river and glacial deposits ("furumos"). Color varies depending on the dominant wood species and wood layer density. Pine dominance in the wood layer gives olive green color, most often with brown to darker green-brown color in forest clearings. At higher elements of heather gray moss (O2-O3) or light lichens, the unit has a more greyish color. Texture often varying. Texture and color often consistent within and between regions given comparable dominance conditions in wood and bottom layers.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_9_mt,
    standardSegment_id='T4-UF.ef'
)
MinorTypeStandardSegment(
    minorType = t4_9_mt,
    standardSegment_id='T4-KA.abc'
)
MinorTypeStandardSegment(
    minorType = t4_9_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-9',
    minorType=t4_9_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-9',
    minorType=t4_9_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-9',
    minorType=t4_9_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-4',
    minorType=t4_9_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-4',
    minorType=t4_9_mt,
    mappingScale_id=20000
)