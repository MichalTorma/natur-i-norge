# %%
import pandas as pd
from sqlalchemy import create_engine
from model.model import Base
import model.model as model
from lib.tools.schema_creator import create_schema
from lib.tools.moor_exporter import generate_moor
import os

prefix = 'nin_'
input_file = 'tables/GoldenMaster.xlsx'
database_file = 'db/v005.db'
try:
    os.remove(database_file)
except:
    pass
engine = create_engine(f'sqlite:///{database_file}')
Base.metadata.create_all(engine)
create_schema(model)
generate_moor(engine, '/Users/amarok/src/natur-i-norge/naturinorge_guide/lib/db/schema.moor')
input_excel = pd.ExcelFile(input_file)
for sheet_name in input_excel.sheet_names:
    data = pd.read_excel(input_excel, sheet_name=sheet_name)
    data.to_sql(f'{prefix}{sheet_name}',engine, if_exists='append', index=False)
# %%
