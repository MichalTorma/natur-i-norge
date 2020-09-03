#%%
import os
from model.model import Base
import model.model as model
from importlib import reload
from pattern_of_variation.pattern_of_variation import savePatternsOfVariation
from structuring_process.structuring_process import saveStructuringProcesses
from lec.lec import saveLec
from lec.lec_types.lec_type import saveLecTypes
from major_type_group.major_type_group import saveMajorTypeGroup
from major_type.major_type import saveMajorTypes
from mapping_scale.mapping_scale import saveMappingScales
from minor_type.minor_type import saveMinorTypes

from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

database_file = 'db/v002.db'
try:
    os.remove(database_file)
except:
    pass

engine = create_engine(f'sqlite:///{database_file}')

create_query = Base.metadata.create_all(engine)
session = sessionmaker(bind=engine)()

savePatternsOfVariation(session)
saveStructuringProcesses(session)
saveLec(session)
saveLecTypes(session)
saveMajorTypeGroup(session)
saveMajorTypes(session)
saveMappingScales(session)
saveMinorTypes(session)
# %%
session.query(model.MajorTypeGroup).first().majorType[0].majorTypeGroup._id
# %%
dm_lec = session.query(model.LEC).filter(model.LEC._id=='DM').first()
#%%
session.query(model.ElementarySegment).filter(model.ElementarySegment.parent!=None).all()

# %%
session.commit()

