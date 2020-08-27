from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_8_mt = MinorType(
    _id = 'T4-8',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_8_mt,
    language_id='nb',
    key='<name>',
    value='Bærlyng-kalklågurtskog',
)
MinorTypeInfo(
    minorType=t4_8_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Engpreget, frodig, urte- og grasrik skog, oftest en ganske åpen furuskog med skogkant mot åpen kalkmark og bergvegger.',
)
MinorTypeInfo(
    minorType=t4_8_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Omfatter den friskeste og mest kalkrike delen av det som tradisjonelt betegnes urterik kalkfuruskog; med innslag av litt tørketålende lågurter som skogfiol, legeveronika, markjordbær, knollerteknapp, teiebær, liljekonvall mv. Også utforminger der ”kalkeffekten” skyldes tilførsler av sigevann kombinert med periodevis uttørking og da gjerne som en mosaikk mellom en veldrenert utforming og en fuktmarksutforming. Forekomst av sterke kalkindikatorer, bl.a. orkideer, som mangler i bærlyng-lågurtskog, skiller T4–C-8 fra denne. I BN kan varmekjære lauvtrær og busker utgjøre en viktig del av tre- og busksjiktet og noen ganger være dominerende (f.eks. tørkeutsatt kalklindeskog). Jordsmonnet er et typisk brunjordsprofil, men er som regel tynnere enn i kalklågurtskog på frisk mark. Skilles også fra kalkfattigere typer ved forekomst av flere kalkkrevende sopparter.',
)
MinorTypeInfo(
    minorType=t4_8_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Opptrer under ulike eksposisjons- og helningsforhold, men særlig på rygger og andre konvekse terrengformer. Farge i flyfoto varierer med dominerende treslag og tresjiktstetthet. Granskog gir mørk grønn farge som lysner med økende andel lauvtrær; grønnfargen er lysere i skogglenner. Tekstur ofte varierende. Tekstur og farge ofte konsistent innen regioner.',
)

MinorTypeInfo(
    minorType=t4_8_mt,
    language_id='en',
    key='<name>',
    value='Strongly lime-rich submesic to subxeric forest',
)
MinorTypeInfo(
    minorType=t4_8_mt,
    language_id='en',
    key='Physiognomy',
    value='Meadow-like, lush, herbaceous and grassy forest, most often a fairly open pine forest with forest edge against open limestone land and rock walls.',
)
MinorTypeInfo(
    minorType=t4_8_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Includes the freshest and most calcareous part of what is traditionally called herbaceous calcareous pine forest; with hints of slightly drought-tolerant low herbs such as forest violet, medicinal veronica, wild strawberries, tuber buds, tea berries, lily of the valley, etc. Also designs where the "lime effect" is due to inputs of leachate combined with periodic drying and then often as a mosaic between a well-drained design and a wetland design. Occurrence of strong lime indicators, i.a. orchids, which are lacking in berry heather-low-grass forest, separate T4 – C-8 from this. In BN, heat-loving deciduous trees and shrubs can form an important part of the tree and shrub layer and are sometimes dominant (eg drought-exposed limestone forest). The soil is a typical brown soil profile, but is usually thinner than in calcareous lowland forest on fresh soil. Also distinguished from poorer types of lime in the presence of several limestone-demanding fungal species.',
)
MinorTypeInfo(
    minorType=t4_8_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs under different exposure and inclination conditions, but especially on ridges and other convex terrain forms. Color in aerial photography varies with dominant wood species and wood layer density. Spruce forest gives a dark green color that brightens with increasing proportion of deciduous trees; the green color is lighter in forest clearings. Texture often varying. Texture and color often consistent within regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_8_mt,
    standardSegment_id='T4-UF.cd'
)
MinorTypeStandardSegment(
    minorType = t4_8_mt,
    standardSegment_id='T4-KA.hi'
)
MinorTypeStandardSegment(
    minorType = t4_8_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-8',
    minorType=t4_8_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-8',
    minorType=t4_8_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-8',
    minorType=t4_8_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-3',
    minorType=t4_8_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-3',
    minorType=t4_8_mt,
    mappingScale_id=20000
)