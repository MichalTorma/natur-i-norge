#%%
from language_data import en_language, nb_language
from this.model import PatternOfVariation, PatternOfVariationInfo

# %% g
g_pattern_of_variation = PatternOfVariation(
    _id='g'
)
g_pattern_of_variation_en = PatternOfVariationInfo(
    language=en_language,
    patternOfVariation=g_pattern_of_variation,
    name='Gradient'
)
g_pattern_of_variation_nb = PatternOfVariationInfo(
    language=nb_language,
    patternOfVariation=g_pattern_of_variation,
    name='Gradient'
)