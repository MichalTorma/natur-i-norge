from .m.m1_major_type import m1_major_type

major_type_list = [m1_major_type]

def saveMajorTypes(session):
    for major_type in major_type_list:
        session.add(major_type)
    session.commit()