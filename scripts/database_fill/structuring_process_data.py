#%%
from database_fill.language_data import en_language, nb_language
from model import StructuringProcess, StructuringProcessInfo


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

# %% L
l_structuring_process = StructuringProcess(
    _id='L',
)
l_structuring_process_en = StructuringProcessInfo(
    structuringProcess=l_structuring_process,
    language=en_language,
    name='Slow succession',
)
l_structuring_process_nb = StructuringProcessInfo(
    structuringProcess=l_structuring_process,
    language=nb_language,
    name='Langsom suksesjon',
)
