# %%
from model.model import MajorType, MajorTypeInfo

# %% T20
t20_major_type = MajorType(
    _id='T20',
    majorTypeGroup_id='T',
)
t20_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t20_major_type,
    name='Kettle-hole frost heath',
    description='Kettle-hole frost heath includes naturally open (treeless) heath-like vegetation in the bottom of well-drained terrain depressions, most typically found in kettle-holes formed in thick glacifluvial deposits. The typical occurrence of hummocks without peat formation suggests that frost processes are important, most likely conditioned on influx of surface water on frozen ground in the autumn or early winter. Frost heath is typically found in continental climates in the middle and north boreal, and low alpine bioclimatic zones.',
)
t20_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t20_major_type,
    name='Isinnfrysingsmark',
    description='''Isinnfrysingsmark er åpen fastmark med hei- eller engpreg i eller nær bunnen av forsenkninger i terrenget (fortrinnsvis dødisgroper), som i perioder kan dekkes av stagnerende vann og i blant fryse inn i is om vinteren.'''
)