#%%
from language_data import en_language, nb_language
from model.model import StructuringProcess, StructuringProcessInfo

# %% S
s_structuring_process = StructuringProcess(
    _id='S',
)
s_structuring_process_en = StructuringProcessInfo(
    structuringProcess=s_structuring_process,
    language=en_language,
    name='Environmental stress',
)
s_structuring_process_nb = StructuringProcessInfo(
    structuringProcess=s_structuring_process,
    language=nb_language,
    name='Miljøstress',
)