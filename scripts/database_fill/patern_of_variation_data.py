#%%
from database_fill.language_data import en_language, nb_language
from model import PatternOfVariation, PatternOfVariationInfo

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

# %% t
t_pattern_of_variation = PatternOfVariation(
    _id='t'
)
t_pattern_of_variation_en = PatternOfVariationInfo(
    language=en_language,
    patternOfVariation=t_pattern_of_variation,
    name='Transition type',
    description='Actually a gradient, but with a clear threshold interval where there is a rapid change of the species composition so that it is appropriate (and often natural) to treat it as a factor'
)
t_pattern_of_variation_nb = PatternOfVariationInfo(
    language=nb_language,
    patternOfVariation=t_pattern_of_variation,
    name='Overgangstype',
    description='Egentlig en gradient, men med tydelig terskelintervall der det skjer en rask utskifting av artssammensetningen slik at det er hensiktsmessig (og ofte naturlig) å behandle den som en faktor'
)