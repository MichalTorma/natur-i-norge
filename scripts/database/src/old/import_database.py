# %%
import pandas as pd
from sqlalchemy import create_engine
from model.model import Base
import model.model as model
from src.tools.schema_creator import create_schema
from src.tools.moor_exporter import generate_moor
import os
import glob

prefix = 'nin_'
export_path = 'tables/db_export/'
database_file = '/Users/amarok/src/natur-i-norge/naturinorge_guide/assets/nin_database.db'
try:
    os.remove(database_file)
except:
    pass
engine = create_engine(f'sqlite:///{database_file}')
Base.metadata.create_all(engine)
create_schema(model)
generate_moor(engine, '/Users/amarok/src/natur-i-norge/naturinorge_guide/lib/db/schema.moor')

for f in glob.glob(f'{export_path}*.csv'):
    table_name = f.split('/')[2].split('.')[0]
    print(table_name)
    data = pd.read_csv(f)
    cols = list(data.columns)
    cols.remove('pid')
    try:
        cols.remove('Unnamed: 0')
    except:
        pass
    data = data[cols]
    data.to_sql(table_name,engine, if_exists='append', index=False)

# %%
