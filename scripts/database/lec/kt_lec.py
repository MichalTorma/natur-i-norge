# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% KT
kt_lec = LEC(
    _id='KT',
    structuringProcess_id='S',
    patternOfVariation_id='f',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=7,
)
kt_lec_info_en = LECInfo(
    language_id='en',
    lec=kt_lec,
    name='Spring category',
    description='Complex environmental factor by which springs are sorted by ecological context into six categories: peaty spring, spring without peat formation; spring in river or lake, cold marine water and gas spring, cold marine mud spring, and marine magma spring',
)
kt_lec_info_nb = LECInfo(
    language_id='nb',
    lec=kt_lec,
    name='Kildetype',
    description='Konsentrerte framspring av grunnvann, kilder, forekommer i mange ulike økologiske sammenhenger (deres økologiske kontekst eller ‘setting’). Kildenes økologisk sammenheng er gitt av det eller de natursystemene som dominerer omkring kildeframspringet. Her videreføres begrepet ‘kildetype’ om kildenes økologiske sammenheng jf. J. Økland & K. Økland 1996: 258–259). Inndelingen i kildetyper tar utgangspunkt i tredelingen hos J. Økland & K. Økland (1996), men modifiserer og utvider denne, og kobler den tydeligere til den økologiske sammenhengen kilden forekommer i, gitt av det omkringliggende natursystemet. Kildetype (KT) inkluderer også differensiering mellom ulike kategorier av havbunnskilder på basis av utstrømmingsmaterialets egenskaper; hva som strømmer ut er også et uttrykk for de geologiske prosessene som forårsaker utstrømming. ',
)

# a
a_elem_segment=ElementarySegment(
    _id='KT.a',
    lec=kt_lec,
    value='a',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='basic source'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='concentrated water projection (emergence) surrounded by solid ground (= power source, rheokren)'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='grunnkilde'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='konsentrert vannframspring (oppkomme) omgitt av fastmark (= strømkilde, rheokren)'
)
# b
b_elem_segment=ElementarySegment(
    _id='KT.b',
    lec=kt_lec,
    value='b',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='peatland source'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='concentrated or diffuse spring water projection surrounded by peatland (= deep spring, swamp spring, helocene)'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='torvmarkskilde'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='konsentrert eller diffust kildevannsframspring omgitt av torvmark (= djupkilde, sumpkilde, helokren)'
)
# c
c_elem_segment=ElementarySegment(
    _id='KT.c',
    lec=kt_lec,
    value='c',
    order=2,
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='fresh water source'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<description>',
    value='concentrated groundwater projection below the surface in stagnant or flowing water bodies (often visible as sand or gravel moves) (dam, river and lake source, limnokren)'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<class>',
    value='ferskvannskilde '
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<description>',
    value='konsentrert grunnvannsframspring under overflata i stillestående eller rennende vannforekomst (ofte synlig ved at sand eller grus beveger seg) (dam, elve- og innsjøkilde, limnokren)'
)
# d
d_elem_segment=ElementarySegment(
    _id='KT.d',
    lec=kt_lec,
    value='d',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<class>',
    value='water- and gas-bearing cold sea source'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<description>',
    value='outflow of water and / or gas (CH4, H2S, H2, CO2) on saline bottoms, with an intensity that is not sufficient to carry large amounts of sediment material'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<class>',
    value='vann- og gassførende kald havkilde'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<description>',
    value='utstrømming av vann og/eller gass (CH4, H2S, H2, CO2) på saltvannsbunn, med en intensitet som ikke er tilstrekkelig til å føre med seg større mengder sedimentmateriale'
)
# e
e_elem_segment=ElementarySegment(
    _id='KT.e',
    lec=kt_lec,
    value='e',
    order=4,
    relative_order=4
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<class>',
    value='mud-bearing cold sea source'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<description>',
    value='concentrated outflow of water, gas (mostly CH4) and gas-filled clay which causes strong sedimentation of the area around the outflow point'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<class>',
    value='mudderførende kald havkilde'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<description>',
    value='konsentrert utstrømming av vann, gass (mest CH4) og gassfylt leire som medfører sterk sedimentasjon av området omkring utstrømmingspunktet'
)
# f
f_elem_segment=ElementarySegment(
    _id='KT.f',
    lec=kt_lec,
    value='f',
    order=5,
    relative_order=5
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='en',
    key='<class>',
    value='magmatic sea source'
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='en',
    key='<description>',
    value='concentrated outflow of gas, water and / or magma (liquid rock) from the earth\'s interior, leading to the formation of a new seabed'
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='nb',
    key='<class>',
    value='magmaførende havkilde'
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='nb',
    key='<description>',
    value='konsentrert utstrømming av gass, vann og/eller magma (flytende stein) fra jordas indre, som fører til dannelse av ny havbunn'
)
