
# %%
from model.model import MajorType, MajorTypeInfo

# %% m10
m10_major_type = MajorType(
    _id=10,
    majorTypeGroup_id='M',
)
m10_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m10_major_type,
    name='Marine cave and overhang',
    description='Marine caves are natural cavities in bedrock, situated in the tidal belt or below low tide. Overhangs are rock walls with inclination > 90°. The surface of caves and overhangs receive less incident radiation and have more stable environmental conditions than marine rock at similar depths.',
)
m10_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m10_major_type,
    name='Marin grotte og overheng',
    description='''Ei grotte (hule) er et naturlig hulrom i fjell. Liksom på land utmerker marine grotter (inkludert brenningsgrotter, det vil si grotter i tidevannsbeltet) seg med spesielle leveforhold for organismer. Marine grotter får redusert lys i forhold til fast saltvannsbunn på tilsvarende dyp, og har mer stabilt miljø (f.eks. lavere vannpåvirkningsintensitet) enn normal fast saltvannsbunn. Grotter gir dermed god beskyttelse for fisk, larver etc. Som på land, er spesialiserte organismer, f.eks. krepsdyr uten pigmenter, kjent fra marine grotter. Artssammensetningen i marine grotter er dårlig undersøkt i Norge.'''
)