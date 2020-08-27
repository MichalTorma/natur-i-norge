from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_2_mt = MinorType(
    _id = 'T4-2',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_2_mt,
    language_id='nb',
    key='<name>',
    value='Svak lågurtskog',
)
MinorTypeInfo(
    minorType=t4_2_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Oftest skyggefulle skoger preget av blåbærdominans samt forekomst av småbregner og noen urter, gras og moser som ikke finner nok næring i blåbærskogen. Typisk er et sammenhengende mosedekke i bunnen, på fuktmark dominans av torvmoser. Arealmessig viktigst er granskog med sparsomt innslag av boreale lauvtrær. I BN også representert ved eikeskog og bøkeskog, mens bjørkeskog dominerer store arealer i NB og landsdeler utenfor granas utbredelsesområde. Der kan også furu være dominant.',
)
MinorTypeInfo(
    minorType=t4_2_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Feltsjiktet omfatter et begrenset antall arter med blåbær og dens følgearter fra blåbærskogen (inkludert småbregneutformingen) samt spredte forekomster av noe mer kalkkrevende arter som skogsveve og legeveronika. Forekommer på litt mer kalkrik berggrunn, ulike eksposisjons- og helningsforhold og et jordsmonn som vanligvis kjennetegnes av et podsolprofil, øverst med humuslag av moder-typen og som holder en relativt stabil fuktighet.',
)
MinorTypeInfo(
    minorType=t4_2_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Alle terrengposisjoner, men mer frekvent i flate, jevnt hellende eller konkave terrengposisjoner enn i opplendte, grunnlendte partier. Dominerende treslag og tresjiktstetthet er styrende for gjenkjenning i flyfoto, tekstur varierende. Farge mørkt grønn i granskog, lys grønn i løvskog, grønn-grå i furuskog. Tekstur og farge ofte konsistent innen regioner.',
)

MinorTypeInfo(
    minorType=t4_2_mt,
    language_id='en',
    key='<name>',
    value='Intermediately lime-rich submesic forest',
)
MinorTypeInfo(
    minorType=t4_2_mt,
    language_id='en',
    key='Physiognomy',
    value='Most often shady forests characterized by blueberry dominance as well as the presence of small ferns and some herbs, grasses and mosses that do not find enough nutrients in the blueberry forest. Typically, a continuous moss cover at the bottom, on wetlands is dominated by peat bogs. Most important in terms of area is spruce forest with a sparse element of boreal deciduous trees. In BN also represented by oak forest and beech forest, while birch forest dominates large areas in NB and parts of the country outside the spruce distribution area. Pine can also be dominant.',
)
MinorTypeInfo(
    minorType=t4_2_mt,
    language_id='en',
    key='Ecological characteristics',
    value='The field layer includes a limited number of species with blueberries and its companion species from the blueberry forest (including the small fern design) as well as scattered occurrences of somewhat more lime-demanding species such as woodcock and medical veronica. Occurs on slightly more calcareous bedrock, different exposure and slope conditions and a soil that is usually characterized by a podsol profile, at the top with mother-type humus layers and which retains a relatively stable moisture.',
)
MinorTypeInfo(
    minorType=t4_2_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='All terrain positions, but more frequently in flat, evenly sloping or concave terrain positions than in upland, shallow sections. Dominant wood species and wood layer density are governing for recognition in aerial photography, texture varying. Color dark green in spruce forest, light green in deciduous forest, green-gray in pine forest. Texture and color often consistent within regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_2_mt,
    standardSegment_id='T4-UF.ab'
)
MinorTypeStandardSegment(
    minorType = t4_2_mt,
    standardSegment_id='T4-KA.de'
)
MinorTypeStandardSegment(
    minorType = t4_2_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-2',
    minorType=t4_2_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-2',
    minorType=t4_2_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-2',
    minorType=t4_2_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-2',
    minorType=t4_2_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-2',
    minorType=t4_2_mt,
    mappingScale_id=20000
)