# %%
from model import LEC
from model import LECInfo
from database_fill.language_data import en_language, nb_language
from database_fill.structuring_process_data import r_structuring_process
from database_fill.pattern_of_variation_data import g_pattern_of_variation

# %% HF
hf_lec = LEC(
    _id='HF',
    structuringProcess=r_structuring_process,
    patternOfVariation=g_pattern_of_variation,
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=1,
)
hf_lec_info_en = LECInfo(
    language=en_language,
    lec=hf_lec,
    name='Slope-related disturbance intensity',
    description='Variation in the inclination of rock substrates (submerged or terrestrial); with increasing slope the tebdency for loss of sessile organisms’ biomass increases due to strengthening of downward forces (water erosion, transport of snow, ice, soil etc.)',
)
hf_lec_info_nb = LECInfo(
    language=nb_language,
    lec=hf_lec,
    name='Helningsbetinget forstyrrelsesintensitet',
    description='Helningsbasert forstyrrelsesintensitet beskriver den økende faren for tap av biomasse av fastsittende organismer på nakent berg, på land og i vann, med økende helning. Den økende forstyrrelsesintensiteten skyldes at nedadrettete krefter (vannerosjon, isskuring, snø- og jordras etc.) som virker på organismene forsterkes når substratoverflata blir brattere (inntil bergveggen er loddrett). Da øker faren for at organismene skal løsne, og miljøet stiller økende krav til tilpasninger (tett tiltrykt substratet som skorpelav, gode festeanordninger etc.). Grensa mellom bergknaus og bergvegg er en gradvis overgang, men et gjennomgående trekk ser ut til å være at artssammensetningen endrer seg sterkt omkring 80˚ (en stigning på minst 6 vertikalmeter pr. horisontalmeter når berghyller ikke regnes med), både på land og i vannsystemer. Denne grensa er imidlertid basert på skjønn og ikke på empiriske data. Bergveggen representerer overgangstrinnet langs en helningsgradient mellom helningsgrader der helningsbetinget forstyrrelsesintensitet (HF) og grottebetinget skjerming (GS) benyttes til å beskrive variasjonen. Første mellomtrinn i GS er overheng, der helningsbetinget forstyrrelse fortsatt finner sted, men der andre mekanismer enn de som er virksomme i åpent terreng anses for viktigere.',
)