from .t.t4.t4_1 import t4_1_mt

minor_type_list = [t4_1_mt]

def saveMinorTypes(session):
    for mt in minor_type_list:
        session.add(mt)
    session.commit()