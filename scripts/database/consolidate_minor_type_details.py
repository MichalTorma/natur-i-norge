#%%
from sqlalchemy import create_engine
import model.model as model
from sqlalchemy.orm import sessionmaker
database_file = '/Users/amarok/src/natur-i-norge/naturinorge_guide/assets/nin_database.db'
engine = create_engine(f'sqlite:///{database_file}')
Session = sessionmaker(bind=engine)
session = Session()

# %%
mnts_all = session.query(model.MinorTypeScaled).all()
mnts_ids = list(set(map(lambda x: x._id ,mnts_all)))
# %%
for mnts_id in mnts_ids:
    # mnts_id = 'T1-E-1'
    print(mnts_id)
    mnts_q = session.query(model.MinorTypeScaled)\
        .filter(model.MinorTypeScaled._id == mnts_id)
    mnts = mnts_q.all()
    mnt_ids = list(set(map(lambda x: x.minorType_id, mnts)))
    detail_ids = list(set(map(lambda x: x.detail_id, mnts)))
    scale = list(set(map(lambda x: x.mappingScale_id, mnts)))
    assert len(scale) == 1
    assert len(mnt_ids) >= len(detail_ids)
    scale = scale[0]
    mnts_q.delete()
    for (idx, mnt_id) in enumerate(mnt_ids):
        detail_id = None
        try:
            detail_id = detail_ids[idx]
        except:
            pass
        session.add(model.MinorTypeScaled(
            _id=mnts_id,
            minorType_id=mnt_id,
            mappingScale_id=scale,
            detail_id=detail_id,
            is_implemented=2
        ))
    session.commit()
# %%
for mnts_id in mnts_ids:
    # print(mnts_id)
    mnts_q = session.query(model.MinorTypeScaled)\
        .filter(model.MinorTypeScaled._id == mnts_id)
    mnts_all = mnts_q.all()
    mnts = mnts_all[0]
    if len(mnts_all) == 1 and mnts.detail_id == None:
        print(mnts._id)
        mnt = session.query(model.MinorType)\
            .filter(model.MinorType._id == mnts.minorType_id).first()
        mnts.detail_id = mnt.detail_id
        session.commit()

# %%

# %%
