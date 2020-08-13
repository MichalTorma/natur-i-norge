# %%
from model.model import MajorType, MajorTypeInfo

# %% V13
v13_major_type = MajorType(
    _id=13,
    majorTypeGroup_id='V',
)
v13_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v13_major_type,
    name='Artificial wetland',
    description='Artificial wetland includes new wetland originating by paludification of previous non-wetland sites by human intervention, e.g. road construction.',
)
v13_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v13_major_type,
    name='Ny våtmark',
    description='''Ny våtmark omfatter våtmarkssystemer som har oppstått gjennom irreversibelt inngrep på mark som ikke tidligere var våtmark. Ny våtmark kan oppstå når grunnvannsnivået i et område endres, for eksempel ved permanentoppdemmingellernedtappingavinnsjøer,ettertørrleggingavelveleier,vedveibyggingetc. Ny våtmark kan også oppstå ved forsumping når dreneringssystemene på åkerland som er oppdyrket ved drenering av tidligere våtmark ikke lenger holdes i hevd og dreneringssystemet kollapser. Ny våtmark dekker vanligvis små arealer.'''
)