# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% TU
tu_lec = LEC(
    _id='TU',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=9,
)
tu_lec_info_en = LECInfo(
    language_id='en',
    lec=tu_lec,
    name='Turbidity',
    description='Variation in the content of suspended inorganic material in water, e.g., glacial rivers, which, like high concentrations of organic material (LEC HU) reduces light penetration but unlike the latter also causes mechanical abrasion of the substrate and ends in a species-thinning situation',
)
tu_lec_info_nb = LECInfo(
    language_id='nb',
    lec=tu_lec,
    name='Turbiditet',
    description='''Turbiditeten er et uttrykk for mengden suspendert uorganisk materiale i ferskvann – økende innhold av uorganisk materiale gir vannet en gråere farge. Store mengder suspendert mineralmateriale reduserer lysgjennomtrengeligheten i vannet på samme måten som høyt humusinnhold (HU), og har i tillegg en slipende effekt på underlaget. Det uorganiske materialet stammer oftest fra breerosjon og fraktes med breelver inn i større elvesystemer, men det kan også stamme fra erosjon av marine leirsedimenter elva renner gjennom. 
	Til tross for at variasjonen i artssammensetning relatert til turbiditet (TU) er mangelfullt kjent, er TU inkludert som en LKM i NiN 2. Dette er i tråd med typologien i Vannveilederen (Anonym 2013) der turbiditet er inkludert som egen ‘typefaktor’ på samme vil som, og parallelt med, humusinnhold.
''',
)