#%%
import pandas as pd
import sqlite3
pd.set_option('display.max_rows', None)
pd.set_option('display.max_columns', None)
pd.set_option('display.width', None)
pd.set_option('display.max_colwidth', -1)

# %%
data = pd.read_excel('../data/GAD3v2.xlsm', sheet_name='GADml3', skiprows=1 )
data.columns

data.columns = ['c_'+str(x).replace('.','').replace(':', '').replace(' ', '') for x in data.columns]

data.columns


conn = sqlite3.Connection('../naturinorge_guide/assets/nin.db')


data.to_sql('T4', conn)
#%%
for col in data.columns:
    print(col)
# %%
