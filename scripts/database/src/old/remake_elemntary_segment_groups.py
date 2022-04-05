#%%
from sqlalchemy import create_engine
import model.model as model
from sqlalchemy.orm import sessionmaker
database_file = '/Users/amarok/src/natur-i-norge/naturinorge_guide/assets/nin_database.db'
engine = create_engine(f'sqlite:///{database_file}')
Session = sessionmaker(bind=engine)
session = Session()

# %%
major_types = session.query(model.MajorType).all()
# %%
for mt in major_types:
    lec_ids = session.query(model.MajorTypeLEC.lec_id)\
        .filter(model.MajorTypeLEC.majorType_id == mt._id).all()
    lec_ids = [x[0] for x in lec_ids]
    print(lec_ids)
    es_ids = session.query(model.ElementarySegment._id)\
        .filter(model.ElementarySegment.lec_id.in_(lec_ids)).all()
    es_ids = [x[0] for x in es_ids]
    print(es_ids)
    esgs = session.query(model.ElementarySegmentGroup)\
        .filter(model.ElementarySegmentGroup.elementarySegment_id.in_(es_ids))\
        .filter(model.ElementarySegmentGroup.majorType_id == None).all()
    print(esgs)
    for esg in esgs:
        session.merge(
            model.ElementarySegmentGroup(
                _id = esg._id,
                elementarySegment_id = esg.elementarySegment_id,
                majorType_id = mt._id
            )
        )
    session.commit()
# %%
session.query(model.ElementarySegmentGroup)\
    .filter(model.ElementarySegmentGroup.majorType_id == None).delete()
# %%
esgs = session.query(model.ElementarySegmentGroup).all()

# %%
for esg in esgs:
    es = session.query(model.ElementarySegment)\
        .filter(model.ElementarySegment._id == esg.elementarySegment_id).first()
    print(es.lec_id)
    esg.lec_id = es.lec_id
    session.commit()
# %%

sss = session.query(model.StandardSegment).all()

# %%
for ss in sss:
    print(ss._id)
    if ss.order != None:
        if ss.order == 0:
            ss.selected = 1
        else:
            ss.selected = 0

    sse = session.query(model.StandardSegmentElement)\
        .filter(model.StandardSegmentElement.standardSegment_id == ss._id).all()
    es_ids = [x.elementarySegment_id for x in sse]
    ess = session.query(model.ElementarySegment)\
        .filter(model.ElementarySegment._id.in_(es_ids)).all()
    lec_id = ess[0].lec_id
    ss.lec_id = lec_id
    mtlec = session.query(model.MajorTypeLEC)\
        .filter(model.MajorTypeLEC._id == ss.majorTypeLEC_id).first()
    ss.majorType_id = mtlec.majorType_id
    esgs = session.query(model.ElementarySegmentGroup)\
        .filter(model.ElementarySegmentGroup.majorType_id == mtlec.majorType_id)\
        .filter(model.ElementarySegmentGroup.lec_id == lec_id)\
        .filter(model.ElementarySegmentGroup.elementarySegment_id.in_(es_ids))\
        .update({'standardSegment_id': ss._id}, synchronize_session =  False)
    session.commit()
# %%
