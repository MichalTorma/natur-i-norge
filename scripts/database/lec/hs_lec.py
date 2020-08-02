# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% HS
hs_lec = LEC(
    _id='HS',
)
hs_lec_info_en = LECInfo(
    language=en_language,
    lec=hs_lec,
    name='Minor-type specific gradient',
    description='',
)
hs_lec_info_nb = LECInfo(
    language=nb_language,
    lec=hs_lec,
    name='Hovedtypespesifikk inndeling',
    description='',
)