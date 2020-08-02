#%%
from language_data import en_language, nb_language
from model.model import StructuringProcess, StructuringProcessInfo

# %% R
r_structuring_process = StructuringProcess(
    _id='R',
)
r_structuring_process_en = StructuringProcessInfo(
    structuringProcess=r_structuring_process,
    language=en_language,
    name='Regulating disturbance',
)
r_structuring_process_nb = StructuringProcessInfo(
    structuringProcess=r_structuring_process,
    language=nb_language,
    name='Regulerende forstyrrelse',
)