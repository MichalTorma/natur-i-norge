##
import pandas as pd
import sqlite3
from sqlalchemy import Table, Text, Integer
##
t4_data_file = 'data/GAD3v2.xlsm'
types_file = 'data/types.xlsx'

##
data = pd.read_excel(t4_data_file, sheet_name='GADml3', skiprows=1 )
data.columns = ['c_'+str(x).replace('.','').replace(':', '').replace(' ', '') for x in data.columns]

major_type_groups = pd.read_excel(types_file, sheet_name='Major-type group')

major_types = pd.read_excel(types_file, sheet_name='Major type')
major_types['major_group'] = major_types.Co

minor_types = pd.read_excel(types_file, sheet_name='Minor type')

gradients = pd.read_excel(types_file, sheet_name='Gradients')
##

conn = sqlite3.Connection('../naturinorge_guide/assets/nin.db')


data.to_sql('T4', conn)
major_type_groups.to_sql('type_groups', conn)
major_types.to_sql('major_types', conn)
minor_types.to_sql('minor_types', conn)
