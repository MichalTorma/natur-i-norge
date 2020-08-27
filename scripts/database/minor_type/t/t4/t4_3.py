from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_3_mt = MinorType(
    _id = 'T4-3',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_3_mt,
    language_id='nb',
    key='<name>',
    value='Lågurtskog',
)
MinorTypeInfo(
    minorType=t4_3_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Oftest skyggefulle skoger preget av urter og gras. Skogbunnen har varierende mosedekning av delvis mer krevende arter, og god bonitet med tett tresjikt og lite lys kan ofte begrense undervegetasjonen, slik at deler av skogbunnen er rent barnålteppe eller dekket av lauvstrø. Arealmessig viktigst er granskog, med sparsomt innslag av boreale lauvtrær. I BN også representert ved edellauvskog, mens bjørkeskog dominerer store arealer i NB og landsdeler utenfor granas utbredelsesområde. Der kan også furu være dominant.',
)
MinorTypeInfo(
    minorType=t4_3_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Typen kan være relativt artsrik, og en klassisk skilleart fra fattigere typer er blåveis. Forekommer på kalkrik berggrunn, ulike eksposisjons- og helningsforhold. Jordsmonnet er kjennetegnet av et brunjordsprofil som holder en relativt stabil fuktighet.',
)
MinorTypeInfo(
    minorType=t4_3_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Forekommer i alle terrengposisjoner, men mer frekvent i flatt, jevnt hellende eller konkave terrengposisjoner enn opplendte, ofte grunnlendte partier. Dominerende treslag og tresjiktstetthet styrende for gjenkjenning i flyfoto, tekstur varierende. Mørkt grønn i granskog, lys grønn i løvskog, grønn-grå i furuskog. Lysere grønn farge i skogglenner (ikke i skygge) i flyfoto. Tekstur og farge ofte konsistent innen regioner.',
)

MinorTypeInfo(
    minorType=t4_3_mt,
    language_id='en',
    key='<name>',
    value='Moderately lime-rich submesic forest',
)
MinorTypeInfo(
    minorType=t4_3_mt,
    language_id='en',
    key='Physiognomy',
    value='Most often shady forests characterized by herbs and grasses. The forest floor has varying moss cover of partly more demanding species, and good quality with a dense layer of wood and little light can often limit the undergrowth, so that parts of the forest floor are pure baby needle blanket or covered with deciduous litter. The most important in terms of area is spruce forest, with sparse elements of boreal deciduous trees. In BN also represented by noble deciduous forest, while birch forest dominates large areas in NB and parts of the country outside the spruce distribution area. Pine can also be dominant.',
)
MinorTypeInfo(
    minorType=t4_3_mt,
    language_id='en',
    key='Ecological characteristics',
    value='The type can be relatively rich in species, and a classic distinguishing species from poorer types is blue. Occurs on calcareous bedrock, various exposure and slope conditions. The soil is characterized by a brown soil profile that maintains a relatively stable moisture.',
)
MinorTypeInfo(
    minorType=t4_3_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs in all terrain positions, but more frequently in flat, evenly sloping or concave terrain positions than uplifted, often grounded sections. Dominant wood species and wood layer density governing for recognition in aerial photography, texture varying. Dark green in spruce forest, light green in deciduous forest, green-gray in pine forest. Lighter green color in forest clearings (not in shadow) in aerial photo. Texture and color often consistent within regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_3_mt,
    standardSegment_id='T4-UF.ab'
)
MinorTypeStandardSegment(
    minorType = t4_3_mt,
    standardSegment_id='T4-KA.fg'
)
MinorTypeStandardSegment(
    minorType = t4_3_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-3',
    minorType=t4_3_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-3',
    minorType=t4_3_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-3',
    minorType=t4_3_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-3',
    minorType=t4_3_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-3',
    minorType=t4_3_mt,
    mappingScale_id=20000
)