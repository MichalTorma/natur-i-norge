# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% HS
hs_lec = LEC(
    _id='HS',
)
hs_lec_info_en = LECInfo(
    language_id='en',
    lec=hs_lec,
    name='Minor-type specific gradient',
    description='',
)
hs_lec_info_nb = LECInfo(
    language_id='nb',
    lec=hs_lec,
    name='Hovedtypespesifikk inndeling',
    description='',
)