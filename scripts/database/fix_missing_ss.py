#%%
import pandas as pd
from sqlalchemy import create_engine
from model import model
from sqlalchemy.orm import sessionmaker

database_file = '/Users/amarok/src/natur-i-norge/naturinorge_guide/assets/nin_database.db'
engine = create_engine(f'sqlite:///{database_file}')
Session = sessionmaker(bind=engine)
session = Session()
mt_list = session.query(model.MajorType).all()

for mt in mt_list:
    all_lec = session.query(model.MajorTypeLEC)\
        .filter(model.MajorTypeLEC.majorType_id == mt._id)\
        .filter(model.MajorTypeLEC.lecType_id.in_(['mLEC','iLEC'])).all()
    all_lec_ids = list(map(lambda x: x._id, all_lec))
    base_ss = session.query(model.StandardSegment)\
        .filter(model.StandardSegment.majorTypeLEC_id.in_(all_lec_ids))\
        .filter(model.StandardSegment.order == 0)
    assert base_ss.count() == len(all_lec)
    mnts = session.query(model.MinorType)\
        .filter(model.MinorType.majorType_id == mt._id).all()
    for mnt in mnts:

        mnt_ss = session.query(model.MinorTypeStandardSegment)\
            .filter(model.MinorTypeStandardSegment.minorType_id == mnt._id).all()
        mnt_ss_ids = list(map(lambda x: x.standardSegment_id,mnt_ss))
        mnt_ss_old = session.query(model.StandardSegment)\
            .filter(model.StandardSegment._id.in_(mnt_ss_ids)).all()
        lec_old_ids = list(map(lambda x: x.majorTypeLEC_id,mnt_ss_old))
        assert len(mnt_ss_old) == len(mnt_ss_ids)
        mnt_ss_old_lec_ids = session.query(model.MajorTypeLEC)\
            .filter(model.MajorTypeLEC._id.in_(mnt_ss_ids)).all()
        missing_ss = base_ss.filter(model.StandardSegment.majorTypeLEC_id.notin_(lec_old_ids)).all()
        print(f'{mnt._id}\nold:{mnt_ss_ids}\nmissing:{list(map(lambda x: x._id, missing_ss))}')
        assert len(set(lec_old_ids))+len(missing_ss) == base_ss.count()
        for mss in missing_ss:
            session.merge(model.MinorTypeStandardSegment(
                minorType_id=mnt._id,
                standardSegment_id=mss._id
            ))
        session.commit()

# %%
