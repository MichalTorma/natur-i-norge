# %%
from model.model import MajorType, MajorTypeInfo

# %% T23
t23_major_type = MajorType(
    _id='T23',
    majorTypeGroup_id='T',
)
t23_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t23_major_type,
    name='Freshwater driftline',
    description='Freshwater driftline comprises the rarely occurring, more or less permanent accumulations of coarse organic matter in the upper ge littoral and surpralittoral belts along large lakes.',
)
t23_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t23_major_type,
    name='Ferskvannsdriftvoll',
    description='''Ferskvannsdriftvoll forekommer spredt i supralitoral- og øvre geolitoralbeltet langs store innsjøer som tilføres betydelige mengder mer eller mindre grovt organisk materiale, f.eks. kvister, lauv, rakler, pollen mv. Ferskvannsdriftvoller har relativt klare likheter med driftvoll i saltvannssystemer, og i likhet med disse sterkt innslag av nitrofile arter, deriblant karakteristiske pionérarter som f.eks. sumpforglemmegei (Myosotis laxa), vasspepper (Persicaria hydropiper) og nikkebrønsle (Bidens cernua).'''
)