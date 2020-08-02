#%%
from language_data import en_language, nb_language
from model.model import StructuringProcess, StructuringProcessInfo

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
