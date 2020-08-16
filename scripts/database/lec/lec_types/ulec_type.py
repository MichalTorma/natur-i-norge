from model.model import LECType, LECTypeInfo

# %% uLEC
ulec_type = LECType(
    _id='uLEC',
)

ulec_type_en = LECTypeInfo(
    lecType=ulec_type,
    language_id='en',
    name='Subordinate local environmental complex-variable',
    description='Local environmental complex-variable associated with gradient lengths between 1 and 2 EDU–E (‘observable variation’) within a major-type',
)

ulec_type_nb = LECTypeInfo(
    lecType=ulec_type,
    language_id='nb',
    name='Underordnete miljøvariabler ',
    description=None, #TODO add description
)