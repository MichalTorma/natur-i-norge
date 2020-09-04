# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% SH
sh_lec = LEC(
    _id='SH',
    structuringProcess_id='R',
    patternOfVariation_id='f',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=8,
)
sh_lec_info_en = LECInfo(
    language_id='en',
    lec=sh_lec,
    name='Categories of ground characterized by historical environmental stress or disturbance',
    description='Complex environmental factor that sorts ground characterised by historic disruptive stress and/or disturbance processes into categories with substantially different species composition; examples of categories are: landslide areas, glacier forelands, blockfields, polar deserts and pebble beaches',
)
sh_lec_info_nb = LECInfo(
    language_id='nb',
    lec=sh_lec,
    name='Spesiell mark/bunn preget av historisk miljøstress eller forstyrrelse',
    description='Denne komplekse miljøfaktoren fanger opp alle kjente tilfeller av spesiell mark/bunn som er resultatet av historiske disruptive stress- og/eller forstyrrelsesprosesser, som har gitt opphav til systemer med artssammensetning som er vesentlig forskjellig fra artssammensetningen i tilsvarende normale systemer, og dermed skal oppfattes som egne natursystem-hovedtyper i henhold til kriteriene i NiN[2] Artikkel 1: kapittel B4 og Vedlegg 5. For beskrivelse av hver enkelt klasse, se de respektive hovedtypene.',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='SH.0',
    lec=sh_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='normal naked ground / bottom'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='Ecological structuring process',
    value='normal'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='desc_nb'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='Økologisk strukturerende prosess',
    value='normal'
)
# a
a_elem_segment=ElementarySegment(
    _id='SH.a',
    lec=sh_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='avalanche'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='Ecological structuring process',
    value='mass transport on slopes (landslides)'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='skredmark'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='Økologisk strukturerende prosess',
    value='massetransport i skråninger (skred)'
)
# b
b_elem_segment=ElementarySegment(
    _id='SH.b',
    lec=sh_lec,
    value='b',
    order=2,
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='glacier foreland and snow melting area'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='Ecological structuring process',
    value='glacial melting'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='breforland og snøavsmeltingsområde'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='Økologisk strukturerende prosess',
    value='breavsmelting'
)
# c
c_elem_segment=ElementarySegment(
    _id='SH.c',
    lec=sh_lec,
    value='c',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='moraine weathering' #TODO ask about translation
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='Ecological structuring process',
    value='weathering and deposition of moraine material'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<class>',
    value='blokkmark'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='Økologisk strukturerende prosess',
    value='forvitring og avsetning av morenemateriale'
)
# d
d_elem_segment=ElementarySegment(
    _id='SH.d',
    lec=sh_lec,
    value='d',
    order=4,
    relative_order=4
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<class>',
    value='polar desert'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='Ecological structuring process',
    value='weathering'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<class>',
    value='polarørken'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='Økologisk strukturerende prosess',
    value='forvitring'
)
# e
e_elem_segment=ElementarySegment(
    _id='SH.e',
    lec=sh_lec,
    value='e',
    order=5,
    relative_order=5
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<class>',
    value='gravel and stone dominated beach and shoreline'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='Ecological structuring process',
    value='land uplift and wave erosion'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<class>',
    value='grus- og steindominert strand og strandlinje'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='Økologisk strukturerende prosess',
    value='landheving og bølgeerosjon'
)
