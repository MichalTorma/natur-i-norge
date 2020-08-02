#%%
from language_data import en_language, nb_language
from this.model import PatternOfVariation, PatternOfVariationInfo

# %% ga
ga_pattern_of_variation = PatternOfVariation(
    _id='ga'
)
ga_pattern_of_variation_en = PatternOfVariationInfo(
    language=en_language,
    patternOfVariation=ga_pattern_of_variation,
    name='Gradient that ends in a species-thinning situation at high intensity'
)
ga_pattern_of_variation_nb = PatternOfVariationInfo(
    language=nb_language,
    patternOfVariation=ga_pattern_of_variation,
    name='Gradient som ender i et artsuttynningsintervall'
)