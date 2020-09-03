# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% HF
hf_lec = LEC(
    _id='HF',
    structuringProcess_id='R',
    patternOfVariation_id='g',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=1,
)
hf_lec_info_en = LECInfo(
    language_id='en',
    lec=hf_lec,
    name='Slope-related disturbance intensity',
    description='Variation in the inclination of rock substrates (submerged or terrestrial); with increasing slope the tebdency for loss of sessile organisms’ biomass increases due to strengthening of downward forces (water erosion, transport of snow, ice, soil etc.)',
)
hf_lec_info_nb = LECInfo(
    language_id='nb',
    lec=hf_lec,
    name='Helningsbetinget forstyrrelsesintensitet',
    description='Helningsbasert forstyrrelsesintensitet beskriver den økende faren for tap av biomasse av fastsittende organismer på nakent berg, på land og i vann, med økende helning. Den økende forstyrrelsesintensiteten skyldes at nedadrettete krefter (vannerosjon, isskuring, snø- og jordras etc.) som virker på organismene forsterkes når substratoverflata blir brattere (inntil bergveggen er loddrett). Da øker faren for at organismene skal løsne, og miljøet stiller økende krav til tilpasninger (tett tiltrykt substratet som skorpelav, gode festeanordninger etc.). Grensa mellom bergknaus og bergvegg er en gradvis overgang, men et gjennomgående trekk ser ut til å være at artssammensetningen endrer seg sterkt omkring 80˚ (en stigning på minst 6 vertikalmeter pr. horisontalmeter når berghyller ikke regnes med), både på land og i vannsystemer. Denne grensa er imidlertid basert på skjønn og ikke på empiriske data. Bergveggen representerer overgangstrinnet langs en helningsgradient mellom helningsgrader der helningsbetinget forstyrrelsesintensitet (HF) og grottebetinget skjerming (GS) benyttes til å beskrive variasjonen. Første mellomtrinn i GS er overheng, der helningsbetinget forstyrrelse fortsatt finner sted, men der andre mekanismer enn de som er virksomme i åpent terreng anses for viktigere.',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='HF.0',
    lec=hf_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='flat rock'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='Rocks with such a small slope that there is a risk of litter and water accumulating and resulting in \'reverse slope disturbance\''
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='Slope',
    value='<4°'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='flatberg'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='Berg med så liten helning at det fare for at strø og vann samler seg opp og resulterer i ‘omvendt helningsbetinget forstyrrelse’ '
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='Helning',
    value='<4°'
)
# a
a_elem_segment=ElementarySegment(
    _id='HF.a',
    lec=hf_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='slightly sloping rock'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='Rocks with little slope-related disturbance, ie little danger both for the accumulation of litter and water and for the loss of biomass as a result of downward forces acting on the organisms'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='Slope',
    value='4°-60°'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='svakt hellende bergknaus'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='Berg med liten helningsbetinget forstyrrelse, dvs. liten fare både for oppsamling av strø og vann og for tap av biomasse som følge av nedadrettete krefter som virker på organismene'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='Helning',
    value='4°-60°'
)
# b
b_elem_segment=ElementarySegment(
    _id='HF.b',
    lec=hf_lec,
    value='b',
    order=2,
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='strongly sloping rock'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='Rocks with a strong slope and a significant risk of slope-related disturbance'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='Slope',
    value='60°-80°'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='sterkt hellende bergknaus'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='Berg med sterk helning og betydelig fare for helningsbetinget forstyrrelse'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='Helning',
    value='60°-80°'
)
# plus
plus_elem_segment=ElementarySegment(
    _id='HF.+',
    lec=hf_lec,
    value='+',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='<class>',
    value='rock wall'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='<description>',
    value='Berg med stor fare for helningsbetinget forstyrrelse'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='Slope',
    value='80°-90°'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='<class>',
    value='bergvegg'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='<description>',
    value='Berg med stor fare for helningsbetinget forstyrrelse'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='Helning',
    value='80°-90°'
)
