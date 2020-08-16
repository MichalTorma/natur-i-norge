from .dlec_type import dlec_type
from .ilec_type import ilec_type
from .mlec_type import mlec_type
from .ulec_type import ulec_type

lec_types_list = [dlec_type,ilec_type,mlec_type,ulec_type,]

def saveLecTypes(session):
    for lec_type in lec_types_list:
        session.add(lec_type)
    session.commit()