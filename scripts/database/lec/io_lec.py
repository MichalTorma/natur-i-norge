# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% IO
io_lec = LEC(
    _id='IO',
    structuringProcess_id='D',
    patternOfVariation_id='mf', #TODO supposed to be 'mf'
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=3,
)
io_lec_info_en = LECInfo(
    language_id='en',
    lec=io_lec,
    name='Organic matter content',
    description='Variation in the substrate’s content of organic matter ranging from predominantly inorganic (<10% organic matter) to predominantly organic substrates (<10% inorganic matter)',
)
io_lec_info_nb = LECInfo(
    language_id='nb',
    lec=io_lec,
    name='Innhold av organisk materiale',
    description='Akkumulering av organisk materiale finner sted i fastmarkssystemer, i våtmarkssystemer, i ferskvannssystemer og i saltvannssystemer. Det organiske materialet kan være produsert på stedet (autoktont, stedegent), det kan være tilført (alloktont; se NiN[1] Artikkel 12, kapittel A) eller det kan dels være stedegent, dels tilført. Akkumulering av stedegent organisk materiale er resultatet av at det over lengre tid (gjerne tusener av år) produseres mer organisk materiale enn det som brytes ned (dvs. at produksjonshastigheten er større enn nedbrytnings¬hastigheten, slik som f.eks. i torvmarker). Torv er stedegent akkumulert materiale, avsatt i fuktig/vannmettet miljø, hvis tørrvekt utgjøres av mer enn 30 % dødt organisk materiale. Tilført organisk materiale akkumuleres når tilførselen over lengre tid er større enn summen av bortførselen og nedbrytningen på stedet. Dy er akkumulert organisk materiale bestående av ukonsoliderte (løse) innsjøsedimenter som først og fremst inneholder utfelte humuspartikler og torvmosesrester, for det meste produsert alloktont. Gytje er innsjøsedimenter som hovedsakelig består av rester av planter og dyr som har levd i innsjøen, det vil si som er produsert autoktont. Mengden av organisk materiale har betydning for artssammensetning og økosystemfunksjon både i landsystemer og i vannsystemer. I landsystemer (fastmarks- og våtmarkssystemer) skiller torvmarker (IO∙b¤) seg fra mark dominert av uorganisk materiale med hensyn til mange viktige økosystemegenskaper [dynamikk, evne til vannlagring, artssammensetning dominert av moser, ofte torvmoser (Sphagnum spp.)]. I vannsystemer har sedimentenes innhold av organisk materiale betydning bl.a. fordi det organiske materialet fungerer som mat for detritusspisere og fordi det påvirker sedimentenes erosjonsutsatthet og dermed dets egnethet for organismer med ulike mekanismer for å holde seg fast i substratet.',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='IO.0',
    lec=io_lec,
    value='0',
    order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='predominantly inorganic soil / ground'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='soil / ground which consists almost exclusively of inorganic material; bedrock and sediments'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='dead weight (g/cm3)',
    value='> 2.0'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='% organic matter',
    value='< 10'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='overveiende uorganisk mark/bunn'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='mark/bunn som nesten utelukkende består av uorganisk materiale; berggrunn og sedimenter'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='egenvekt (g/cm3)',
    value='> 2,0'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='% organisk materiale',
    value='< 10'
)
# a
a_elem_segment=ElementarySegment(
    _id='IO.a',
    lec=io_lec,
    value='a',
    order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='soil / ground with some organic material'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='soil / bottom with some admixture of organic material'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='dead weight (g/cm3)',
    value='1.2 - 2.0'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='% organic matter',
    value='10 - 30'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='mark/bunn med litt organisk materiale'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='mark/bunn med en viss innblanding av organisk materiale'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='egenvekt (g/cm3)',
    value='1,2 - 2,0'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='% organisk materiale',
    value='10 - 30'
)
# b
b_elem_segment=ElementarySegment(
    _id='IO.b',
    lec=io_lec,
    value='b',
    order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='soil / ground with a lot of organic material'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='soil / ground with a high content of organic material'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='dead weight (g/cm3)',
    value='< 1.2'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='% organic matter',
    value='30 - 90'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='mark/bunn med mye organisk materiale'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='mark/bunn med høyt innhold av organisk materiale'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='egenvekt (g/cm3)',
    value='< 1,2'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='% organisk materiale',
    value='30 - 90'
)
# all
all_elem_segment=ElementarySegment(
    _id='IO.¤',
    lec=io_lec,
    value='¤',
    order=3
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<class>',
    value='predominantly organic soil / ground'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<description>',
    value='soil / ground that contains almost exclusively organic material'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='dead weight (g/cm3)',
    value='-'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='% organic matter',
    value='> 90'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<class>',
    value='overveiende organisk mark/bunn'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<description>',
    value='mark/bunn som nesten utelukkende inneholder organisk materiale'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='egenvekt (g/cm3)',
    value='-'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='% organisk materiale',
    value='> 90'
)
