# %%
from model.model import MajorType, MajorTypeInfo

# %% T10
t10_major_type = MajorType(
    _id=10,
    majorTypeGroup_id='T',
)
t10_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t10_major_type,
    name='Arctic salt-enriched ground',
    description='Arctic salt-enriched ground comprises graminoid-dominated sites with salt-enriched topsoil brought about by upward water transport in summer. Topsoil pH is usually in the range 8.5–10.5. This major type is confined to the ‘Arctic steppe’ of the continental inner parts of Wijdefjorden, N Spitsbergen.',
)
t10_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t10_major_type,
    name='Arktisk steppe',
    description='''Arktisk steppe omfatter jorddekt fastmark i klart kontinentale områder på Svalbard (kjent fra Wijdefjorden med sidefjorder), med jordsmonn preget av oppadgående vanntransport, saltanriking nær jordoverflata og pH vanligvis i intervallet 8,5–10,5. Arktisk steppe kjennetegnes av særpregete samfunn dominert av grasaktige arter. Arktisk steppe mangler bunnsjiktet av moser og lav som er karakteristisk for T3 Fjellhei, leside og tundra, dominerende natursystem-hovedtype i omkringliggende, mindre kontinentale områder.'''
)