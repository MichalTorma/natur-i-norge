# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% S3S
s3s_lec = LEC(
    _id='S3S',
    parentLec_id='S3',
    structuringProcess_id='S',
    patternOfVariation_id='mf',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
s3s_lec_info_en = LECInfo(
    language_id='en',
    lec=s3s_lec,
    name='Special sediments',
    description='A categorical variable that includes, e.g., shellsand, coral gravel and submerged peat',
)
s3s_lec_info_nb = LECInfo(
    language_id='nb',
    lec=s3s_lec,
    name='Spesielt sediment',
    description='Innenfor flere av sedimentkategoriene definert ved en gitt kombinasjon av erosjonsmotstand og finmaterialinnhold finnes i tillegg til normale mineraljordssedimenter også bioklastiske sedimenter, det vil si ’sedimenter som for en stor del består av partikler av biologisk opprinnelse’. Når disse sedimentene har spesielle egenskaper som resulterer i en artssammensetning som er betydelig eller vesentlig forskjellig fra sedimenter som er sammenliknbare med hensyn til erosjonsmotstand og finmaterialinnhold, skal de etter prinsippene for typeinndeling i NiN versjon 2 gi grunnlag for inndeling i egne grunn- eller hovedtyper. Slike bioklastiske sedimenter (som utgjør de fleste av klassene i S3S) utgjør derfor den tredje dimensjonen innenfor S3, faktorvariabelen spesielle sedimenter (S3S).',
)