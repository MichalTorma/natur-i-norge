from model.model import MinorType, MinorTypeInfo, MinorTypeScaled, MinorTypeStandardSegment, MinorTypeStandardSegment

t4_11_mt = MinorType(
    _id = 'T4-11',
    majorType_id = 'T4'
)
MinorTypeInfo(
    minorType=t4_11_mt,
    language_id='nb',
    key='<name>',
    value='Lyng-lågurtskog',
)
MinorTypeInfo(
    minorType=t4_11_mt,
    language_id='nb',
    key='Fysiognomi',
    value='Oftest halvåpne skoger hvor lyngpreget fra mer kalkfattige skoger med tilsvarende uttørkingsutsatthet er erstattet av et frodigere preg med urter og gras. Bunnsjiktet er dominert av reinlaver i de mest kontinentale strøkene; andelen mose øker mot mer oseaniske strøk. Furu er det dominerende treslaget i mesteparten av landet. I BN, særlig på Sørlandet, kan også eik være et viktig innslag. Oftest ren bjørkeskog opp mot fjellet.',
)
MinorTypeInfo(
    minorType=t4_11_mt,
    language_id='nb',
    key='Økologisk karakteristikk',
    value='Omfatter den tørrere og minst kalkrike delen av det som tradisjonelt betegnes kalkfuruskog; dvs. middels kalkrik furuskog med innslag av tørketålende lågurter. Forekomst av sterke kalkindikatorer, gjerne orkideer, mangler i lyng-lågurtskogen. Finnes ofte på lettforvitrede bergarter som amfibolitt, larvikitt, gabbro, basalt, rombeporfyr, gjerne på varme steder. Forekomster av lågurtfuruskog utenfor kalkområdene er ofte betinget av svak sigevannspåvirkning (sesongfuktig).',
)
MinorTypeInfo(
    minorType=t4_11_mt,
    language_id='nb',
    key='Terreng- og flyfotokarakteristikk',
    value='Opptrer under ulike eksposisjons- og helningsforhold, men særlig på rygger og toppområder. Farge i flyfoto varierer avhengig av dominerende treslag og tresjiktstetthet, men ofte med lys grønn til grønn-brun farge i åpne partier. Dominans av moser og lyng gir mørkere farge. Fargen gråner med høyere innslag av lyse lav eller heigråmose. Tekstur ofte varierende. Tekstur og farge konsistent innen regioner.',
)

MinorTypeInfo(
    minorType=t4_11_mt,
    language_id='en',
    key='<name>',
    value='Moderately lime-rich subxeric forest',
)
MinorTypeInfo(
    minorType=t4_11_mt,
    language_id='en',
    key='Physiognomy',
    value='Most often semi-open forests where the heather character of more calcareous forests with similar dehydration exposure has been replaced by a more lush character with herbs and grass. The bottom layer is dominated by reindeer lichens in the most continental regions; the proportion of moss increases towards more oceanic areas. Pine is the dominant tree species in most of the country. In BN, especially in Sørlandet, oak can also be an important element. Most often pure birch forest up towards the mountain.',
)
MinorTypeInfo(
    minorType=t4_11_mt,
    language_id='en',
    key='Ecological characteristics',
    value='Includes the drier and least calcareous part of what is traditionally called calcareous pine forest; ie medium calcareous pine forest with elements of drought-tolerant low herbs. Occurrence of strong lime indicators, often orchids, is lacking in the heather-low-grass forest. Often found on slightly weathered rocks such as amphibolite, larvicite, gabbro, basalt, rhombic porphyry, often in warm places. Occurrences of low-grass pine forests outside the limestone areas are often due to weak leachate influence (seasonally moist).',
)
MinorTypeInfo(
    minorType=t4_11_mt,
    language_id='en',
    key='Terrain and aerial photo characteristics',
    value='Occurs under different exposure and inclination conditions, but especially on ridges and top areas. Color in aerial photography varies depending on the dominant tree species and wood layer density, but often with light green to green-brown color in open areas. Dominance of mosses and heather gives a darker color. The color turns gray with higher elements of light lichen or heather gray moss. Texture often varying. Texture and color consistent within regions.',
)

# standard segments

MinorTypeStandardSegment(
    minorType = t4_11_mt,
    standardSegment_id='T4-UF.ef'
)
MinorTypeStandardSegment(
    minorType = t4_11_mt,
    standardSegment_id='T4-KA.fg'
)
MinorTypeStandardSegment(
    minorType = t4_11_mt,
    standardSegment_id='T4-KI.0a'
)

# scaled

MinorTypeScaled(
    _id='T4-11',
    minorType=t4_11_mt,
    mappingScale_id=500
)
MinorTypeScaled(
    _id='T4-B-11',
    minorType=t4_11_mt,
    mappingScale_id=2500
)
MinorTypeScaled(
    _id='T4-C-11',
    minorType=t4_11_mt,
    mappingScale_id=5000
)
MinorTypeScaled(
    _id='T4-D-6',
    minorType=t4_11_mt,
    mappingScale_id=10000
)
MinorTypeScaled(
    _id='T4-E-6',
    minorType=t4_11_mt,
    mappingScale_id=20000
)