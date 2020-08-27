from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_18_mt = MinorType(
    _id = 'T4-18',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_18_mt,
    language_id='nb',
    key='<name>',
    value='Høgstaudeskog',
)
MinorTypeInfo(
    minorType=t4_18_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Åpne eller skyggefulle, svært frodige og høyproduktive skoger. Feltsjikt med opptil mannshøye urter, gras og bregner. Finnes som høgstaudegranskog i granskogsregionen og ellers som høgstaudebjørkeskog på Vestlandet, i Nord-Norge og i fjellskogen. T4- C-18 omfatter også kalkrike, fuktige edellauvskoger dominert av ask, alm eller gråor i BN og SB. Yngre suksesjonsstadier i SB og MB kan ha rikelig med gråor. Betydelig innslag av selje i No og Tr.',
)
MinorTypeInfo(
    minorType=t4_18_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Kjennetegnet ved permanent tilførsel av oksygen- og kalkrikt sigevann og vannbevegelse parallelt med markoverflata (kildevannspåvirkning). Artsutvalget, inkludert dominansforholdene, varierer mye uten at det er mulig å påvise økologiske forskjeller, men den regionale variasjonen er stor. I kontinentale strøk mest som smale belter i søkk, langs bekkesig etc., i oseaniske områder noen ganger arealdekkende over større flater, typisk i lisider. Forekommer på kalkrik berggrunn og har brunjordsprofil. ',
)
MinorTypeInfo(
    minorType=t4_18_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Utbredt i forsenkninger eller slake partier, særlig i skyggefulle nordhellinger; jo mer oseanisk klima, desto mindre grad begrenset til tydelige forsenkninger. Farge varierer avhengig av dominerende treslag og tresjiktstetthet, men er ofte smaragdgrønn eller oftest mørkt grønn ved høyt innslag av høgstauder i feltsjiktet. Grandominans (mørkegrønn) skilles lett fra bjørkedominans (reinere grønn). Tekstur og farge konsistent innen og mellom regioner.',
)

MinorTypeInfo(
    minorType=t4_18_mt,
    language_id='en',
    key='<name>',
    value='Strongly lime-rich tall-herb forest',
)
MinorTypeInfo(
    minorType=t4_18_mt,
    language_id='en',
    key='Physiognomy',
    value='Open or shady, very lush and highly productive forests. Field layer with up to man-high herbs, grass and ferns. Available as high-perennial spruce forest in the spruce forest region and otherwise as high-perennial birch forest in western Norway, northern Norway and in the mountain forest. T4- C-18 also includes calcareous, moist noble deciduous forests dominated by ash, elm or gray alder in BN and SB. Younger stages of succession in SB and MB may have plenty of gray alder. Significant element of willow in No and Tr.',
)
MinorTypeInfo(
    minorType=t4_18_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Characterized by permanent supply of oxygen- and calcareous leachate and water movement parallel to the ground surface (spring water impact). The species selection, including the dominance conditions, varies a lot without it being possible to detect ecological differences, but the regional variation is large. In continental areas mostly as narrow belts in depressions, along brooks, etc., in oceanic areas sometimes covering large areas, typically in slopes. Occurs on calcareous bedrock and has a brown soil profile.',
)
MinorTypeInfo(
    minorType=t4_18_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Widespread in depressions or gentle sections, especially in shady northern slopes; the more oceanic the climate, the less limited to clear depressions. Color varies depending on the dominant tree species and tree layer density, but is often emerald green or most often dark green with a high proportion of perennials in the field layer. Grandominance (dark green) is easily distinguished from birch dominance (purer green). Texture and color consistent within and between regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_18_mt,
    standardSegment_id='T4-UF.ab'
)
MinorTypeStandardSegment(
    minorType = t4_18_mt,
    standardSegment_id='T4-KA.fg'
)
MinorTypeStandardSegment(
    minorType = t4_18_mt,
    standardSegment_id='T4-KA.hi'
)
MinorTypeStandardSegment(
    minorType = t4_18_mt,
    standardSegment_id='T4-KI.bc'
)

# scaled

MinorTypeScaled(
    _id='T4-18',
    minorType=t4_18_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-18',
    minorType=t4_18_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-18',
    minorType=t4_18_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-18',
    minorType=t4_18_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-18',
    minorType=t4_18_mt,
    mappingScale_id=20000
)