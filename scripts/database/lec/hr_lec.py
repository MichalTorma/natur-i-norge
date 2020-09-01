# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% HR
hr_lec = LEC(
    _id='HR',
    structuringProcess_id='D',
    patternOfVariation_id='f',
    knowledgeBaseRelations=5,
    knowledgeBaseDivision=5,
    spatialScale=7,
)
hr_lec_info_en = LECInfo(
    language_id='en',
    lec=hr_lec,
    name='Semi-natural land management regime',
    description='Binary variable that distinguishes between two fundamentally different land management regimes on semi-natural ground: grazing and/or haymaking (resulting in grassland) vs prescribed burning (resulting in heathland)',
)
hr_lec_info_nb = LECInfo(
    language_id='nb',
    lec=hr_lec,
    name='Semi-naturlig hevdregime',
    description='Denne komplekse miljøfaktoren beskriver de to fundamentalt forskjellige hevdregimene som har gitt opphav til hovedkategoriene av semi-naturlig jordbruksmark; lyngbrenning som nøkkelelementet i hevdregimet som, i kombinasjon med beiting hele eller store deler av året, eventuelt også slått, har gitt opphav til kystlynghei, og beite og/eller slått, gjerne i kombinasjon (se NiN[2] Artikkel 1: kapittel B3g), som har gitt opphav til semi-naturlig eng. Brenning kan også ha vært viktig ledd i tidlige faser av et beite- og/eller slåtteregime (landnåmsfasen), eller som et vedvarende tiltak, f.eks. for å forbedre beitekvaliteten på mager mark. For nærmere beskrivelse av hver enkelt klasse, se de respektive hovedtypene.',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='HR.0',
    lec=hr_lec,
    value='0',
    order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='grazing and / or mowing'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='livestock grazing or mowing or, most often, a combination of these'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='lyngbrenning'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='regelmessig foryngelse av det lyngdominerte feltsjiktet gjennom kontrollert avsviing, i kombinasjon med beiting hele eller store deler av året og eventuelt også slått'
)
# a
a_elem_segment=ElementarySegment(
    _id='HR.a',
    lec=hr_lec,
    value='a',
    order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='heather burning'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='regular rejuvenation of the heather-dominated field layer through controlled weaning, in combination with grazing all or large parts of the year and possibly also mowing'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='lyngbrenning'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='regelmessig foryngelse av det lyngdominerte feltsjiktet gjennom kontrollert avsviing, i kombinasjon med beiting hele eller store deler av året og eventuelt også slått'
)
