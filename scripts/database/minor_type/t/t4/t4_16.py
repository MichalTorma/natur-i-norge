from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_16_mt = MinorType(
    _id = 'T4-16',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_16_mt,
    language_id='nb',
    key='<name>',
    value='Lav-kalklågurtskog',
)
MinorTypeInfo(
    minorType=t4_16_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Åpen skog, oftest dominert av furu og med glissent feltsjikt karakterisert av urter og lav. I NB er T4-C-16 oftest en grunnlendt fjellbjørkeskog.',
)
MinorTypeInfo(
    minorType=t4_16_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Feltsjiktet har innslag av svært kalkkrevende og tørketolerante karplanter. Kartleggingsenheten opptrer ofte i veksling med lyng-lågurtskog (T4-C-11), lyng-kalklågurtskog (T4-C-12) og lav-lågurtskog (T4-C-15), gjerne som randsoner mot, eller i mosaikk med nakent berg (T1) og åpen grunnlendt mark (T2). Forekommer oftest på grunnlendt mark på kalkrike bergarter. Oftest lavdominert bunnsjikt, men kan også ha et sparsomt utviklet bunnsjikt med mye strø.',
)
MinorTypeInfo(
    minorType=t4_16_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Opptrer under ulike eksposisjons- og helningsforhold, men særlig på kalkrygger, gjerne i karstlandskap. Fargen varierer avhengig av dominerende treslag og tresjiktstetthet, men ofte mosaikk mellom gråhvitt (lavdominans) og grønt (tre og busksjikt). Innslag av lyng gir mørkere farge, i mosaikk med nakent berg ofte mer grålig farge. Furudominans (olivengrønn) skilles lett fra bjørkedominans (reinere grønn). Tekstur og farge konsistent innen regioner.',
)

MinorTypeInfo(
    minorType=t4_16_mt,
    language_id='en',
    key='<name>',
    value='Strongly lime-rich xeric forest',
)
MinorTypeInfo(
    minorType=t4_16_mt,
    language_id='en',
    key='Physiognomy',
    value='Open forest, most often dominated by pine and with a glistening field layer characterized by herbs and lichen. In NB, T4-C-16 is most often a shallow mountain birch forest.',
)
MinorTypeInfo(
    minorType=t4_16_mt,
    language_id='en',
    key='Ecological characteristics',
    value='The field layer has elements of very lime-demanding and drought-tolerant vascular plants. The mapping unit often alternates with heather-low-grass forest (T4-C-11), heather-lime-low-grass forest (T4-C-12) and low-low-grass forest (T4-C-15), often as marginal zones towards, or in mosaics with bare rock (T1) and open shallow ground (T2). Occurs most often on shallow ground on calcareous rocks. Most often low-dominated bottom layer, but can also have a sparsely developed bottom layer with a lot of litter.',
)
MinorTypeInfo(
    minorType=t4_16_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs under different exposure and slope conditions, but especially on limestone ridges, often in karst landscapes. The color varies depending on the dominant tree species and tree layer density, but often mosaic between greyish white (low dominance) and green (tree and shrub layer). Elements of heather give a darker color, in mosaic with bare rock often more greyish color. Pine dominance (olive green) is easily distinguished from birch dominance (purer green). Texture and color consistent within regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_16_mt,
    standardSegment_id='T4-UF.gh'
)
MinorTypeStandardSegment(
    minorType = t4_16_mt,
    standardSegment_id='T4-KA.hi'
)
MinorTypeStandardSegment(
    minorType = t4_16_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-16',
    minorType=t4_16_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-16',
    minorType=t4_16_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-16',
    minorType=t4_16_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-6',
    minorType=t4_16_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-6',
    minorType=t4_16_mt,
    mappingScale_id=20000
)