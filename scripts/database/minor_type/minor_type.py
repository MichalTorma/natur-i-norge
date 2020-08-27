from .t.t4.t4_1 import t4_1_mt
from .t.t4.t4_10 import t4_10_mt
from .t.t4.t4_11 import t4_11_mt
from .t.t4.t4_12 import t4_12_mt
from .t.t4.t4_13 import t4_13_mt
from .t.t4.t4_14 import t4_14_mt
from .t.t4.t4_15 import t4_15_mt
from .t.t4.t4_16 import t4_16_mt
from .t.t4.t4_17 import t4_17_mt
from .t.t4.t4_18 import t4_18_mt
from .t.t4.t4_19 import t4_19_mt
from .t.t4.t4_2 import t4_2_mt
from .t.t4.t4_20 import t4_20_mt
from .t.t4.t4_3 import t4_3_mt
from .t.t4.t4_4 import t4_4_mt
from .t.t4.t4_5 import t4_5_mt
from .t.t4.t4_6 import t4_6_mt
from .t.t4.t4_7 import t4_7_mt
from .t.t4.t4_8 import t4_8_mt
from .t.t4.t4_9 import t4_9_mt

minor_type_list = [t4_1_mt,t4_10_mt,t4_11_mt,t4_12_mt,t4_13_mt,t4_14_mt,t4_15_mt,t4_16_mt,t4_17_mt,t4_18_mt,t4_19_mt,t4_2_mt,t4_20_mt,t4_3_mt,t4_4_mt,t4_5_mt,t4_6_mt,t4_7_mt,t4_8_mt,t4_9_mt]

def saveMinorTypes(session):
    for mt in minor_type_list:
        session.add(mt)
    session.commit()