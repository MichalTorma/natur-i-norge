# %%
from model.model import MajorType, MajorTypeInfo

# %% T22
t22_major_type = MajorType(
    _id='T22',
    majorTypeGroup_id='T',
)
t22_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t22_major_type,
    name='Arctic-alpine dry-grass heath',
    description='Arctic-alpine dry-grass heath comprises land in the mountains and in the Arctic dominated by graminoids like Juncus trifidus, Festuca ovina and Carex bigelowii with a bottom layer dominated by Cetraria islandica and Stereocaulon spp. Juncus trifidus, which is the major dominant, gives this major type a distinctive reddish brown colour in late summer and fall. Arctic-alpine dry-grass heath typically replaces the arctic-alpine heath and lee-side major type (T3) at the transition from the low-alpine to the middle-alpine bioclimatic zone, when dominant species of T3 such as Vaccinium myrtillus reach their altitudinal limit and/or give in to unstable soils. Solifluction is assumed to be an important conditioning factor; the major type is also found at lower elevations in sites with unstable soils.',
)
t22_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t22_major_type,
    name='Fjellgrashei og grastundra',
    description='''Fjellgrashei og fjellgrastundra omfatter mark i fjellet og i Arktis dominert eller med spredt forekomst av ‘tørrgras’ som f.eks. rabbesiv (Juncus trifidus), sauesvingel (Festuca ovina) og stivstarr (Carex bigelowii), typisk med et dekkende lavsjikt dominert av islandslav (Cetraria islandica) og saltlav (Stereocaulon spp.). Fjellgrashei og grastundra erstatter T3 Fjellhei, leside og tundra i øvre del av lavalpin og overgangen mellom lavalpin og mellomalpin bioklimatisk sone i midtre deler av ‘rabbe-snøleiegradienten’, over et intervall som strekker seg fra fjell-lavhei til moderat snøleie. Overgangen på fastmark mellom lavalpine heier, lesider og typiske moderate snøleier og tørrgrasheiene ovenfor er oftest relativt skarp og fysiognomisk så tydelig markert i hele fjellkjeden at den er et klassisk skillekriterium mellom lavalpin og mellomalpin bioklimatisk sone. Det er fortsatt ikke helt klart hvilke miljøforhold som betinger dette skillet, men Dahl (1957) sannsynliggjør at jordflyt er en viktig medvirkende årsak.'''
)