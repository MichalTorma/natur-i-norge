from model.model import LECType, LECTypeInfo

# %% dLEC
dlec_type = LECType(
    _id='dLEC',
)

dlec_type_en = LECTypeInfo(
    lecType=dlec_type,
    language_id='en',
    name='Defining local environmental complex-variable',
    description='Local environmental complex-variable that forms the basis for separating a special major type from normal variation within a major-type group',
)

dlec_type_nb = LECTypeInfo(
    lecType=dlec_type,
    language_id='nb',
    name='Definerende lokale komplekse miljøvariabler',
    description='For (spesielle) hovedtyper betinget av miljøstress eller forstyrrelse, er i den definerende LKM (dLKM), det vil si den sLKM som skiller hovedtypen fra tilsvarende normale hovedtype.',
)