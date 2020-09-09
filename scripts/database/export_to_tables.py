# %%
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
import pandas as pd
logger = logging.getLogger()
logger.setLevel(logging.INFO)

database_file = 'db/v002.db'

engine = create_engine(f'sqlite:///{database_file}')

create_query = Base.metadata.create_all(engine)
session = sessionmaker(bind=engine)()

# %%
elementarySegments = pd.read_sql_table('nin_ElementarySegment', engine)

# %%


def convert(x):
    elem = session.query(model.ElementarySegmentInfo).filter(
        model.ElementarySegmentInfo.elementarySegment_id == x['_id']).filter(model.ElementarySegmentInfo.language_id == 'en').all()
    return dict(map(lambda x: (x.key, x.value), elem))


elementarySegments['details_en'] = elementarySegments.apply(convert, axis=1)

# %%


def convert(x):
    elem = session.query(model.ElementarySegmentInfo).filter(
        model.ElementarySegmentInfo.elementarySegment_id == x['_id']).filter(model.ElementarySegmentInfo.language_id == 'nb').all()
    return dict(map(lambda x: (x.key, x.value), elem))


elementarySegments['details_nb'] = elementarySegments.apply(convert, axis=1)
# %%


def getValue(desc, key):
    if (key in desc.keys()):
        return desc[key]
    else:
        return None


# %%
elementarySegments['<class>|en'] = elementarySegments.apply(
    lambda x: getValue(x.details_en, '<class>'), axis=1)
elementarySegments['<description>|en'] = elementarySegments.apply(
    lambda x: getValue(x.details_en, '<description>'), axis=1)
elementarySegments['<class>|nb'] = elementarySegments.apply(
    lambda x: getValue(x.details_nb, '<class>'), axis=1)
elementarySegments['<description>|nb'] = elementarySegments.apply(
    lambda x: getValue(x.details_nb, '<description>'), axis=1)

# %%


def _removeKey(d, key):
    if d == None:
        return dict()
    if key in d.keys():
        d_set = set(d)
        d_set.remove(key)
        if d_set == None:
            return dict()
        del d[key]
    return d


def getSupplement(desc):

    fixedDesc = _removeKey(desc, '<class>')
    fixedDesc = _removeKey(fixedDesc, '<description>')
    return fixedDesc


getSupplement(elementarySegments.iloc[0].details_en)
# %%
elementarySegments['other_desc_en'] = elementarySegments.apply(
    lambda x: getSupplement(x.details_en), axis=1)
elementarySegments['other_desc_nb'] = elementarySegments.apply(
    lambda x: getSupplement(x.details_nb), axis=1)
# %%
# %%
def fixKey(key):
    if key == '% organic matter' or key == '% organisk materiale':
        return '<per_organic_matter>'
    if key == 'Species accumulation index' or key == 'Artsakkumuleringsindeks':
        return '<per_organic_matter>'
    if key == 'Criterium' or key == 'Kriterium':
        return '<criterium>'
    if key == 'Depth' or key == 'Dybde':
        return '<depth>'
    if key == 'Ecological structuring process' or key == 'Økologisk strukturerende prosess':
        return '<ecological_structuring_process>'
    if key == 'Slope' or key == 'Helning':
        return '<slope>'
    if key == 'Pt/L':
        return '<pt_per_l>'
    if key == 'Temperature' or key == 'Temperatur':
        return '<temperature>'
    if key == 'Temperature increase (Δ˚C)' or key == 'Temperaturøkning (Δ˚C)':
        return '<temperature_increase>'
    if key == 'The Marine Life Information Network':
        return '<marine_life_information_network>'
    if key == 'dead weight (g/cm3)' or key == 'egenvekt (g/cm3)':
        return '<dead_weight>'
    if key == 'pH':
        return '<ph>'
    if key == 'salt concentration (‰)' or key == 'saltkonsentrasjon (‰)':
        return '<salt_concentration>'
    if key == 'total content of organic material per litre' or key == 'totalinnhold av organisk materiale per liter':
        return '<total_content_of_organic_material_per_litre>'# %%
    else:
        raise Exception(f'Unknown key: {key}')
# %%
def createDetailId(id):
    return f'elementary_segment_{id}'

def createTranslateId(id,key):
    return f'elementary_segment_{id}_{key}'
# %%
def fillDetialId(row):
    if (row.other_desc_en == {}):
        return None
    else:
        return createDetailId(row._id)

elementarySegments['detail_id'] = elementarySegments.apply(fillDetialId, axis=1)

#%%
details = []
for row in elementarySegments.itertuples():
    # print(row.other_desc_nb)
    id = createDetailId(row._1)
    for key in row.other_desc_en:
        
        details.append({
            "_id": id,
            'language_id': 'en',
            'key': key,
            'value': row.other_desc_en[key]})
        
    for key in row.other_desc_nb:
        details.append({
            "_id": id,
            'language_id': 'nb',
            'key': key,
            'value': row.other_desc_nb[key]})

# %%
details = pd.DataFrame(details)

# %%
from openpyxl import load_workbook
path = 'tables/MasterTable.xlsx'
book = load_workbook(path)
writer = pd.ExcelWriter(path, engine = 'openpyxl')
writer.book = book

elementarySegments.to_excel(writer, sheet_name='ElementarySegment')
details.to_excel(writer, sheet_name='Detail')

writer.save()
writer.close()
# %%
