# %%
from .as_lec import as_lec

lec_list = [as_lec]

def saveLec(session):
    for lec in lec_list:
        session.add(lec)
    session.commit()

# %%
