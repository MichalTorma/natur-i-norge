# %%
import model
import importlib
from sqlalchemy import Table, Text, Integer, create_engine
# %%
sql_file = './sql/create_dump.sql'
sql_dump = open(sql_file, 'w+')
def metadata_dump(sql, *multiparams, **params):
    # print or write to log or file etc
    query = sql.compile(dialect=engine.dialect)
    sql_dump.write(str(query))

engine = create_engine('sqlite://', echo=True, strategy='mock', executor=metadata_dump)
##
importlib.reload(model)
from model import Base
Base.metadata.create_all(engine)
sql_dump.close()
##
