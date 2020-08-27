from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_4_mt = MinorType(
    _id = 'T4-4',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_4_mt,
    language_id='nb',
    key='<name>',
    value='Kalklågurtskog',
)
MinorTypeInfo(
    minorType=t4_4_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Oftest skyggefulle skoger på mer eller mindre grunnlendt mark. Kalkgranskog dekker trolig størst areal i BN, der det finnes alle overganger til ren edellauvskog på de klimatisk gunstigste lokalitetene. Frekvent som bjørkeskog i NB og ellers i alle landsdeler utenfor granas utbredelsesområde, der forutsetningene for kalklågurtskog er til stede.',
)
MinorTypeInfo(
    minorType=t4_4_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Ofte lite og trivielt innslag av lågurter som ikke skiller seg mye fra mer ordinære lågurtskoger, men med noen få utslagsgivende plantearter. Typen kan være sterkt mosedominert (gjerne etasjemose). Best karakterisert av en rekke kravfulle kalkbarskogs-sopper. Framstikkende kalkrike bergknauser med moseflora typisk for kalkrike berg indikerer også kalklågurtskog. Forekommer på kalkrik berggrunn, ulike eksposisjons- og helningsforhold og et jordsmonn kjennetegnet av et brunjordsprofil og som holder en relativt stabil fuktighet. På kalkrik grunn med tjukt humuslag erstattes kalklågurtskogen av skogsmarkstyper med lavere realisert KA-trinn.',
)
MinorTypeInfo(
    minorType=t4_4_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Forekommer i alle terrengposisjoner, men ofte i opplendte partier. Dominerende treslag og tresjiktstetthet styrende for gjenkjenning i flyfoto, som i T4-C-3. Mørkt grønn i granskog, lys grønn i løvskog, grønn-grå i furuskog. Tekstur varierende, men ofte ujevn. Tekstur og farge ofte konsistent innen regioner.',
)

MinorTypeInfo(
    minorType=t4_4_mt,
    language_id='en',
    key='<name>',
    value='Strongly lime-rich submesic forest',
)
MinorTypeInfo(
    minorType=t4_4_mt,
    language_id='en',
    key='Physiognomy',
    value='Most often shady forests on more or less shallow ground. Lime spruce forest probably covers the largest area in BN, where there are all transitions to pure deciduous forest in the most climatically favorable localities. Frequent as birch forest in NB and elsewhere in all parts of the country outside the spruce distribution area, where the preconditions for limestone lowland forest are present.',
)
MinorTypeInfo(
    minorType=t4_4_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Often small and trivial elements of lichen herbs that do not differ much from more ordinary lichen herbs, but with a few decisive plant species. The type can be strongly dominated by moss (preferably floor moss). Best characterized by a variety of demanding limestone forest mushrooms. Protruding calcareous boulders with moss flora typical of calcareous rocks also indicate calcareous lowland forest. Occurs on calcareous bedrock, different exposure and slope conditions and a soil characterized by a brown soil profile and which retains a relatively stable moisture. On calcareous soils with a thick humus layer, the calcareous low-belt forest is replaced by forest land types with a lower realized KA stage.',
)
MinorTypeInfo(
    minorType=t4_4_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs in all terrain positions, but often in uplifted areas. Dominant wood species and wood layer density governing for recognition in aerial photos, as in T4-C-3. Dark green in spruce forest, light green in deciduous forest, green-gray in pine forest. Texture varied, but often uneven. Texture and color often consistent within regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_4_mt,
    standardSegment_id='T4-UF.ab'
)
MinorTypeStandardSegment(
    minorType = t4_4_mt,
    standardSegment_id='T4-KA.hi'
)
MinorTypeStandardSegment(
    minorType = t4_4_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-4',
    minorType=t4_4_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-4',
    minorType=t4_4_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-4',
    minorType=t4_4_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-4',
    minorType=t4_4_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-4',
    minorType=t4_4_mt,
    mappingScale_id=20000
)