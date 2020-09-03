# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% HU
hu_lec = LEC(
    _id='HU',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=10,
)
hu_lec_info_en = LECInfo(
    language_id='en',
    lec=hu_lec,
    name='Freshwater humus content',
    description='Variation in the concentration of particulate and dissolved organic matter in water, from oligohumous and transparent (<2 mg TOC/L; TOC = total organic carbon) via mesohumous to polyhumous, dark-coloured (> 15 mg TOC/L)',
)
hu_lec_info_nb = LECInfo(
    language_id='nb',
    lec=hu_lec,
    name='Humusinnhold',
    description='''Humusinnholdet, eller vannfargen, er et uttrykk for mengden partikulært og løst organisk materiale i ferskvann – økende innhold av organisk materiale gir vannet en mørkere farge. Det organiske materialet kan være produsert i vannsystemet (autoktont, stedegent) eller, oftere, er det tilført (alloktont) fra omgivelsene. De viktigste kildene til høyt humusinnhold i ferskvann er tilførsler fra myrer og skogsmark i nedbørfeltet. Turbiditet (TU) er et uttrykk for mengden suspendert uorganisk materiale i ferskvann.
	Av de 929 sjøene i NIVAs vannegenskapsdatabase som inkluderer målinger av pH, Ca og vannfarge (se NiN[1] Artikkel 18), hører 57,8 % til trinn HU∙a oligohumøs (definert som < 15 mg Pt/l), 17,0 % til trinn HU∙b (15–30 mg Pt/l), 6,5 % til trinn HU∙c (30–45 mg Pt/l), 12,7 % til trinn HU∙d (45–90 mg Pt/l) og 4,7 % til trinn HU∙e (> 90 mg Pt/l).
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='HU.0',
    lec=hu_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='very clear'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='oligohumous'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='Pt/L',
    value='<10mg'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='total content of organic material per litre',
    value='<2mg'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='svært klar'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='oligohumøs'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='Pt/L',
    value='<10mg'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='totalinnhold av organisk materiale per liter',
    value='<2mg'
)
# a
a_elem_segment=ElementarySegment(
    _id='HU.a',
    lec=hu_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='clear'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='mesohumous'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='Pt/L',
    value='10mg-30mg'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='total content of organic material per litre',
    value='2mg-5mg'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='klar'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='mesohumøs, pp.'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='Pt/L',
    value='10mg-30mg'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='totalinnhold av organisk materiale per liter',
    value='2mg-5mg'
)
# b
b_elem_segment=ElementarySegment(
    _id='HU.b',
    lec=hu_lec,
    value='b',
    order=2,
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='intermediate'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='mesohumous'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='Pt/L',
    value='30mg-45mg'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='total content of organic material per litre',
    value='5mg-10mg'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='intermediær'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='mesohumøs, pp.'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='Pt/L',
    value='30mg-45mg'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='totalinnhold av organisk materiale per liter',
    value='5mg-10mg'
)
# c
c_elem_segment=ElementarySegment(
    _id='HU.c',
    lec=hu_lec,
    value='c',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='humus'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<description>',
    value='polyhumous'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='Pt/L',
    value='45mg-90mg'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='total content of organic material per litre',
    value='10mg-15mg'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<class>',
    value='humøs'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<description>',
    value='polyhumøs, pp.'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='Pt/L',
    value='45mg-90mg'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='totalinnhold av organisk materiale per liter',
    value='10mg-15mg'
)
# d
d_elem_segment=ElementarySegment(
    _id='HU.d',
    lec=hu_lec,
    value='d',
    order=4,
    relative_order=4
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<class>',
    value='very humorous'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<description>',
    value='polyhumous'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='Pt/L',
    value='>90mg'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='total content of organic material per litre',
    value='>15mg'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<class>',
    value='svært humøs'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<description>',
    value='polyhumøs, pp.'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='Pt/L',
    value='>90mg'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='totalinnhold av organisk materiale per liter',
    value='>15mg'
)
