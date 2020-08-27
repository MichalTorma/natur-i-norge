from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_6_mt = MinorType(
    _id = 'T4-6',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_6_mt,
    language_id='nb',
    key='<name>',
    value='Svak bærlyng-lågurtskog',
)
MinorTypeInfo(
    minorType=t4_6_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Oftest skyggefulle til halvåpne skoger med lyng- og dels mosedominans, men økende mengde lav mot mer kontinentale strøk. Innenfor granas utbredelsesområde barblandingsskog, som varierer fra grandominans med konstant innslag av furu til mer likeverdig blanding av de to. Med innslag av eik i BN. Utviklet som furu- og/eller bjørkeskog utenfor granas utbredelsesområde, som ren bjørkeskog opp mot fjellet.',
)
MinorTypeInfo(
    minorType=t4_6_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Bærlyngdominans med mer eller mindre sterkt innslag av røsslyng, og med få andre arter i feltsjiktet. Furumose og sigdmoser, stedvis også etasjemose eller reinlavarter, er karakteristiske i bunnsjiktet. Forekommer på kalkfattig berggrunn, men med noe bedre kalkrik enn bærlyngskog, T4-C-5. Dette gir seg utslag i at det sammenliknet med denne kartleggingsenheten kommer inn noen få, spredte, litt mer kalkkrevende arter. Jordsmonnet er typisk et svakt podsolprofil som vanligvis er tynnere og mer tørkeutsatt enn i svak lågurtskog på frisk mark.',
)
MinorTypeInfo(
    minorType=t4_6_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Opptrer under ulike eksposisjons- og helningsforhold, men særlig på rygger og svakt konvekse terrengformer. Skogglenner ofte med grønn til grønn-brunlig farge i fargefoto. Ellers varierer farge og tekstur med dominerende treslag og tresjiktstetthet. Mørkt grønn i granskog, lys grønn i løvskog, grønn-grå i furuskog. Ujevn tekstur. Tekstur og farge konsistent innen regioner.',
)

MinorTypeInfo(
    minorType=t4_6_mt,
    language_id='en',
    key='<name>',
    value='Intermediately lime-rich submesic to subxeric forest',
)
MinorTypeInfo(
    minorType=t4_6_mt,
    language_id='en',
    key='Physiognomy',
    value='Most often shady to semi-open forests with heather and partly moss dominance, but increasing amount of low towards more continental areas. Within the spruce distribution area, bare-mixed forest, which varies from grandominance with a constant element of pine to a more equal mixture of the two. With elements of oak in BN. Developed as a pine and / or birch forest outside the spruce distribution area, as pure birch forest up against the mountain.',
)
MinorTypeInfo(
    minorType=t4_6_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Berry heather dominance with more or less strong elements of heather, and with few other species in the field layer. Pine bogs and sickle bogs, in some places also floor bogs or reindeer lichens, are characteristic of the bottom layer. Occurs on calcareous bedrock, but with slightly better calcareous than berry heather forest, T4-C-5. This is reflected in the fact that, compared with this mapping unit, a few, scattered, slightly more lime-demanding species enter. The soil is typically a weak podsol profile which is usually thinner and more prone to drought than in weak low-grass forests on fresh soil.',
)
MinorTypeInfo(
    minorType=t4_6_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs under different exposure and inclination conditions, but especially on ridges and slightly convex terrain. Forest glades often with green to green-brownish color in color photo. Otherwise, color and texture vary with the dominant wood species and wood layer density. Dark green in spruce forest, light green in deciduous forest, green-gray in pine forest. Uneven texture. Texture and color consistent within regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_6_mt,
    standardSegment_id='T4-UF.cd'
)
MinorTypeStandardSegment(
    minorType = t4_6_mt,
    standardSegment_id='T4-KA.de'
)
MinorTypeStandardSegment(
    minorType = t4_6_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-6',
    minorType=t4_6_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-6',
    minorType=t4_6_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-6',
    minorType=t4_6_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-2',
    minorType=t4_6_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-2',
    minorType=t4_6_mt,
    mappingScale_id=20000
)