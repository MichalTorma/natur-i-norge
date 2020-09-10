#%%
import os
from model.model2 import Base
import model.model2 as model

from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

database_file = 'db/v003.db'
try:
    os.remove(database_file)
except:
    pass

engine = create_engine(f'sqlite:///{database_file}')

create_query = Base.metadata.create_all(engine)
session = sessionmaker(bind=engine)()

#%% create schema
import subprocess
import sadisplay
import codecs

desc = sadisplay.describe(
    [getattr(model, attr) for attr in dir(model)],
    show_methods=True,
    show_properties=True,
    show_indexes=True,
)
with codecs.open('schema.dot', 'w', encoding='utf-8') as f:
    f.write(sadisplay.dot(desc))

subprocess.getoutput('dot -Tpng schema.dot > schema.png')

# %%
import pandas as pd
path = 'tables/MasterTable.xlsx'

language = pd.read_excel(path, sheet_name='Language')
majorTypeGroup = pd.read_excel(path, sheet_name='MajorTypeGroup')
majorType = pd.read_excel(path, sheet_name='MajorType')
minorType = pd.read_excel(path, sheet_name='MinorType')
patternOfVariation = pd.read_excel(path, sheet_name='PatternOfVariation')
structuringProcess = pd.read_excel(path, sheet_name='StructuringProcess')
lEC = pd.read_excel(path, sheet_name='LEC')
lECType = pd.read_excel(path, sheet_name='LECType')
mappingScale = pd.read_excel(path, sheet_name='MappingScale')
elementarySegment = pd.read_excel(path, sheet_name='ElementarySegment')
minorTypeStandardSegment = pd.read_excel(path, sheet_name='MinorTypeStandardSegment')
minorTypeScale = pd.read_excel(path, sheet_name='MinorTypeScale')
standardSegment = pd.read_excel(path, sheet_name='StandardSegment')
# %% Language
for lang_tuple in language.iterrows():
    lang = lang_tuple[1]
    session.add(model.Language(
        _id=lang._id,
        name=lang.name
    ))
    session.commit()

# %% MajorTypeGroup
for mtg_tuple in majorTypeGroup.iterrows():
    mtg = mtg_tuple[1]
    # print(mtg)
    detail_id = f'major_type_group_details_{mtg._id}'
    mt = model.MajorTypeGroup(_id = mtg._id, detail_id = detail_id)
    session.add(mt)
    session.add(model.Detail(
        _id=detail_id,
        key='<name>',
        language_id='en',
        value=mtg['<name>|en']
    ))
    session.add(model.Detail(
        _id=detail_id,
        key='<name>',
        language_id='nb',
        value=mtg['<name>|nb']
    ))
    session.add(model.Detail(
        _id=detail_id,
        key='<description>',
        language_id='en',
        value=mtg['<description>|en']
    ))
    session.add(model.Detail(
        _id=detail_id,
        key='<description>',
        language_id='nb',
        value=mtg['<description>|nb']
    ))
    session.commit()
# %% MajorType
for mt_tuple in majorType.iterrows():
    mt = mt_tuple[1]
    desc_id = f'major_type_{mt._id}'
    session.add(
        model.MajorType(
            _id= mt._id,
            majorTypeGroup_id = mt.majorTypeGroup_id,
            order = mt.num,
            detail_id = desc_id

        )
    )
    session.add(
        model.Detail(
            _id = desc_id,
            key = '<name>',
            language_id = 'en',
            value = mt['<name>|en']
        )
    )
    session.add(
        model.Detail(
            _id = desc_id,
            key = '<name>',
            language_id = 'nb',
            value = mt['<name>|nb']
        )
    )
    session.add(
        model.Detail(
            _id = desc_id,
            key = '<description>',
            language_id = 'en',
            value = mt['<description>|en']
        )
    )
    session.add(
        model.Detail(
            _id = desc_id,
            key = '<description>',
            language_id = 'nb',
            value = mt['<description>|nb']
        )
    )
    session.commit()
# %% MinorType
for mt_tuple in minorType.iterrows():
    mt = mt_tuple[1]
    detail_id = f'minor_type_{mt._id}'
    session.add(
        model.MinorType(
            _id = mt._id,
            order = mt.order,
            majorType_id = mt.majorType_id,
            detail_id = detail_id
        )
    )
    session.add(
        model.Detail(
            _id = detail_id,
            key='<name>',
            language_id = 'en',
            value = mt['<name>|en']
        )
    )

    session.add(
        model.Detail(
            _id = detail_id,
            key='<name>',
            language_id = 'nb',
            value = mt['<name>|nb']
        )
    )

    session.add(
        model.Detail(
            _id = detail_id,
            key='Ecological characteristics',
            language_id = 'en',
            value = mt['Ecological characteristics|en']
        )
    )

    session.add(
        model.Detail(
            _id = detail_id,
            key='<name>',
            language_id = 'nb',
            value = mt['<name>|en']
        )
    )

    session.add(
        model.Detail(
            _id = detail_id,
            key='<name>',
            language_id = 'en',
            value = mt['<name>|en']
        )
    )

    session.add(
        model.Detail(
            _id = detail_id,
            key='<name>',
            language_id = 'en',
            value = mt['<name>|en']
        )
    )

    session.add(
        model.Detail(
            _id = detail_id,
            key='<name>',
            language_id = 'en',
            value = mt['<name>|en']
        )
    )

    session.add(
        model.Detail(
            _id = detail_id,
            key='<name>',
            language_id = 'en',
            value = mt['<name>|en']
        )
    )

# %%
