# %%
from model.model import MajorType, MajorTypeInfo

# %% T28
t28_major_type = MajorType(
    _id='T28',
    majorTypeGroup_id='T',
)
t28_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t28_major_type,
    name='Polar desert',
    description='Polar desert comprises gravel- and stone-dominated areas in the Arctic polar desert zone, formed by frost weathering. Material finer than gravel may be present. The vegetation is scattered and dominated by species with a high-arctic distribution.',
)
t28_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t28_major_type,
    name='Polarørken',
    description='''Polarørken omfatter stein- og grusdominerte områder nord for eller høydemessig over sonen med arktisk tundra, der vegetasjonsdekket på grunn av svært lav temperatursum er fragmentarisk og der vedaktige planter samt arter fra starrfamilien mangler.'''
)