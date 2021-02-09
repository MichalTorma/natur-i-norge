#%%
import pandas as pd
from sqlalchemy import create_engine
from model import model
from sqlalchemy.orm import sessionmaker

database_file = '/Users/amarok/src/natur-i-norge/naturinorge_guide/assets/nin_database.db'
engine = create_engine(f'sqlite:///{database_file}')
Session = sessionmaker(bind=engine)
session = Session()
segments_table = pd.read_excel('tables/MinorTypes.xlsx', sheet_name="MajorTypeSegments")
minor_types_table = pd.read_excel('tables/MinorTypes.xlsx', sheet_name="MinorTypes")
major_types = list(set(list(segments_table.major_type)))

major_type = major_types[0]
table = segments_table[segments_table.major_type == major_type]
table.standard_segments = table.standard_segments.apply(lambda x: x.replace(' ','')
        .replace('(','')
        .replace(')','')
        .replace('∙','.'))
lec_type = 3
lkm_strings = table.standard_segments[table.lec_type == lec_type]

# %%
lkm_list = ';'.join(list(lkm_strings)).replace(';;',';').split(';')
assert len(lkm_list) > 0
lkm_ss = lkm_list[0]
#%%
gradient = lkm_ss.split('–')[0]
ss_string = lkm_ss.split('–')[1]
#%%

# %%
# %%
def get_dLKM(major_type):
    table = segments_table[segments_table.major_type == major_type]
    table.standard_segments = table.standard_segments.apply(lambda x: x.replace(' ','')
        .replace('(','')
        .replace(')','')
        .replace('∙','.'))
    dLKM_string = table.standard_segments[table.lec_type == 0]
    if len(dLKM_string) == 0:
        print("No dLKM defined, skipping...")
        return
    dLKM_string = dLKM_string.iloc[0]
    dLKM_list = dLKM_string.split('&')
    # dLKM_item = dLKM_list[0]
    for dLKM_item in dLKM_list:
        dLKM_gradient = dLKM_item.split('.')[0]
        dLKM_segments_string = dLKM_item.split('.')[1]
        # print(dLKM_segments_string)
        es_q = session.query(model.ElementarySegment).filter(model.ElementarySegment.lec_id == dLKM_gradient)
        if es_q.count() == 0:
            raise Exception(f'Not yet imported elementary segments for {dLKM_gradient}')
        es_start = es_q.filter(model.ElementarySegment.value == dLKM_segments_string[0]).first()
        assert(es_start != None)
        es_end = es_start
        if(len(dLKM_segments_string) == 2):
            es_end = es_q.filter(model.ElementarySegment.value == dLKM_segments_string[1]).first()
            assert(es_end != None)
        if(len(dLKM_segments_string) > 2):
            raise Exception(f'wrong number of leters in dLKM definition major_type: {major_type} string:{dLKM_segments_string}')

        dLKM_es_q =es_q.filter(model.ElementarySegment.order >= es_start.order).filter(model.ElementarySegment.order <= es_end.order)
        dLKM_es = dLKM_es_q.order_by(model.ElementarySegment.order).all()
        assert len(dLKM_es) > 0
        # add majorTypeLec
        major_type_nh = major_type.replace('-','')
        mtl_id = f'{major_type_nh}-{dLKM_gradient}'
        session.merge(model.MajorTypeLEC(
            _id=mtl_id,
            lec_id=dLKM_gradient,
            majorType_id=major_type,
            lecType_id='dLEC',
        ))
        session.commit()
        es_id_list = []
        for es in dLKM_es:
            es_id_list.append(es.value)
        es_ids_string = ''.join(es_id_list)
        ss_id = f'{major_type_nh}-{dLKM_gradient}.{es_ids_string}'
        session.merge(model.StandardSegment(
            _id=ss_id,
            majorTypeLEC_id=mtl_id,
            ))
        session.commit()
        for es in dLKM_es:
            session.merge(model.StandardSegmentElement(
                standardSegment_id=ss_id,
                elementarySegment_id=es._id
            ))
            session.commit()
# save elementary segments to MajorTypeLec
# %%
for major_type in major_types:
    print(major_type)
    # try:
    get_dLKM(major_type)
    # except Exception as e:
    #     print('Error')
    #     print(e)
# %%
get_dLKM('L-1')
# %%
