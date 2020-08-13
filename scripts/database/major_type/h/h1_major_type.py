# %%
from model.model import MajorType, MajorTypeInfo

# %% H1
h1_major_type = MajorType(
    _id=1,
    majorTypeGroup_id='H',
)
h1_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=h1_major_type,
    name='Oceanic waterbody',
    description='Oceanic marine waterbodies are directly connected to the World’s large oceans, without being physically separated from the latter by a threshold. This major type comprises water masses that are connected to, part of, or strongly influenced by, the Earth’s large circulation systems.',
)
h1_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=h1_major_type,
    name='Havvannmasser',
    description='''Havvannmasser omfatter alle marine vannmasser som står i direkte sammenheng med verdenshavene, uten å være fysisk skilt fra disse gjennom en markert terskel (slik fjorder og poller er). Havstrømmer og vertikale sirkulasjonssystemer sørger for regelmessig utveksling av vannmasser. Havvannmassene har en fullstendig næringskjede med planteplankton som viktigste primærprodusenter, med krepsdyrplankton som viktigste plantespisere og en kompleks næringskjede av predatorer. Som økosystem er havvannmassene et åpent system der mange arter gjør store, til dels regelmessige horisontale og/eller vertikale vandringer. Dette begrenser antallet ‘naturtyper’ som kan defineres på grunnlag av artssammensetningen.'''
)