from model.model import LECType, LECTypeInfo

# %% mLEC
mlec_type = LECType(
    _id='mLEC',
)

mlec_type_en = LECTypeInfo(
    lecType=mlec_type,
    language_id='en',
    name='Major local environmental complex-variable',
    description='Local environmental complex-variable associated with gradient lengths that exceed 3 EDU–E (‘considerable variation’) within a major-type',
)

mlec_type_nb = LECTypeInfo(
    lecType=mlec_type,
    language_id='nb',
    name='Hovde lokale komplekse miljøvariabler',
    description='hLKM er angitt med rød skrift i rekkefølge etter antatt avtakende variasjon i artssammensetning forklart',
)