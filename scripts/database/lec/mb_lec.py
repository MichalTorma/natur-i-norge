# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% MB
mb_lec = LEC(
    _id='MB',
    structuringProcess_id='D',
    patternOfVariation_id='f',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=3,
    spatialScale=6,
)
mb_lec_info_en = LECInfo(
    language_id='en',
    lec=mb_lec,
    name='Topsoil tilling',
    description='Binary variable that separates intensively managed land into two categories; land that is not regularly ploughed (i.e., subjected to topsoil tilling) from land that is regularly ploughed (and, in addition to tilling, often also fertilised and/or treated with herbicides)',
)
mb_lec_info_nb = LECInfo(
    language_id='nb',
    lec=mb_lec,
    name='Markbearbeiding',
    description='Sterkt endret jordbruksmark som er i aktiv bruk i norsk landbruk i dag kan fordeles på to ‘hoveddriftsformer’ som, både med hensyn til miljøforholdene og artssammensetningen (av jordbruksvekster og ugras) er vesentlig forskjellige; åker og varig eng. En åker er en fulldyrket mark som er pløyd og tilsådd (oftest også gjødslet og/eller sprøytet), der det dyrkes mat- eller fôrvekster, gjerne i monokultur. Åkeren pløyes og sås oftest til på nytt hvert år. Ugrassamfunnene består derfor overveiende av ettårige arter og det utvikles ikke engang forstadier til helhetlige økosystemer. Varig eng, på den andre siden, pløyes opp og så til igjen mye sjeldnere, typisk med (5–)10–15 års mellomrom, og rekker på denne tida å utvikle samfunn av flerårige arter. Det er forskjellen mellom de to driftsregimene som beskrives av variabelen markbearbeiding (MB).',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='MB.0',
    lec=mb_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='not regularly processed'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='land that is not regularly plowed, harrowed or similar (within heavily altered agricultural land: permanent meadow)'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='ikke regelmessig bearbeidet'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='mark som ikke regelmessig pløyes, harves eller liknende (innenfor sterkt endret jordbruksmark: varig eng)'
)
# plus
plus_elem_segment=ElementarySegment(
    _id='MB.+',
    lec=mb_lec,
    value='+',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='<class>',
    value='regularly processed'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='<description>',
    value='land that is cultivated (plowed, harrowed or similar) regularly (within heavily altered agricultural land: fields)'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='<class>',
    value='regelmessig bearbeidet'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='<description>',
    value='mark som bearbeides (pløyes, harves eller liknende) regelmessig (innenfor sterkt endret jordbruksmark: åker)'
)
