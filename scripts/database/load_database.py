# %%
from model.model import StandardSegmentElement
import pandas as pd
import codecs
import sadisplay
import subprocess
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

#  create schema

desc = sadisplay.describe(
    [getattr(model, attr) for attr in dir(model)],
    show_methods=True,
    show_properties=True,
    show_indexes=True,
)
with codecs.open('schema.dot', 'w', encoding='utf-8') as f:
    f.write(sadisplay.dot(desc))

subprocess.getoutput('dot -Tpng schema.dot > schema.png')

#  Read all the tables
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
minorTypeStandardSegment = pd.read_excel(
    path, sheet_name='MinorTypeStandardSegment')
minorTypeScale = pd.read_excel(path, sheet_name='MinorTypeScale')
standardSegment = pd.read_excel(path, sheet_name='StandardSegment')
standardSegmentElement = pd.read_excel(path, sheet_name='StandardSegmentElement')
detail = pd.read_excel(path, sheet_name='Detail')
#  Language
for lang_tuple in language.iterrows():
    lang = lang_tuple[1]
    session.add(model.Language(
        _id=lang._id,
        name=lang.name
    ))
    session.commit()

#  MajorTypeGroup
for mtg_tuple in majorTypeGroup.iterrows():
    mtg = mtg_tuple[1]
    # print(mtg)
    detail_id = f'major_type_group_details_{mtg._id}'
    mt = model.MajorTypeGroup(_id=mtg._id, detail_id=detail_id)
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
#  MajorType
for mt_tuple in majorType.iterrows():
    mt = mt_tuple[1]
    desc_id = f'major_type_{mt._id}'
    session.add(
        model.MajorType(
            _id=mt._id,
            majorTypeGroup_id=mt.majorTypeGroup_id,
            order=mt.num,
            detail_id=desc_id

        )
    )
    session.add(
        model.Detail(
            _id=desc_id,
            key='<name>',
            language_id='en',
            value=mt['<name>|en']
        )
    )
    session.add(
        model.Detail(
            _id=desc_id,
            key='<name>',
            language_id='nb',
            value=mt['<name>|nb']
        )
    )
    session.add(
        model.Detail(
            _id=desc_id,
            key='<description>',
            language_id='en',
            value=mt['<description>|en']
        )
    )
    session.add(
        model.Detail(
            _id=desc_id,
            key='<description>',
            language_id='nb',
            value=mt['<description>|nb']
        )
    )
    session.commit()
#  MinorType
for mt_tuple in minorType.iterrows():
    mt = mt_tuple[1]
    detail_id = f'minor_type_{mt._id}'
    session.add(
        model.MinorType(
            _id=mt._id,
            order=mt.order,
            majorType_id=mt.majorType_id,
            detail_id=detail_id
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            key='<name>',
            language_id='en',
            value=mt['<name>|en']
        )
    )

    session.add(
        model.Detail(
            _id=detail_id,
            key='<name>',
            language_id='nb',
            value=mt['<name>|nb']
        )
    )

    session.add(
        model.Detail(
            _id=detail_id,
            key='<ecological_characteristics>',
            language_id='en',
            value=mt['Ecological characteristics|en']
        )
    )

    session.add(
        model.Detail(
            _id=detail_id,
            key='<ecological_characteristics>',
            language_id='nb',
            value=mt['Økologisk karakteristikk|nb']
        )
    )

    session.add(
        model.Detail(
            _id=detail_id,
            key='<physiognomy>',
            language_id='en',
            value=mt['Physiognomy|en']
        )
    )

    session.add(
        model.Detail(
            _id=detail_id,
            key='<physiognomy>',
            language_id='nb',
            value=mt['Fysiognomi|nb']
        )
    )

    session.add(
        model.Detail(
            _id=detail_id,
            key='<terrain_and_aerial_photo_characteristics>',
            language_id='en',
            value=mt['Terrain and aerial photo characteristics|en']
        )
    )

    session.add(
        model.Detail(
            _id=detail_id,
            key='<terrain_and_aerial_photo_characteristics>',
            language_id='nb',
            value=mt['Terreng- og flyfotokarakteristikk|nb']
        )
    )
    session.commit()

#  Pattern of variation
for pattern_tuple in patternOfVariation.iterrows():
    pattern = pattern_tuple[1]
    detail_id = f'pattern_of_variation_{pattern._id}'
    session.add(
        model.PatternOfVariation(
            _id=pattern._id,
            detail_id=detail_id,
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            key='<name>',
            language_id='en',
            value=pattern['<name>|en']
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            key='<name>',
            language_id='nb',
            value=pattern['<name>|nb']
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            key='<description>',
            language_id='en',
            value=pattern['<description>|en']
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            key='<description>',
            language_id='nb',
            value=pattern['<description>|nb']
        )
    )
    session.commit()

#  Structuring process
for struct_process_tuple in structuringProcess.iterrows():
    sp = struct_process_tuple[1]
    detail_id = f'structuring_process_{sp._id}'
    session.add(
        model.StructuringProcess(
            _id=sp._id,
            detail_id=detail_id,
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            key='<name>',
            language_id='en',
            value=sp['<name>|en']
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            key='<name>',
            language_id='nb',
            value=sp['<name>|nb']
        )
    )
    session.commit()

#  LEC
for lec_tuple in lEC.iterrows():
    e = lec_tuple[1]
    detail_id = f'lec_{e._id}'
    session.add(
        model.LEC(
            _id=e._id,
            parentLec_id=e['parentLec_id'],
            structuringProcess_id=e['structuringProcess_id'],
            patternOfVariation_id=e['patternOfVariation_id'],
            knowledgeBaseRelations=e['knowledgeBaseRelations'],
            knowledgeBaseDivision=e['knowledgeBaseDivision'],
            spatialScale=e['spatialScale'],
            detail_id=detail_id)
    )
    session.add(
        model.Detail(
            _id=detail_id,
            language_id='en',
            key='<name>',
            value=e['<name>|en']
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            language_id='nb',
            key='<name>',
            value=e['<name>|nb']
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            language_id='en',
            key='<description>',
            value=e['<description>|en']
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            language_id='nb',
            key='<description>',
            value=e['<description>|nb']
        )
    )
    session.commit()

#  LECType
for lec_type_tuple in lECType.iterrows():
    e = lec_type_tuple[1]
    detail_id = f'lec_type_{e._id}'
    session.add(
        model.LECType(
            _id=e._id,
            detail_id=detail_id)
    )
    session.add(
        model.Detail(
            _id=detail_id,
            language_id='en',
            key='<name>',
            value=e['<name>|en']
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            language_id='nb',
            key='<name>',
            value=e['<name>|nb']
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            language_id='en',
            key='<description>',
            value=e['<description>|en']
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            language_id='nb',
            key='<description>',
            value=e['<description>|nb']
        )
    )
    session.commit()

#  MappingScale
for ms_tuple in mappingScale.iterrows():
    e = ms_tuple[1]
    session.add(
        model.MappingScale(
            _id=e._id,
            name=e['name']
        )
    )
    session.commit()

#  MinorTypeStandardSegment
for mtss_tuple in minorTypeStandardSegment.iterrows():
    e = mtss_tuple[1]
    session.add(
        model.MinorTypeStandardSegment(
            minorType_id=e['minorType_id'],
            standardSegment_id=e['standardSegment_id']
        )
    )
    session.commit()

#  MinorTypeScale
for mts_tuple in minorTypeScale.iterrows():
    e = mts_tuple[1]
    session.add(
        model.MinorTypeScaled(
            _id=e['_id'],
            minorType_id=e['minorType_id'],
            mappingScale_id=e['mappingScale_id']
        )
    )
    session.commit()

#  StandardSegment
for ss_tuple in standardSegment.iterrows():
    e = ss_tuple[1]
    detail_id = f'standard_segment_{e._id}'
    session.add(
        model.StandardSegment(
            _id=e['_id'],
            majorTypeLEC_id=e['majorTypeLEC_id'],
            detail_id=detail_id
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            language_id='en',
            key='<name>',
            value=e['<name>|en']
        )
    )
    session.add(
        model.Detail(
            _id=detail_id,
            language_id='nb',
            key='<name>',
            value=e['<name>|nb']
        )
    )
    session.commit()

#  StandardSegmentElement
for sse_tuple in standardSegmentElement.iterrows():
    e = sse_tuple[1]
    session.add(
        model.StandardSegmentElement(
            standardSegment_id = e['standardSegment_id'],
            elementarySegment_id = e['elementarySegment_id']
        )
    )
    session.commit()

#  ElementarySegment
for es_tuple in elementarySegment.iterrows():
    e = es_tuple[1]
    # detail_id = f'elementary_segment_{e._id}'
    session.add(
        model.ElementarySegment(
            _id=e._id,
            lec_id=e.lec_id,
            value=e.value,
            order=e.order,
            relative_order=e.relative_order,
            parent_id=e.parent_id,
            detail_id=e['detail_id']
        )
    )
    session.commit()


#  Detail
for detail_tuple in detail.iterrows():
    e = detail_tuple[1]
    session.add(
        model.Detail(
            _id = e['_id'],
            language_id = e['language_id'],
            key = e['key'],
            value = e['value']
        )
    )
    session.commit()

# %%
