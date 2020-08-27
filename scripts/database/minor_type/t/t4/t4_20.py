from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_20_mt = MinorType(
    _id = 'T4-20',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_20_mt,
    language_id='nb',
    key='<name>',
    value='Tørkeutsatt høgstaudeskog',
)
MinorTypeInfo(
    minorType=t4_20_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Halvåpen, furudominert skog. Karakterisert ved stort artsmangfold av urter og gras, ofte også uttørkingstolerante busker som f.eks. einer. Alternerer ofte med mer kalkfattige og/eller ikke kildevannspåvirkede naturtyper.',
)
MinorTypeInfo(
    minorType=t4_20_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Kjennetegnet ved periodevis tilførsel av oksygenrikt og kalkrikt sigevann, men sesongfuktig og utsatt for gjentatt og tidvis sterk uttørring. Artsutvalget består av typiske ”kalkfuruskogsarter”, med innslag av noen arter fra høgstaudeskogene. Forekommer på kalkrik berggrunn og i blant på mer kalkfattige bergarter som tilføres sigevann som har vært i kontakt med mer kalkrike bergarter.',
)
MinorTypeInfo(
    minorType=t4_20_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Utbredt i lisider, ofte relativt slake, særlig i sørvendte terrengposisjoner med god omsetning og redusert humusdannelse. FF: Farge varierer avhengig av dominerende treslag og tresjiktstetthet, men tresjiktet ofte olivingrønt (furudominans). Mørkt grønn ved høyt innslag av einer og lyngarter, ellers vanligvis grønn. Tekstur og farge konsistent innen og mellom regioner.',
)

MinorTypeInfo(
    minorType=t4_20_mt,
    language_id='en',
    key='<name>',
    value='Strongly lime-rich subxeric tall-herb forest',
)
MinorTypeInfo(
    minorType=t4_20_mt,
    language_id='en',
    key='Physiognomy',
    value='Semi-open, pine-dominated forest. Characterized by large species diversity of herbs and grasses, often also drought-tolerant shrubs such as. one. Alternates often with more calcareous and / or non-spring water-affected habitats.',
)
MinorTypeInfo(
    minorType=t4_20_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Characterized by periodic supply of oxygen-rich and calcareous leachate, but seasonally moist and exposed to repeated and occasionally strong drying. The species selection consists of typical "lime pine forest species", with elements of some species from the perennial forests. Occurs on calcareous bedrock and sometimes on more calcareous rocks that are supplied with leachate that has been in contact with more calcareous rocks.',
)
MinorTypeInfo(
    minorType=t4_20_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Widespread in lisides, often relatively gentle, especially in south-facing terrain positions with good turnover and reduced humus formation. FF: Color varies depending on the dominant tree species and tree layer density, but the tree layer is often olive green (pine dominance). Dark green with high levels of juniper and heather, otherwise usually green. Texture and color consistent within and between regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_20_mt,
    standardSegment_id='T4-UF.ef'
)
MinorTypeStandardSegment(
    minorType = t4_20_mt,
    standardSegment_id='T4-KA.fg'
)
MinorTypeStandardSegment(
    minorType = t4_20_mt,
    standardSegment_id='T4-KA.hi'
)
MinorTypeStandardSegment(
    minorType = t4_20_mt,
    standardSegment_id='T4-KI.bc'
)

# scaled

MinorTypeScaled(
    _id='T4-20',
    minorType=t4_20_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-20',
    minorType=t4_20_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-20',
    minorType=t4_20_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-6',
    minorType=t4_20_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-6',
    minorType=t4_20_mt,
    mappingScale_id=20000
)