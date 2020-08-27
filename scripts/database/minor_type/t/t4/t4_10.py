from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_10_mt = MinorType(
    _id = 'T4-10',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_10_mt,
    language_id='nb',
    key='<name>',
    value='Svak lyng-lågurtskog',
)
MinorTypeInfo(
    minorType=t4_10_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Oftest halvåpne skoger hvor røsslyng vanligvis spiller en svært viktig rolle. Bunnsjiktet er dominert av reinlaver i de mest kontinentale strøkene, andelen mose øker mot mer oseaniske strøk. Furu er dominerende treslag i mesteparten av landet. I BN, særlig på Sørlandet, kan eik være et viktig innslag. Oftest ren bjørkeskog opp mot fjellet. Små og saktevoksende granindivider kan finnes i denne kartleggingsenheten.',
)
MinorTypeInfo(
    minorType=t4_10_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Artsfattig feltsjikt, typisk dominert av tørketolerante arter, i tillegg til røsslyng også bærlyng-arter. Furumose er viktigste moseart og dominerer ofte på veldrenert mark, mens furutorvmose er viktigste dominant på fuktmark. Heigråmose spiller stor rolle og er dominerende mengdeart i oseaniske strøk. Lys og grå reinlav er karakteristiske innslag i bunnsjiktet. Kartleggingsenheten er knyttet til relativt kalkfattig og tørkeutsatt grunn, men kalkinnholdet er høyere enn i lyngskog. Dette gir seg utslag i at det sammenliknet med denne kartleggingsenheten kommer inn noen få, spredte, litt mer kalkkrevende arter. Jordsmonnet er et podsolprofil, men dette er ikke velutviklet på svæt tynt jordsmonn.',
)
MinorTypeInfo(
    minorType=t4_10_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Opptrer under ulike eksposisjons- og helningsforhold, men særlig veldrenerte flater, rygger og toppområder. Kan dekke størresammenhengende områder på breelv- og elveavsetninger. Fargen varierer avhengig av dominerende treslag og tresjiktstetthet, men oftest med grønn-brun farge i skogglenner. Fargen gråner med høyere innslag av lyse lav eller heigråmose. Tekstur ofte varierende. Tekstur og farge ofte konsistent innen regioner.',
)

MinorTypeInfo(
    minorType=t4_10_mt,
    language_id='en',
    key='<name>',
    value='Intermediately lime-rich subxeric forest',
)
MinorTypeInfo(
    minorType=t4_10_mt,
    language_id='en',
    key='Physiognomy',
    value='Most often semi-open forests where heather usually plays a very important role. The bottom layer is dominated by reindeer lichens in the most continental areas, the proportion of moss increases towards more oceanic areas. Pine is the dominant tree species in most of the country. In BN, especially in Sørlandet, oak can be an important element. Most often pure birch forest up towards the mountain. Small and slow-growing spruce individuals can be found in this mapping unit.',
)
MinorTypeInfo(
    minorType=t4_10_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Species-poor field layer, typically dominated by drought-tolerant species, in addition to heather also berry heather species. Pine moss is the most important moss species and often dominates on well-drained soil, while pine peat moss is most dominant on moist soil. Heigråmose plays a major role and is the dominant abundant species in oceanic areas. Light and gray reindeer lichen are characteristic elements in the bottom layer. The mapping unit is associated with relatively low-calcium and drought-prone soil, but the lime content is higher than in heather forest. This is reflected in the fact that, compared with this mapping unit, a few, scattered, slightly more lime-demanding species enter. The soil is a podsol profile, but this is not well developed on sweaty thin soil.',
)
MinorTypeInfo(
    minorType=t4_10_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs under different exposure and slope conditions, but especially well-drained surfaces, ridges and top areas. Can cover large contiguous areas on glacier and river deposits. The color varies depending on the dominant tree species and wood layer density, but most often with green-brown color in forest clearings. The color turns gray with higher elements of light lichen or heather gray moss. Texture often varying. Texture and color often consistent within regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_10_mt,
    standardSegment_id='T4-UF.ef'
)
MinorTypeStandardSegment(
    minorType = t4_10_mt,
    standardSegment_id='T4-KA.de'
)
MinorTypeStandardSegment(
    minorType = t4_10_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-10',
    minorType=t4_10_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-10',
    minorType=t4_10_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-10',
    minorType=t4_10_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-5',
    minorType=t4_10_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-5',
    minorType=t4_10_mt,
    mappingScale_id=20000
)