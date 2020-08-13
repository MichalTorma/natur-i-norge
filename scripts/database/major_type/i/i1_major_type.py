# %%
from model.model import MajorType, MajorTypeInfo

# %% I1
i1_major_type = MajorType(
    _id=1,
    majorTypeGroup_id='I',
)
i1_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=i1_major_type,
    name='Permanent snow and ice',
    description='Permanent snow and ice comprises ground that is snow and ice-covered for several years, including glaciers and snowdrifts.',
)
i1_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=i1_major_type,
    name='Snø- og isdekt fastmark',
    description='''Snø- og isdekt fastmark omfatter fastmarksarealer som er dekt av snø og/eller is, det vil si breer og snøansamlinger. Få, spesialtilpassete arter lever på og i varig snø og is, blant andre snøalger [f.eks. rød snø (Chlamydomonas nivalis)]. En del insektarter med stor kuldetoleranse oppholder seg på is og snø i perioder, men ingen kjente dyr gjennomfører hele sin livssyklus i eller på snø og is.'''
)