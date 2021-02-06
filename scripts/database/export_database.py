# %%
import pandas as pd
from sqlalchemy import create_engine
from model.model import Base

database_file = 'assets/nin_database.db'
engine = create_engine(f'sqlite:///{database_file}')
export_path = 'tables/GoldenMaster.xlsx'
writer = pd.ExcelWriter(export_path)
table_names = pd.read_sql("SELECT name FROM sqlite_master WHERE type='table'", con=engine)
for table_name_tuple in table_names.itertuples():
    table_name = table_name_tuple[1]
    print(table_name)
    data = pd.read_sql_query(f'select * from {table_name}', engine)
    data.to_excel(writer, sheet_name=table_name.split('_')[-1][:31], index=False)

writer.save()
writer.close()

# %%
