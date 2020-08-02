# %%
from model import LEC
from model import LECInfo
from database_fill.language_data import en_language, nb_language
from database_fill.structuring_process_data import s_structuring_process
from database_fill.pattern_of_variation_data import f_pattern_of_variation

# %% FK
fk_lec = LEC(
    _id='FK',
    structuringProcess=s_structuring_process,
    patternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=1,
    spatialScale=10,
)
fk_lec_info_en = LECInfo(
    language=en_language,
    lec=fk_lec,
    name='Categories of fresh-water with deviating chemical composition',
    description='Complex environmental factor that separates from \'normal\', circulating freshwater masses five categories of non-circulating water masses that have been found in meromictic, with systematically deviating elemental composition, e,g., high concen-trations of seasalt, iron, calcium and/or humus',
)
fk_lec_info_nb = LECInfo(
    language=nb_language,
    lec=fk_lec,
    name='Ferskvannsforekomster med avvikende kjemisk sammensetning',
    description='Det ikke-sirkulerende bunnvannet (monimolimnion) i meromiktiske innsjøer (det vil si innsjøer med et vannlag på bunnen som aldri blander seg med resten av vannet i innsjøen) kjennetegnes ofte ved svært spesielle kjemiske forhold, som gir opphav til spesiell artssammensetning. I noen grad er hver meromiktiske innsjø unik, men det er likevel mulig å foreta en viss gruppering på grunnlag av det stagnerende bunnvannets egenskaper. FK adresserer variasjonen i bunnvannmassenes egenskaper.',
)