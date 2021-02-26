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
