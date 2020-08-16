from model.model import LECType, LECTypeInfo

# %% mLEC
ilec_type = LECType(
    _id='iLEC',
)

ilec_type_en = LECTypeInfo(
    lecType=ilec_type,
    language_id='en',
    name='Minor local environmental complex-variable',
    description='Local environmental complex-variable associated with gradient lengths between 2 and 3 EDU–E (‘substantial variation’) within a major-type',
)

ilec_type_nb = LECTypeInfo(
    lecType=ilec_type,
    language_id='nb',
    name='Tilleggskompleksmiljøvariabler',
    description=None, #TODO add description
)