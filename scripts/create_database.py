#%%
import pandas as pd
import sqlite3

# %%
data = pd.read_excel('../data/GAD3_T4Østl_RH.xlsx', sheet_name='GAD0', header=[0,1,2])
data

# %%
def compactifyColumnNames(columns):
    filtered_names = [list(filter(lambda x: 'Unnamed' not in str(x), names)) for names in columns]
    return ['-'.join([str(name) for name in names]) for names in filtered_names]

# %%
data.columns = compactifyColumnNames(data.columns)
data

# %%
