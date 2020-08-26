from model.model import MappingScale

ms_500 = MappingScale(
    _id = 500,
    name='1:500'
)
ms_2500 = MappingScale(
    _id = 2500,
    name='1:2500'
)
ms_5000 = MappingScale(
    _id = 5000,
    name='1:5000'
)
ms_10000 = MappingScale(
    _id = 10000,
    name='1:10000'
)
ms_20000 = MappingScale(
    _id = 20000,
    name='1:20000'
)

mapping_scale_list=[ms_500, ms_2500, ms_5000, ms_10000, ms_20000]

def saveMappingScales(session):
    for ms in mapping_scale_list:
        session.add(ms)
    session.commit()