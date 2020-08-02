# %%
from model import LEC
from model import LECInfo
from database_fill.language_data import en_language, nb_language
from database_fill.structuring_process_data import s_structuring_process
from database_fill.pattern_of_variation_data import ga_pattern_of_variation

# %% GS
gs_lec = LEC(
    _id='GS',
    structuringProcess=s_structuring_process,
    patternOfVariation=ga_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=1,
    spatialScale=4,
)
gs_lec_info_en = LECInfo(
    language=en_language,
    lec=gs_lec,
    name='Cave-induced sheltering',
    description='Light attenuation and reduced amplitudes of temperature and air humidity along the physical gradient from open ground via overhanging rocks to the interior of deep caves, ending in a species-thinning situation',
)
gs_lec_info_nb = LECInfo(
    language=nb_language,
    lec=gs_lec,
    name='Grottebetinget skjerming',
    description='''Kompleks miljøgradient som beskriver lyssvekking og redusert amplitude i flere enkeltvariabler som luftfuktighet og lys langs en fysisk gradient fra åpen mark til det indre av dype grotter. Grottebetinget skjerming er relevant for variasjon i artssammensetning både i terrestre og akvatiske systemer, og for en lang rekke artsgrupper. Artssammensetningen i indre deler av grotter (sterk grottebetinget skjerming) er dårlig kjent
	Til grunn for trinndeling av GS er lagt at gradienten ender i artsuttynning med nedre endetrinn for artsuttynningsintervallet i trinn GS∙b.
''',
)