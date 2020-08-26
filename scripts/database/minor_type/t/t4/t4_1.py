from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_1_mt = MinorType(
    _id = 'T4-1',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_1_mt,
    language_id='nb',
    key='<name>',
    value='Blåbærskog',
)
MinorTypeInfo(
    minorType=t4_1_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Oftest skyggefulle skoger sterkt preget av blåbærdominans og på litt mer næringsrik grunn samt i mer oseaniske og fjellnære strøk også småbregner. Typisk er et sammenhengende mosedekke i bunnen, på fuktmark helt dominert av torvmoser. Arealmessig viktigst er granskog med sparsomt innslag av boreale lauvtrær. I BN også representert med eikeskog og bøkeskog, mens bjørkeskog dominerer store arealer i NB og landsdeler utenfor granas utbredelsesområde. Der kan også furu være dominant.',
)
MinorTypeInfo(
    minorType=t4_1_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Feltsjiktet omfatter et begrenset antall arter med dominans av blåbær, og med tyttebær, smyle og noen få andre nøysomme arter. Forekommer på kalkfattig berggrunn, ulike eksposisjons- og helningsforhold og et jordsmonn som kjennetegnes av et velutviklet podsolprofil med råhumuslag øverst og som holder en relativt stabil fuktighet.',
)
MinorTypeInfo(
    minorType=t4_1_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Alle terrengposisjoner, men mer frekvent i flate, jevnt hellende eller konkave terrengposisjoner enn i opplendte, mer grunnlendte partier. FF: Dominerende treslag og tresjiktstetthet er styrende for gjenkjenning i flyfoto, tekstur varierende. Farge mørkt grønn i granskog, lys grønn i løvskog, grønn-grå i furuskog. Tekstur og farge ofte konsistent innen regioner.',
)

MinorTypeInfo(
    minorType=t4_1_mt,
    language_id='en',
    key='<name>',
    value='Blueberry forest',
)
MinorTypeInfo(
    minorType=t4_1_mt,
    language_id='en',
    key='Physiognomy',
    value='Most often shady forests strongly characterized by blueberry dominance and on slightly more nutrient-rich soil as well as in more oceanic and mountainous areas also small ferns. Typically, a continuous moss cover is at the bottom, on wetlands completely dominated by peat bogs. Most important in terms of area is spruce forest with a sparse element of boreal deciduous trees. In BN also represented with oak forest and beech forest, while birch forest dominates large areas in NB and parts of the country outside the spruce distribution area. Pine can also be dominant.',
)
MinorTypeInfo(
    minorType=t4_1_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Field layer includes a limited number of species dominated by blueberries, and cranberries, wavy hair grass and a few other frugal species. Occurs on calcareous bedrock, various exposure and slope conditions and a soil that is characterized by a well-developed podsol profile with a layer of raw humus at the top and which maintains a relatively stable moisture.',
)
MinorTypeInfo(
    minorType=t4_1_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='All terrain positions, but more frequently in flat, evenly sloping or concave terrain positions than in upland, more shallow sections. FF: Dominant wood species and wood layer density are governing for recognition in aerial photography, texture varies. Color dark green in spruce forest, light green in deciduous forest, green-gray in pine forest. Texture and color often consistent within regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_1_mt,
    standardSegment_id='T4-UF.ab'
)
MinorTypeStandardSegment(
    minorType = t4_1_mt,
    standardSegment_id='T4-KA.abc'
)
MinorTypeStandardSegment(
    minorType = t4_1_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-1',
    minorType=t4_1_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-1',
    minorType=t4_1_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-1',
    minorType=t4_1_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-1',
    minorType=t4_1_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-1',
    minorType=t4_1_mt,
    mappingScale_id=20000
)