# %%
from model.model import MajorType, MajorTypeInfo

# %% F5
f5_major_type = MajorType(
    _id='F5',
    majorTypeGroup_id='F',
)
f5_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=f5_major_type,
    name='Strongly altered or artificial lake waterbody',
    description='Strongly altered or artificial lake waterbodies are characterised by irreversibly altered species composition and ecological function, brought about by human activities similar to those listed for rivers (F4). This major type also includes artificial waterbodies such as water reservoirs and farm ponds.',
)
f5_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=f5_major_type,
    name='Sterkt endrete innsjøvannmasser',
    description='''Sterkt endrete innsjøvannmasser omfatter vannmassene i innsjøer og dammer som har fått sin artssammensetning og økologiske funksjon sterkt og irreversibelt endret gjennom fysiske inngrep (vassdragsreguleringer), kjemiske inngrep (irreversibel forurensning, eutrofiering, kjemisk behandling mot parasitter etc.) eller biologiske inngrep (utsetting av fiskearter som gjennomgripende har endret den trofiske strukturen og dermed artssammensetningen, etc.), samt vannmassene i kunstige vannforekomster (vannmagasiner, gårdsdammer etc.).'''
)