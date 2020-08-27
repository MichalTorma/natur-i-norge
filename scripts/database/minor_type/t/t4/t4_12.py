from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_12_mt = MinorType(
    _id = 'T4-12',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_12_mt,
    language_id='nb',
    key='<name>',
    value='Lyng-kalklågurtskog',
)
MinorTypeInfo(
    minorType=t4_12_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Engpreget, relativt åpen, frodig, urte- og grasrik skog. Oftest dominert av furu, med skogkanter mot åpen kalkmark.',
)
MinorTypeInfo(
    minorType=t4_12_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Omfatter den tørrere og mest kalkrike delen av det som tradisjonelt betegnes urterik kalkfuruskog, og innbefatter også utforminger der ”kalkeffekten” skyldes tilførsler av sigevann kombinert med periodevis uttørking og da gjerne som en mosaikk mellom en veldrenert og en fuktmarksutforming. Forekomst av sterke kalkindikatorer, bl.a. orkideer som mangler i lyng-lågurtskog, skiller T4–C-12 fra denne. Mange sterkt kalkskogtilknyttede sopper kan forekomme i naturtypen. I BN kan varmekjære lauvtrær og busker utgjøre en viktig del av tre- og busksjiktet. Jordsmonnet er oftest et tynt brunjordsprofil, som kan inneholde mye stein og grus, f.eks. kalkgrus og leirskifer.',
)
MinorTypeInfo(
    minorType=t4_12_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Opptrer under ulike eksposisjons- og helningsforhold, men særlig i konvekse lisider med gunstig eksposisjon. Farge i flyfoto varierer med dominerende treslag og tresjiktstetthet. Fargen er ofte brun til grønn-brun i åpne partier, lys grønn ved gras- eller urtedominans, mørkere grønn med busksjikt. Dominans av kalkgrus gir grånende til gråsvart farge. Tekstur ofte varierende. Tekstur og farge konsistent innen regioner.',
)

MinorTypeInfo(
    minorType=t4_12_mt,
    language_id='en',
    key='<name>',
    value='Strongly lime-rich subxeric forest',
)
MinorTypeInfo(
    minorType=t4_12_mt,
    language_id='en',
    key='Physiognomy',
    value='Meadow-like, relatively open, lush, herbaceous and grassy forest. Most often dominated by pine, with forest edges against open limestone soil.',
)
MinorTypeInfo(
    minorType=t4_12_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Includes the drier and most calcareous part of what is traditionally called herbaceous lime pine forest, and also includes designs where the "lime effect" is due to inputs of leachate combined with periodic drying and then often as a mosaic between a well-drained and a wetland design. Occurrence of strong lime indicators, i.a. orchids that are missing in heather-low-grass forest, separate T4 – C-12 from this. Many strongly limestone-associated fungi can occur in the habitat type. In BN, heat-loving deciduous trees and shrubs can form an important part of the tree and shrub layer. The soil is most often a thin brown soil profile, which can contain a lot of rock and gravel, e.g. limestone and clay shale.',
)
MinorTypeInfo(
    minorType=t4_12_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs under different exposure and inclination conditions, but especially in convex lisides with favorable exposure. Color in aerial photography varies with dominant wood species and wood layer density. The color is often brown to green-brown in open areas, light green in grass or herb dominance, darker green with shrub layers. Dominance of lime gravel gives graying to gray-black color. Texture often varying. Texture and color consistent within regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_12_mt,
    standardSegment_id='T4-UF.ef'
)
MinorTypeStandardSegment(
    minorType = t4_12_mt,
    standardSegment_id='T4-KA.hi'
)
MinorTypeStandardSegment(
    minorType = t4_12_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-12',
    minorType=t4_12_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-12',
    minorType=t4_12_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-12',
    minorType=t4_12_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-6',
    minorType=t4_12_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-6',
    minorType=t4_12_mt,
    mappingScale_id=20000
)