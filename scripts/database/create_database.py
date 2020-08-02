#%%
import os
from model.model import Base
import model.model as model
from importlib import reload
from pattern_of_variation.pattern_of_variation import savePatternsOfVariation
from structuring_process.structuring_process import saveStructuringProcesses
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

# %%

database_file = 'db/v002.db'
try:
    os.remove(database_file)
except:
    pass

engine = create_engine(f'sqlite:///{database_file}')
Base.metadata.create_all(engine)

session = sessionmaker(bind=engine)()
# %%

savePatternsOfVariation(session)

#%%
saveStructuringProcesses(session)

# %%
session.query(model.PatternOfVariation).first()._id
# %%
session.rollback()

# %%
session.commit()

