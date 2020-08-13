# %%
from model.model import MajorType, MajorTypeInfo

# %% F4
f4_major_type = MajorType(
    _id='F4',
    majorTypeGroup_id='F',
)
f4_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=f4_major_type,
    name='Strongly altered or artificial river waterbody',
    description='Strongly altered or artificial river waterbodies are characterised by irreversibly altered species composition and ecological function, brought about by human activities such as water regulation, contamination, irreversible eutrophication, chemical treatment against parasites and introduction of exotic species. Thus, the impacts may be physical, chemical or biological.',
)
f4_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=f4_major_type,
    name='Sterkt endrete elvevannmasser',
    description='''Sterkt endrete elvevannmasser omfatter vannmassene i elver som har fått sin artssammensetning og økologiske funksjon sterkt og irreversibelt endret gjennom fysiske inngrep (vassdragsreguleringer), kjemiske inngrep (irreversibel forurensning, eutrofiering, kjemisk behandling mot parasitter etc.) eller biologiske inngrep (utsetting av fiskearter som gjennomgripende har endret den trofiske strukturen og dermed artssammensetningen, etc.).'''
)