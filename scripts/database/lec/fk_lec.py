# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% FK
fk_lec = LEC(
    _id='FK',
    structuringProcess_id='S',
    patternOfVariation_id='f',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=1,
    spatialScale=10,
)
fk_lec_info_en = LECInfo(
    language_id='en',
    lec=fk_lec,
    name='Categories of fresh-water with deviating chemical composition',
    description='Complex environmental factor that separates from \'normal\', circulating freshwater masses five categories of non-circulating water masses that have been found in meromictic, with systematically deviating elemental composition, e,g., high concen-trations of seasalt, iron, calcium and/or humus',
)
fk_lec_info_nb = LECInfo(
    language_id='nb',
    lec=fk_lec,
    name='Ferskvannsforekomster med avvikende kjemisk sammensetning',
    description='Det ikke-sirkulerende bunnvannet (monimolimnion) i meromiktiske innsjøer (det vil si innsjøer med et vannlag på bunnen som aldri blander seg med resten av vannet i innsjøen) kjennetegnes ofte ved svært spesielle kjemiske forhold, som gir opphav til spesiell artssammensetning. I noen grad er hver meromiktiske innsjø unik, men det er likevel mulig å foreta en viss gruppering på grunnlag av det stagnerende bunnvannets egenskaper. FK adresserer variasjonen i bunnvannmassenes egenskaper.',
)