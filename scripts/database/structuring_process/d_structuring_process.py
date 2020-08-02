# %%
from language_data import en_language, nb_language
from model.model import StructuringProcess, StructuringProcessInfo

# %% D
d_structuring_process = StructuringProcess(
    _id='D',
)
d_structuring_process_en = StructuringProcessInfo(
    structuringProcess=d_structuring_process,
    language=en_language,
    name='Destabilising disturbance',
)
d_structuring_process_nb = StructuringProcessInfo(
    structuringProcess=d_structuring_process,
    language=nb_language,
    name='Destabiliserende forstyrrelse',
)