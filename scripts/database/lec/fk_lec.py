# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% FK
fk_lec = LEC(
    _id='FK',
    structuringProcess_id='S',
    patternOfVariation_id='f',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=1,
    spatialScale=10,
)
fk_lec_info_en = LECInfo(
    language_id='en',
    lec=fk_lec,
    name='Categories of fresh-water with deviating chemical composition',
    description='Complex environmental factor that separates from \'normal\', circulating freshwater masses five categories of non-circulating water masses that have been found in meromictic, with systematically deviating elemental composition, e,g., high concen-trations of seasalt, iron, calcium and/or humus',
)
fk_lec_info_nb = LECInfo(
    language_id='nb',
    lec=fk_lec,
    name='Ferskvannsforekomster med avvikende kjemisk sammensetning',
    description='Det ikke-sirkulerende bunnvannet (monimolimnion) i meromiktiske innsjøer (det vil si innsjøer med et vannlag på bunnen som aldri blander seg med resten av vannet i innsjøen) kjennetegnes ofte ved svært spesielle kjemiske forhold, som gir opphav til spesiell artssammensetning. I noen grad er hver meromiktiske innsjø unik, men det er likevel mulig å foreta en viss gruppering på grunnlag av det stagnerende bunnvannets egenskaper. FK adresserer variasjonen i bunnvannmassenes egenskaper.',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='FK.0',
    lec=fk_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='normally circulating water'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='encompasses the full range of variation within circulating bodies of water; circulating bottom water with normal chemical composition'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='normalt sirkulerende vann'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='omfatter hele spekteret av variasjon innenfor sirkulerende vannmasser; sirkulerende bunnvann med normal kjemisk sammensetning'
)
# a
a_elem_segment=ElementarySegment(
    _id='FK.a',
    lec=fk_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='old seawater'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='ectogenic meromixis; bottom water containing \'fossil\' salt water (from before the water body was separated from the sea)'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='gammelt havvann'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='ektogen meromiksis; bunnvann som inneholder med \'fossilt\' saltvann (fra før vannforekomsten ble skilt fra havet)'
)
# b
b_elem_segment=ElementarySegment(
    _id='FK.b',
    lec=fk_lec,
    value='b',
    order=2,
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='saline spring water'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='crenogenic meromixis; bottom water supplied with saline spring water'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='saltholdig kildevann'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='krenogen meromiksis; bunnvann som tilføres saltholdig kildevann'
)
# c
c_elem_segment=ElementarySegment(
    _id='FK.c',
    lec=fk_lec,
    value='c',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='ferrous groundwater'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<description>',
    value='biogenic / endogenous meromixis; bottom water with reducing conditions and high concentrations of dissolved iron salts'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<class>',
    value='jernholdig bunnvann'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<description>',
    value='biogen/endogen meromiksis; bunnvann med reduserende forhold og høye konsentrasjoner av oppløste jernsalter'
)
# d
d_elem_segment=ElementarySegment(
    _id='FK.d',
    lec=fk_lec,
    value='d',
    order=4,
    relative_order=4
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<class>',
    value='bottom water with a high lime content'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<description>',
    value='biogenic / endogenous meromixis; high salt concentrations and CO2- and CH4-rich groundwater after precipitation of lime'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<class>',
    value='bunnvann med høyt kalkinnhold'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<description>',
    value='biogen/endogen meromiksis; høye saltkonsentrasjoner og CO2- og CH4-rikt bunnvann etter utfelling av kalk'
)
# e
e_elem_segment=ElementarySegment(
    _id='FK.e',
    lec=fk_lec,
    value='e',
    order=5,
    relative_order=5
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<class>',
    value='humus-rich bottom water'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<description>',
    value='biogenic / endogenous meromixis; high salt concentrations and CO2- and CH4-rich groundwater due to large supply of humus'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<class>',
    value='humusrikt bunnvann'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<description>',
    value='biogen/endogen meromiksis; høye saltkonsentrasjoner og CO2- og CH4-rikt bunnvann pga. stor tilførsel av humus'
)
