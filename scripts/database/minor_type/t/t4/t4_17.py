from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_17_mt = MinorType(
    _id = 'T4-17',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_17_mt,
    language_id='nb',
    key='<name>',
    value='Storbregneskog',
)
MinorTypeInfo(
    minorType=t4_17_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Åpne eller skyggefulle, frodige skoger med høy produksjon. Feltsjikt med store bregner og, i de tetteste utformingene, med bunn som nesten helt er dekket av et tjukt bregnestrølag. Finnes som storbregne-granskog i granas utbredelseområde og som storbregnebjørkeskog på Vestlandet, i Nord- Norge og i fjell-skogen. Storbregne-eike- eller bøkeskog dekker svært små arealer. Innslag av gråor i yngre hogstklasser, selje i N, er vanlig.',
)
MinorTypeInfo(
    minorType=t4_17_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Permanent tilførsel av oksygenrikt sigevann; vannbevegelse parallell med markoverflata (kildevannspåvirkning). Store bregner dominerer, noen ganger nesten som reinbestander av skogburkne eller fjellburkne (mest i NB) eller smørtelg (O2–O3). Arter fra blåbærskog (T4-C-1) og svak lågurtskog (T4-C-2) inngår sammen med arter som begunstiges av eller krever kildevannspåvirkning. Forekommer på kalkfattig berggrunn, i kontinentale strøk mest som smale belter i søkk, langs bekkesig etc., i oseaniske områder noen ganger arealdekkende over større områder. Jorda er oftest et podsolprofil med en lett bregnestrøhumus.',
)
MinorTypeInfo(
    minorType=t4_17_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='I forsenkninger og slake lier, særlig i skyggefulle nordhellinger; i mindre grad begrenset til tydelige forsenkninger i oseaniske områder. Farge varierer med dominerende treslag og tresjiktstetthet. Storbregnedominans gir smaragdgrønn eller oftest mørk grønn farge. Grandominans (mørkegrønn) skilles lett fra bjørkedominans (reinere grønn). Konsistent tekstur og farge.',
)

MinorTypeInfo(
    minorType=t4_17_mt,
    language_id='en',
    key='<name>',
    value='Intermediately lime-rich tall-herb forest',
)
MinorTypeInfo(
    minorType=t4_17_mt,
    language_id='en',
    key='Physiognomy',
    value='Open or shady, lush forests with high production. Field layer with large ferns and, in the densest designs, with a bottom that is almost completely covered by a thick layer of fern litter. Available as large fern spruce forest in the spruce distribution area and as large fern birch forest in western Norway, in northern Norway and in the mountain forest. Large fern-oak or beech forest covers very small areas. Elements of gray alder in younger felling classes, willow in N, are common.',
)
MinorTypeInfo(
    minorType=t4_17_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Permanent supply of oxygen-rich leachate; water movement parallel to the ground surface (spring water impact). Large ferns dominate, sometimes almost as reindeer populations of forest burkne or mountain burkne (mostly in NB) or butter algae (O2 – O3). Species from blueberry forest (T4-C-1) and weak low-grass forest (T4-C-2) are included together with species that benefit from or require spring water exposure. Occurs on calcareous bedrock, in continental areas mostly as narrow belts in depressions, along brooks, etc., in oceanic areas sometimes covering large areas. The soil is most often a podsol profile with a light fern litter humus.',
)
MinorTypeInfo(
    minorType=t4_17_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='In depressions and gentle slopes, especially in shady northern slopes; to a lesser extent limited to clear depressions in oceanic areas. Color varies with dominant wood species and wood layer density. Large fern dominance gives emerald green or most often dark green color. Grandominance (dark green) is easily distinguished from birch dominance (purer green). Consistent texture and color.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_17_mt,
    standardSegment_id='T4-UF.ab'
)
MinorTypeStandardSegment(
    minorType = t4_17_mt,
    standardSegment_id='T4-KA.de'
)
MinorTypeStandardSegment(
    minorType = t4_17_mt,
    standardSegment_id='T4-KI.bc'
)

# scaled

MinorTypeScaled(
    _id='T4-17',
    minorType=t4_17_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-17',
    minorType=t4_17_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-17',
    minorType=t4_17_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-2',
    minorType=t4_17_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-2',
    minorType=t4_17_mt,
    mappingScale_id=20000
)