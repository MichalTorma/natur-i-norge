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
segments_table.major_type = segments_table.major_type.apply(lambda x: x.strip())
minor_types_table = pd.read_excel('tables/MinorTypes.xlsx', sheet_name="MinorTypes")
major_types = list(set(list(segments_table.major_type)))

#%%
minor_types_table.standard_segments = minor_types_table.standard_segments.apply(lambda x: x.replace(' ','')
    .replace('*','')
    .replace('∙','-'))
def get_minor_type(minor_type):
    major_type = minor_type.major_type
    major_type_nh = major_type.replace('-','')
    order = minor_type.order
    name_string = minor_type['name']
    name = None
    desc = None
    if '[' in name_string:
        desc = name_string.split('[')[0]
        name = name_string.split('[')[1].split(']')[0]
    else:
        name = name_string

    mt_id=f'{major_type_nh}-{order}'
    detail_id=f'minor_type_{mt_id}'
    session.merge(
        model.MinorType(
            _id=mt_id,
            majorType_id=major_type,
            detail_id=detail_id
        )
    )
    session.merge(
        model.Detail(
            _id=detail_id,
            language_id='nb',
            key='__name__',
            value=name
        )
    )
    if desc != None:
        session.merge(
            model.Detail(
            _id=detail_id,
            language_id='nb',
            key='__description__',
            value=desc
        )
        )
    session.merge(
        model.MinorTypeScaled(
            _id=f'{major_type_nh}-{order}',
            minorType_id=mt_id,
            mappingScale_id=500
        )
    )
    session.merge(
        model.MinorTypeScaled(
            _id=f'{major_type_nh}-B-{order}',
            minorType_id=mt_id,
            mappingScale_id=2500
        )
    )
    session.merge(
        model.MinorTypeScaled(
            _id=f'{major_type_nh}-C-{order}',
            minorType_id=mt_id,
            mappingScale_id=5000
        )
    )
    session.merge(
        model.MinorTypeScaled(
            _id=f'{major_type_nh}-D-{order}',
            minorType_id=mt_id,
            mappingScale_id=10000
        )
    )
    session.merge(
        model.MinorTypeScaled(
            _id=f'{major_type_nh}-E-{order}',
            minorType_id=mt_id,
            mappingScale_id=20000
        )
    )
    session.commit()
    print(f'{major_type}-{order}')
    ss_string = minor_type.standard_segments
    ss_list = ss_string.split('&')
    used_lec = []
    for ss_single_string in ss_list:
        ss_single_list = ss_single_string.split('-')
        lec_id = ss_single_list[0]
        if lec_id == 'HS':
            lec_id = f'HS-{major_type_nh}'
        if lec_id == 'SI':
            lec_id = 'S1'
        used_lec.append(lec_id)
        if len(ss_single_list) == 3:
            order_list = list(range(int(ss_single_list[1]),int(ss_single_list[2])))
            ss_orders_list = list(map(lambda x: str(x), order_list))
        elif len(ss_single_list) == 2:
            ss_orders_string = ss_single_list[1]
            ss_orders_list = ss_orders_string.split(',')
        else:
            raise Exception(f'unable to parse ss_single_list: {ss_single_list}')
        assert lec_id != None

        if not ss_orders_list[0].isnumeric():
            if ss_orders_list[0].isupper():
                mp = {
                    'A': 1,
                    'B': 2,
                    'C': 3,
                    'D': 4,
                    'E': 5,
                    'F': 6,
                    'G': 7,
                    'H': 8,
                }
                new_orders_list = []
                for order in ss_orders_list:
                    new_orders_list.append(mp[order])
                ss_orders_list = new_orders_list
            else:
                es_list=[]
                for es_string in ss_orders_list[0]:
                    q = session.query(model.ElementarySegment)\
                        .order_by(model.ElementarySegment.order)\
                        .filter(model.ElementarySegment.lec_id == lec_id)\
                        .filter(model.ElementarySegment.value == es_string)
                    assert q.count() == 1
                    es_list.append(q.first()._id)
                # print(es_list)
                q = session.query(model.StandardSegmentElement)\
                    .filter(model.StandardSegmentElement.elementarySegment_id.in_(es_list))
                ss_ids = list(set(map(lambda x: x.standardSegment_id, q.all())))
                # print(ss_ids)
                q = session.query(model.StandardSegment)\
                    .filter(model.StandardSegment._id.in_(ss_ids))\
                    .filter(model.StandardSegment.majorTypeLEC_id == f'{major_type_nh}-{lec_id}')\
                    .order_by(model.StandardSegment.order)
                ss_orders_list = list(set(map(lambda x: x.order + 1,q.all())))

                # print(ss_orders_list)
        for ss_order in ss_orders_list:
            ss_order_int = int(ss_order)
            if lec_id.split('-')[0]=='HS':
                mtl_id = lec_id
            else:
                mtl_id = f'{major_type_nh}-{lec_id}'
            # print(f'mtl_id: {mtl_id} order: {ss_order_int}')
            q = session.query(model.StandardSegment)\
                .filter(model.StandardSegment.majorTypeLEC_id == mtl_id)\
                .filter(model.StandardSegment.order == ss_order_int-1)

            try:
                assert q.count() == 1
            except:
                raise Exception(f'Error on mtl_id: {mtl_id} order: {ss_order_int-1}')

            ss = q.first()
            session.merge(
                model.MinorTypeStandardSegment(
                    minorType_id=mt_id,
                    standardSegment_id=ss._id
                )
            )
        session.commit()

    # fill unused lec with first of each unused


# minor_type = minor_types_table.iloc[0]
for (_,mt) in minor_types_table.iterrows():
    get_minor_type(mt)

# %%
# %%
def get_axis(order, lec_type):
    if lec_type not in [1,2]:
        return None
    axis = order
    if axis > 2:
        axis = 2
    return axis

def get_lec_type_string(lec_type):
    if lec_type == 0:
        return 'dLEC'
    if lec_type == 1:
        return 'mLEC'
    if lec_type == 2:
        return 'iLEC'
    if lec_type == 3:
        return 'uLEC'
    else:
        raise Exception(f'Unknown lec type: {lec_type}')

def save_hs(major_type, ss_string, lec_type, axis):
    major_type_nh = major_type.replace('-','')
    lec_id = f'HS-{major_type_nh}'
    session.merge(model.LEC(
        _id=lec_id,
        parentLec_id='HS',
    ))

    ss_list = ss_string.split('|')
    for (ss_order, ss) in enumerate(ss_list):
        es_id = f'{lec_id}.{ss}'
        session.merge(
            model.ElementarySegment(
                _id = es_id,
                lec_id=lec_id,
                value=ss,
                order=ss_order
            )
        )

        session.merge(
            model.ElementarySegmentGroup(
                _id=es_id,
                elementarySegment_id=es_id
            )
        )
    session.commit()



def get_LKM(major_type, lec_type):
    table = segments_table[segments_table.major_type == major_type]
    table.standard_segments = table.standard_segments.apply(lambda x: x.replace(' ','')
            .replace('(','')
            .replace(')','')
            .replace('∙','.'))
    print(major_type)
    lkm_strings = table.standard_segments[table.lec_type == lec_type]

    if len(lkm_strings) == 0:
        print('No gradients to import, skiping...')
        return
    lkm_list = ';'.join(list(lkm_strings)).replace(';;',';').split(';')
    assert len(lkm_list) > 0
    # print(lkm_strings)
    for (lkm_order, lkm_ss) in enumerate(lkm_list):
        axis = get_axis(lkm_order, lec_type)
        print(lkm_ss)
        if lkm_ss == '':
            continue
        gradient = lkm_ss.split('–')[0]
        ss_string = lkm_ss.split('–')[1]

        if gradient not in ['S1']:
            if gradient[-1].isnumeric():
                gradient = gradient[:-1]
            if gradient in ['E','F','S']:
                mp = {
                    'E': 'S3E',
                    'F': 'S3F',
                    'S': 'S3S',
                }
                gradient = mp[gradient]

        if gradient == 'HS*':
            save_hs(major_type, ss_string, lec_type, axis)
            lec_id = f'{major_type}-HS'
            lec_id = f'HS-{major_type.replace("-","")}'
            mtl_id = lec_id
        else:
            ss_string = ss_string.lower()
            lec_id = gradient
            mtl_id = f'{major_type.replace("-","")}-{lec_id}'
        print(lec_id)
        # print(lkm_order)
        # save majorTypeLEC



        session.merge(
            model.MajorTypeLEC(
                _id=mtl_id,
                lec_id=lec_id,
                majorType_id=major_type,
                lecType_id=get_lec_type_string(lec_type),
                axis=axis
            )
        )


        # save ss and sse
        ss_strings_list = ss_string.split('|')
        for (ss_order, ss_string) in enumerate(ss_strings_list):
            ss_id = f'{major_type.replace("-","")}-{lec_id}.{ss_string}'
            session.merge(
            model.StandardSegment(
                _id=ss_id,
                majorTypeLEC_id=mtl_id,
                order=ss_order,
                )
            )
            for (es_order, es_string) in enumerate(ss_string):
                es_id = f'{lec_id}.{es_string}'
                session.merge(
                model.StandardSegmentElement(
                    standardSegment_id=ss_id,
                    elementarySegment_id=es_id,
                )
        )


        session.commit()
# get_LKM('H-4', 2)
for mt in major_types:
    get_LKM(mt, 1)
    get_LKM(mt, 2)
    get_LKM(mt, 3)

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
