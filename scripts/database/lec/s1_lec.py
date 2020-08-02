# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% S1
s1_lec = LEC(
    _id='S1',
    parentLec_id='S3',
    structuringProcess_id='S',
    patternOfVariation_id='mf',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
s1_lec_info_en = LECInfo(
    language=en_language,
    lec=s1_lec,
    name='Particle size',
    description='Dominant grain size class in the substrate; ranging from bedrock (> 4096 mm) via blocks, stones, pebbles, sand and silt to clay (< 1/512 mm)',
)
s1_lec_info_nb = LECInfo(
    language=nb_language,
    lec=s1_lec,
    name='Dominerende kornstørrelsesklasse',
    description='Inneholder basisklasser for ulike kornstørrelser som fritt kan kombineres til hovedtypetilpassete trinn på grunnlag av kunnskap eller antakelser om omfanget av variasjon i artssammensetning som de gir opphav til. De to alternative måtene å beskrive variasjon relatert til sedimentsortering og kornstørrelse blir betegnet henholdsvis S3 (trevariabel-skjemaet; se NiN[2] Artikkel 1 Fig. B3–6) og S1 (envariabel-skjemaet).',
)