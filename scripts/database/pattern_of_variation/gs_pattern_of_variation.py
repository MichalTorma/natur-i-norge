#%%
from language_data import en_language, nb_language
from model.model import PatternOfVariation, PatternOfVariationInfo

# %% gs
gs_pattern_of_variation = PatternOfVariation(
    _id='gs'
)
gs_pattern_of_variation_en = PatternOfVariationInfo(
    language=en_language,
    patternOfVariation=gs_pattern_of_variation,
    name='Succession gradient'
)
gs_pattern_of_variation_nb = PatternOfVariationInfo(
    language=nb_language,
    patternOfVariation=gs_pattern_of_variation,
    name='Suksesjonsgradient',
    description='Suksesjonsgradient som starter med akkumulering av arter'
)