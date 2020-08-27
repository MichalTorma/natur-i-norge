from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_19_mt = MinorType(
    _id = 'T4-19',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_19_mt,
    language_id='nb',
    key='<name>',
    value='Litt tørkeutsatt høgstaudeskog',
)
MinorTypeInfo(
    minorType=t4_19_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Oftest relativt tett til halvåpen skog dominert av gran med innblanding av furu, men annen treslagssammensetning (f.eks. dominans av edellauvtrær) forekommer også. Feltsjiktet mer glissent og mindre produktivt enn i høgstaudeskogen (T4-C-18). Karakterisert ved stort artsmangfold av urter og gras.',
)
MinorTypeInfo(
    minorType=t4_19_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Kjennetegnet ved periodevis tilførsel av oksygen- og kalkrikt sigevann (sesongfuktig), men også periodevis utsatt for uttørking. Artsutvalget er en blanding av typiske ”kalkfuruskogsarter” og arter med tyngdepunkt i høgstaudeskoger. Forekommer på kalkrik berggrunn og på mer kalkfattige bergarter som tilføres sigevann fra mer kalkrike bergarter – da i tydelig kontrast til omkringliggende kalkskogsmark på konvekse terrengformer uten tydelig påvirkning fra kalkrikt sigevann. ',
)
MinorTypeInfo(
    minorType=t4_19_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Utbredt i forsenkninger og relativt slake partier, særlig i sørvendte terrengposisjoner med god omsetning og redusert humusdannelse. FF: Varierer avhengig av dominerende treslag og tresjiktstetthet, men ofte lyst grønn ved høyt innslag av gras og urter i feltsjiktet. Grandominans (mørkegrønn) skilles lett fra furudominans (olivengrønn). Tekstur og farge konsistent innen og mellom regioner.',
)

MinorTypeInfo(
    minorType=t4_19_mt,
    language_id='en',
    key='<name>',
    value='Strongly lime-rich submesic tall-herb forest',
)
MinorTypeInfo(
    minorType=t4_19_mt,
    language_id='en',
    key='Physiognomy',
    value='Most often relatively dense to semi-open forest dominated by spruce with admixture of pine, but other tree species composition (eg dominance of noble deciduous trees) also occurs. The field layer is more glistening and less productive than in the high perennial forest (T4-C-18). Characterized by a large species diversity of herbs and grasses.',
)
MinorTypeInfo(
    minorType=t4_19_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Characterized by periodic supply of oxygen- and calcareous leachate (seasonally moist), but also periodically exposed to dehydration. The species selection is a mixture of typical "lime pine forest species" and species with a center of gravity in perennial forests. Occurs on calcareous bedrock and on more calcareous rocks that are supplied with leachate from more calcareous rocks - then in clear contrast to the surrounding calcareous forest land on convex terrain without clear influence from calcareous calcareous water.',
)
MinorTypeInfo(
    minorType=t4_19_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Widespread in depressions and relatively gentle sections, especially in south-facing terrain positions with good turnover and reduced humus formation. FF: Varies depending on the dominant tree species and tree layer density, but often light green with a high proportion of grass and herbs in the field layer. Grandominance (dark green) is easily distinguished from pine dominance (olive green). Texture and color consistent within and between regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_19_mt,
    standardSegment_id='T4-UF.cd'
)
MinorTypeStandardSegment(
    minorType = t4_19_mt,
    standardSegment_id='T4-KA.fg'
)
MinorTypeStandardSegment(
    minorType = t4_19_mt,
    standardSegment_id='T4-KA.hi'
)
M
MinorTypeStandardSegment(
    minorType = t4_19_mt,
    standardSegment_id='T4-KI.bc'
)

# scaled

MinorTypeScaled(
    _id='T4-19',
    minorType=t4_19_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-19',
    minorType=t4_19_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-19',
    minorType=t4_19_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-3',
    minorType=t4_19_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-3',
    minorType=t4_19_mt,
    mappingScale_id=20000
)