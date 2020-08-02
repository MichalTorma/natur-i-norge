#%%
from language_data import en_language, nb_language
from this.model import PatternOfVariation, PatternOfVariationInfo

# %% mf
mf_pattern_of_variation = PatternOfVariation(
    _id='mf'
)
mf_pattern_of_variation_en = PatternOfVariationInfo(
    language=en_language,
    patternOfVariation=mf_pattern_of_variation,
    name='Multivariate factor'
)
mf_pattern_of_variation_nb = PatternOfVariationInfo(
    language=nb_language,
    patternOfVariation=mf_pattern_of_variation,
    name='Multivariat faktor'
)