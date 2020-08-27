from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_15_mt = MinorType(
    _id = 'T4-15',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_15_mt,
    language_id='nb',
    key='<name>',
    value='Lav-lågurtskog',
)
MinorTypeInfo(
    minorType=t4_15_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Åpen skog dominert av furu og med glissent feltsjikt karakterisert av lyng, urter og lav. I NB er T4-C-15 oftest en grunnlendt fjellbjørkeskog.',
)
MinorTypeInfo(
    minorType=t4_15_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Feltsjiktet har innslag av relativt kalkkrevende og tørketolerante karplanter. Kartleggingsenheten opptrer ofte i veksling med lyng-lågurtskog (T4-C-11), lyng-kalklågurtskog (T4-C-12) og/eller lav-kalklågurtskog (T4-C-16), gjerne som randsoner mot, eller i mosaikk med nakent berg (T1) og åpen grunnlendt mark (T2). Floristisk karakteriseres T4-C-15 ved forekomst av ekstremt tørketålende, middels kalkkrevende arter som også er typiske for åpen grunnlendt mark (T2), som hvitbergknapp, blåklokke, bitterbergknapp, hårsveve, smørbukk og sølvmure. Oftest lavdominert bunnsjikt, men kan også ha et sparsomt utviklet bunnsjikt med mye strø.',
)
MinorTypeInfo(
    minorType=t4_15_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Opptrer under ulike eksposisjons- og helningsforhold, men særlig på rygger og toppområder. FF: Farge i flyfoto varierer avhengig av dominerende treslag og tresjiktstetthet, men ofte mosaikk mellom gråhvitt (lavdominans) og grønt (tre- og busksjikt). Innslag av lyng gir mørkere farge. Furudominans (olivengrønn) skilles lett fra bjørkedominans (reinere grønn). Tekstur og farge konsistent innen og mellom regioner.',
)

MinorTypeInfo(
    minorType=t4_15_mt,
    language_id='en',
    key='<name>',
    value='Moderately lime-rich xeric forest',
)
MinorTypeInfo(
    minorType=t4_15_mt,
    language_id='en',
    key='Physiognomy',
    value='Open forest dominated by pine and with a glistening field layer characterized by heather, herbs and lichen. In NB, T4-C-15 is most often a shallow mountain birch forest.',
)
MinorTypeInfo(
    minorType=t4_15_mt,
    language_id='en',
    key='Ecological characteristics',
    value='The field layer has elements of relatively lime-demanding and drought-tolerant vascular plants. The mapping unit often alternates with heather-low-grass forest (T4-C-11), heather-low-limestone forest (T4-C-12) and / or low-limestone low-grass forest (T4-C-16), often as marginal zones towards, or in mosaic with bare rock (T1) and open shallow ground (T2). Floristically, T4-C-15 is characterized by the presence of extremely drought-tolerant, medium-lime-demanding species that are also typical of open shallow ground (T2), such as white mountain button, bluebell, bitterberg button, hair float, butterfly and silver wall. Most often low-dominated bottom layer, but can also have a sparsely developed bottom layer with a lot of litter.',
)
MinorTypeInfo(
    minorType=t4_15_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs under different exposure and inclination conditions, but especially on ridges and top areas. FF: Color in aerial photos varies depending on the dominant tree species and tree layer density, but often mosaic between gray-white (low dominance) and green (tree and shrub layer). Elements of heather give a darker color. Pine dominance (olive green) is easily distinguished from birch dominance (purer green). Texture and color consistent within and between regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_15_mt,
    standardSegment_id='T4-UF.gh'
)
MinorTypeStandardSegment(
    minorType = t4_15_mt,
    standardSegment_id='T4-KA.fg'
)
MinorTypeStandardSegment(
    minorType = t4_15_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-15',
    minorType=t4_15_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-15',
    minorType=t4_15_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-15',
    minorType=t4_15_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-6',
    minorType=t4_15_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-6',
    minorType=t4_15_mt,
    mappingScale_id=20000
)