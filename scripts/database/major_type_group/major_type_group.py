from .f_major_type_group import f_major_type_group
from .h_major_type_group import h_major_type_group
from .l_major_type_group import l_major_type_group
from .m_major_type_group import m_major_type_group
from .s_major_type_group import s_major_type_group
from .t_major_type_group import t_major_type_group
from .v_major_type_group import v_major_type_group

major_type_group_list = [f_major_type_group, h_major_type_group, l_major_type_group,
                         m_major_type_group, s_major_type_group, t_major_type_group, v_major_type_group, ]

def saveMajorTypeGroup(session):
    for major_type_group in major_type_group_list:
        session.add(major_type_group)
    session.commit()