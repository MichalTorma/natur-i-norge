#%%
from language_data import en_language, nb_language
from this.model import PatternOfVariation, PatternOfVariationInfo

# %% f
f_pattern_of_variation = PatternOfVariation(
    _id='f'
)
f_pattern_of_variation_en = PatternOfVariationInfo(
    language=en_language,
    patternOfVariation=f_pattern_of_variation,
    name='Factor'
)
f_pattern_of_variation_nb = PatternOfVariationInfo(
    language=nb_language,
    patternOfVariation=f_pattern_of_variation,
    name='Faktor'
)