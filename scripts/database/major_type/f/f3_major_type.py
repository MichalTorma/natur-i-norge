# %%
from model.model import MajorType, MajorTypeInfo

# %% F3
f3_major_type = MajorType(
    _id='F3',
    majorTypeGroup_id='F',
)
f3_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=f3_major_type,
    name='Anoxic lake waterbody',
    description='Anoxic lake waterbodies comprise the non-circulating, permanently stagnant, oxygen-free waters at the bottom of meromictic lakes (monimolimnion). Meromictic lakes are lakes with a permanent and stable vertical stratification (no seasonal mixing of water between strata under normal conditions). Anoxic waterbodies have characteristic, deviant, chemical composition compared to normal, oxic waters; high concentrations of CO2, CH4, Ca, Fe and/or Mn are typical. Bacteria tend to dominate the species-poor communities.',
)
f3_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=f3_major_type,
    name='Ikke-sirkulerende innsjøvannmasser',
    description='''Ikke-sirkulerende innsjøvannmasser omfatter det permanent stagnerende bunnvannet (monimolimnion) i meromiktiske innsjøer, det vil si innsjøer som har et tungt, kaldt vannlag på bunnen, under sprangsjiktet, oftest på dyp > 10 m, som aldri blander seg med resten av vannet i innsjøen og som derfor er fritt for oksygen. Ikke- sirkulerende vannmasser kjennetegnes av spesielle kjemiske forhold, ofte høye konsentrasjoner av CO2, CH4, Ca, Fe og/eller Mn, en artssammensetning dominert av bakterier og ekstrem artsfattigdom. Innsjøer kan ha permanent stagnerende bunnvann av mange ulike årsaker, og hver enkelt meromiktisk innsjø har derfor unike trekk.'''
)