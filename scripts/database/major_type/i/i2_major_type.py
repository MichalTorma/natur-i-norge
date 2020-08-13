# %%
from model.model import MajorType, MajorTypeInfo

# %% I2
i2_major_type = MajorType(
    _id='I2',
    majorTypeGroup_id='I',
)
i2_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=i2_major_type,
    name='Polar sea-ice',
    description='Polar sea-ice comprises the surface of the Arctic Ocean that is permanently covered with ice, including the species that live on or in it or that have immediate contact with the lower side of the sea ice.',
)
i2_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=i2_major_type,
    name='Polar havis',
    description='''Polar havis omfatter iskappen som dekker sentrale deler av Polhavet og det livet som er direkte knyttet til denne; som lever på, i og på eller i direkte tilknytning til undersiden av denne. Den arktiske haviskappen har størst utbredelse i mars, mens havis dekker ca. 30 % av maksimalutbredelsen i september (om lag 5 mill. km2). I gjennomsnitt for de siste 30 årene har havisens utstrekning på ettersommeren krympet med ca. 1 % pr. år.
Polar havis er levested ikke bare for isbjørn (Ursus maritimus), men for en rekke spesialiserte arter som har tilhold under isen og som tidvis fryser inn i isen, f.eks. ‘isalger’ (for det meste kiselalger, men også andre algeklasser) og små krepsdyr (amfipoder).'''
)