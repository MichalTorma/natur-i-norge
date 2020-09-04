#%%
import os
from model.model import Base
import model.model as model
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
# session.query(model.MajorTypeGroup).first().majorType[0].majorTypeGroup._id
# # %%
# dm_lec = session.query(model.LEC).filter(model.LEC._id=='DM').first()
# #%%
# session.query(model.ElementarySegment).filter(model.ElementarySegment.parent!=None).all()

# # %%
# session.commit()
#%% Create schema.png
import sadisplay
desc = sadisplay.describe(
    [getattr(model, attr) for attr in dir(model)],
    show_methods=True,
    show_properties=True,
    show_indexes=True,
)
import codecs
with codecs.open('schema.dot', 'w', encoding='utf-8') as f:
    f.write(sadisplay.dot(desc))

import subprocess
subprocess.getoutput('dot -Tpng schema.dot > schema.png')


# %% Export CREATE query into moor file
res = session.execute('SELECT sql FROM sqlite_master').fetchall()
with open('db/schema.moor', 'w') as f:
    for row in res:
        if row['sql'] !=  None:
            f.write(row['sql'])
            f.write(';\n')
        # print(row['sql'])


# %%
import subprocess

subprocess.getoutput('rm -f ../../naturinorge_guide/lib/db/schema.moor')
#%%
subprocess.getoutput('cp -f db/schema.moor ../../naturinorge_guide/lib/db/schema.moor')

# %%
subprocess.getoutput(f'cp {database_file} ../../naturinorge_guide/assets/nin_database.db')


# %%
