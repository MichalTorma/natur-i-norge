from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_14_mt = MinorType(
    _id = 'T4-14',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_14_mt,
    language_id='nb',
    key='<name>',
    value='Svak lav-lågurtskog',
)
MinorTypeInfo(
    minorType=t4_14_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Halvåpne eller oftest åpne skoger dominert av lyng og lav; mot fjellet ofte skog eller krattskog av vekstreduserte trær. Bunnsjiktet er ofte helt dominert av reinlaver. Furu er det dominerende treslaget i mesteparten av landet, men bjørk dominerer i fjellskogen de fleste steder.',
)
MinorTypeInfo(
    minorType=t4_14_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Feltsjiktet inneholder få, relativt nøysomme og svært uttørkingstolerante arter, først og fremst røsslyng, krekling og tyttebær. Furutorvmose forekommer på fuktmarksflekker. Kvitkrull, lys reinlav og grå reinlav er de viktigste artene i bunnsjiktet, men heigråmose kan være vanlig og/eller dominere i oseaniske strøk. T4-C-14 forekommer først og fremst på relativt kalkfattig, tørr og skrinn mark med tynt jordsmonn over berg (”hällmarkstallskog”), men finnes også på flate moreneavsetninger i kontinentale strøk. Der jordsmonnet er dypere utvikles podsolprofil. Forekomst av noen få, litt mindre nøysomme arter skiller T4-C-14 fra lavskog (T4-C-13).',
)
MinorTypeInfo(
    minorType=t4_14_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Opptrer under ulike eksposisjons- og helningsforhold, men særlig på rygger og toppområder. FF: Farge i flyfoto varierer avhengig av dominerende treslag og tresjiktstetthet, men ofte mosaikk mellom gråhvitt (lavdominans) og grønt (tre- og busksjikt). Innslag av lyng gir mørkere farge. Furudominans (olivengrønn) skilles lett fra bjørkedominans (reinere grønn). Tekstur og farge konsistent innen og mellom regioner.',
)

MinorTypeInfo(
    minorType=t4_14_mt,
    language_id='en',
    key='<name>',
    value='Intermediately lime-rich xeric forest',
)
MinorTypeInfo(
    minorType=t4_14_mt,
    language_id='en',
    key='Physiognomy',
    value='Semi-open or most often open forests dominated by heather and lichen; towards the mountain often forest or scrub forest of growth-reduced trees. The bottom layer is often completely dominated by reindeer lichen. Pine is the dominant tree species in most of the country, but birch dominates in the mountain forest in most places.',
)
MinorTypeInfo(
    minorType=t4_14_mt,
    language_id='en',
    key='Ecological characteristics',
    value='The field layer contains few, relatively frugal and very drought-tolerant species, primarily heather, cress and cranberries. Pine peat moss occurs on wetland patches. White curl, light reindeer lichen and gray reindeer lichen are the most important species in the bottom layer, but heather gray moss can be common and / or dominate in oceanic areas. T4-C-14 occurs primarily on relatively calcareous, dry and barren soils with thin soil over rocks ("hällmarkstallskog"), but is also found on flat moraine deposits in continental areas. Where the soil is deeper, podsol profile develops. Occurrence of a few, slightly less frugal species distinguishes T4-C-14 from low forest (T4-C-13).',
)
MinorTypeInfo(
    minorType=t4_14_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs under different exposure and inclination conditions, but especially on ridges and top areas. FF: Color in aerial photos varies depending on the dominant tree species and tree layer density, but often mosaic between gray-white (low dominance) and green (tree and shrub layer). Elements of heather give a darker color. Pine dominance (olive green) is easily distinguished from birch dominance (purer green). Texture and color consistent within and between regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_14_mt,
    standardSegment_id='T4-UF.gh'
)
MinorTypeStandardSegment(
    minorType = t4_14_mt,
    standardSegment_id='T4-KA.de'
)
MinorTypeStandardSegment(
    minorType = t4_14_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-14',
    minorType=t4_14_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-14',
    minorType=t4_14_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-14',
    minorType=t4_14_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-5',
    minorType=t4_14_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-5',
    minorType=t4_14_mt,
    mappingScale_id=20000
)