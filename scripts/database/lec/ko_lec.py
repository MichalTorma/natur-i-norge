# %%
from model import LEC
from model import LECInfo
from database_fill.language_data import en_language, nb_language
from database_fill.structuring_process_data import s_structuring_process
from database_fill.pattern_of_variation_data import f_pattern_of_variation

# %% KO
ko_lec = LEC(
    _id='KO',
    structuringProcess=s_structuring_process,
    patternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=5,
    spatialScale=9,
)
ko_lec_info_en = LECInfo(
    language=en_language,
    lec=ko_lec,
    name='Connectivity',
    description='Binary variable that separates isolated water bodies from water bodies that are part of more or less extensive watercourse networks; connectedness increases species richness of organisms with dispersal limitations such as fish, larger molluscs and crustaceans',
)
ko_lec_info_nb = LECInfo(
    language=nb_language,
    lec=ko_lec,
    name='Konnektivitet',
    description='En rekke ferskvannsorganismer (fisk, større bløtdyr, krepsdyr etc.) mangler i enkelte vannforekomster fordi de ikke har spredd seg dit; i mange tilfeller fordi vannforekomsten ligger isolert uten tilknytning til et større vassdrag gjennom en utløpsbekk eller -elv. Miljøfaktoren konnektivitet angir om en innsjø er forbundet med et større vassdrag gjennom en utløpsbekk eller -elv.',
)