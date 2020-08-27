from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_5_mt = MinorType(
    _id = 'T4-5',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_5_mt,
    language_id='nb',
    key='<name>',
    value='Bærlyngskog',
)
MinorTypeInfo(
    minorType=t4_5_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Oftest skyggefulle til halvåpne skoger med lyng- og dels mosedominans, men med økende mengde lav mot mer kontinentale strøk. Innenfor granas utbredelsesområde barblandingsskog, som varierer fra grandominans med konstant innslag av furu til mer likeverdig blanding av de to. Med innslag eller dominans av eik i BN på Sørlandet. Utviklet som furu- og/eller bjørkeskog utenfor granas utbredelsesområde, som ren bjørkeskog opp mot fjellet.',
)
MinorTypeInfo(
    minorType=t4_5_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Bærlyngdominans med mer eller mindre sterkt innslag av røsslyng, og med få andre arter i feltsjiktet. Furumose og sigdmoser, stedvis også etasjemose eller reinlavarter, er karakteristiske i bunnsjiktet. Gran-, lyng- og tvaretorvmose dominerer på fuktmark. Forekommer på kalkfattig berggrunn. Jordsmonnet danner et podsolprofil og er som regel tynnere og mer tørkeutsatt enn i blåbærskogen.',
)
MinorTypeInfo(
    minorType=t4_5_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Opptrer under ulike eksposisjons- og helningsforhold, men særlig på rygger og svakt konvekse terrengformer. Kan dekke store arealer på elve- og breelvavsetninger (furumoer). Dominerende treslag og tresjiktstetthet er styrende for gjenkjenning i flyfoto, tekstur varierende. Mørkt grønn i granskog, lys grønn i løvskog, grønn-grå i furuskog; i flyfoto framtrer åpne partier oftest som grønne til grønnbrune. Tekstur og farge konsistent innen og mellom regioner.',
)

MinorTypeInfo(
    minorType=t4_5_mt,
    language_id='en',
    key='<name>',
    value='Lime-poor submesic to subxeric forest',
)
MinorTypeInfo(
    minorType=t4_5_mt,
    language_id='en',
    key='Physiognomy',
    value='Most often shady to semi-open forests with heather and partly moss dominance, but with increasing amounts of lichen towards more continental areas. Within the spruce distribution area, bare-mixed forest, which varies from grandominance with a constant element of pine to a more equal mixture of the two. With elements or dominance of oak in BN in Sørlandet. Developed as a pine and / or birch forest outside the spruce distribution area, as pure birch forest up against the mountain.',
)
MinorTypeInfo(
    minorType=t4_5_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Berry heather dominance with more or less strong elements of heather, and with few other species in the field layer. Pine bogs and sickle bogs, in some places also floor bogs or reindeer lichens, are characteristic of the bottom layer. Spruce, heather and peat bog dominate on wetlands. Occurs on calcareous bedrock. The soil forms a podsol profile and is usually thinner and more prone to drought than in the blueberry forest.',
)
MinorTypeInfo(
    minorType=t4_5_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs under different exposure and inclination conditions, but especially on ridges and slightly convex terrain. Can cover large areas on river and glacial deposits (pine forests). Dominant wood species and wood layer density are governing for recognition in aerial photography, texture varying. Dark green in spruce forest, light green in deciduous forest, green-gray in pine forest; in aerial photography, open areas most often appear as green to green-brown. Texture and color consistent within and between regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_5_mt,
    standardSegment_id='T4-UF.cd'
)
MinorTypeStandardSegment(
    minorType = t4_5_mt,
    standardSegment_id='T4-KA.abc'
)
MinorTypeStandardSegment(
    minorType = t4_5_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-5',
    minorType=t4_5_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-5',
    minorType=t4_5_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-5',
    minorType=t4_5_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-1',
    minorType=t4_5_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-1',
    minorType=t4_5_mt,
    mappingScale_id=20000
)