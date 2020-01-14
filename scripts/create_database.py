#%%
import pandas as pd
import sqlite3

# %%
data = pd.read_excel('../data/GAD3_T4Østl_RH.xlsx', sheet_name='GADml2', skiprows=1 )
data.columns
#%%
data.columns = [str(x) for x in data.columns]
# %%
def compactifyColumnNames(columns):
    filtered_names = [list(filter(lambda x: 'Unnamed' not in str(x), names)) for names in columns]
    return ['-'.join([str(name) for name in names]) for names in filtered_names]

# %%
data.columns = compactifyColumnNames(data.columns)
data.columns

# %%
conn = sqlite3.Connection('nin.db')

# %%
data.to_sql('T4', conn)
#%%
data.columns