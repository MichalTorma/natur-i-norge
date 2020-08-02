#%%
from language_data import en_language, nb_language
from this.model import PatternOfVariation, PatternOfVariationInfo

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