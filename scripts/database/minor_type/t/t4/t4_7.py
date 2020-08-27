from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_7_mt = MinorType(
    _id = 'T4-7',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_7_mt,
    language_id='nb',
    key='<name>',
    value='Bærlyng-lågurtskog',
)
MinorTypeInfo(
    minorType=t4_7_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Oftest skyggefulle til halvåpne skoger med urter og mosedominans: mengden lav øker mot mer kontinentale strøk. Innenfor granas utbredelsesområde barblandingsskog, som varierer fra grandominans med konstant innslag av furu til mer likeverdig blanding av de to. Med innslag av eik i BN. Utviklet som furu- og/eller bjørkeskog utenfor granas utbredelsesområde, som ren bjørkeskog opp mot fjellet.',
)
MinorTypeInfo(
    minorType=t4_7_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Omfatter den friskeste og minst kalkrike delen av det som tradisjonelt betegnes kalkfuruskog; dvs. middels kalkrik furuskog med innslag av litt tørketålende lågurter som skogfiol, legeveronika, markjordbær, knollerteknapp, teiebær, liljekonvall mv. Forekomst av sterke kalkindikatorer, typisk orkideer, mangler. Finnes ofte på lettforvitrede bergarter som amfibolitt, larvikitt, gabbro, basalt, rombeporfyr, gjerne på varme steder. Forekomster av bærlyng-lågurtfuruskog utenfor kalkområdene er ofte betinget av svak sigevannspåvirkning (sesongfuktig). Få plantearter skiller denne typen fra den mest kalkrike bærlyng-lågurtskogen. Jordsmonnet er et brunjordsprofil.',
)
MinorTypeInfo(
    minorType=t4_7_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Opptrer under ulike eksposisjons- og helningsforhold, men særlig på rygger og andre konvekse terrengformer. Farge i flyfoto varierer avhengig av dominerende treslag og tresjiktstetthet. Granskog gir mørk grønn farge som lysner med økende andel lauvtrær; grønnfargen er lysere i skogglenner. Tekstur ofte varierende. Tekstur og farge ofte konsistent innen regioner.',
)

MinorTypeInfo(
    minorType=t4_7_mt,
    language_id='en',
    key='<name>',
    value='Moderately lime-rich submesic to subxeric forest',
)
MinorTypeInfo(
    minorType=t4_7_mt,
    language_id='en',
    key='Physiognomy',
    value='Most often shady to semi-open forests with herbs and moss dominance: the amount of lichen increases towards more continental areas. Within the spruce distribution area, bare-mixed forest, which varies from grandominance with a constant element of pine to a more equal mixture of the two. With elements of oak in BN. Developed as a pine and / or birch forest outside the spruce distribution area, as pure birch forest up against the mountain.',
)
MinorTypeInfo(
    minorType=t4_7_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Includes the freshest and least calcareous part of what is traditionally called calcareous pine forest; ie medium calcareous pine forest with elements of slightly drought-tolerant low herbs such as forest violin, medicinal veronica, wild strawberry, tuber button, tea berry, lily of the valley, etc. Occurrence of strong lime indicators, typically orchids, is lacking. Often found on slightly weathered rocks such as amphibolite, larvicite, gabbro, basalt, rhombic porphyry, often in warm places. Occurrences of berry heather-low-grass pine forest outside the limestone areas are often due to weak seepage water effects (seasonally moist). Few plant species distinguish this type from the most calcareous berry heather-low-grass forest. The soil is a brown soil profile.',
)
MinorTypeInfo(
    minorType=t4_7_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs under different exposure and inclination conditions, but especially on ridges and other convex terrain forms. Color in aerial photography varies depending on the dominant tree species and tree layer density. Spruce forest gives a dark green color that brightens with increasing proportion of deciduous trees; the green color is lighter in forest clearings. Texture often varying. Texture and color often consistent within regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_7_mt,
    standardSegment_id='T4-UF.cd'
)
MinorTypeStandardSegment(
    minorType = t4_7_mt,
    standardSegment_id='T4-KA.fg'
)
MinorTypeStandardSegment(
    minorType = t4_7_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-7',
    minorType=t4_7_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-7',
    minorType=t4_7_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-7',
    minorType=t4_7_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-3',
    minorType=t4_7_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-3',
    minorType=t4_7_mt,
    mappingScale_id=20000
)