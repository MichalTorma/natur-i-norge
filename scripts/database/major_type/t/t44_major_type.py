# %%
from model.model import MajorType, MajorTypeInfo

# %% T44
t44_major_type = MajorType(
    _id='T44',
    majorTypeGroup_id='T',
)
t44_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t44_major_type,
    name='Arable field',
    description='Arable field includes tilled and seeded farmland, typically with monocultures of harvested crops such as cereals, oil-seed plants, legumes and potatoes. Commercial fertiliser, slurry and/or pesticides are often applied. In addition to sown plants, annual weeds occur frequently.',
)
t44_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t44_major_type,
    name='Åker',
    description='''Åker er fulldyrket mark som er pløyd og tilsådd, oftest også gjødslet og/eller sprøytet, der det dyrkes mat- eller fôrvekster, gjerne i monokultur. Åker omfatter jordbruksmark med intensiv hevd og hyppig markbearbeiding, og har en artssammensetning av ‘ville’ arter som hovedsakelig består av ettårige eller kortlevete ugras.'''
)