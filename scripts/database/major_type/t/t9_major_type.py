# %%
from model.model import MajorType, MajorTypeInfo

# %% T9
t9_major_type = MajorType(
    _id='T9',
    majorTypeGroup_id='T',
)
t9_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t9_major_type,
    name='Moss tundra',
    description='Moss tundra includes moss-dominated land on permafrost in the Arctic, more or less influenced by lightly manuring by birds and/or Svalbard reindeer. Typically, moss tundra has a continuous layer of large, relatively fast-growing mosses that grow directly on top of permafrost layers. Moss tundra often occurs on slopes adjacent to bird cliffs.',
)
t9_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t9_major_type,
    name='Mosetundra',
    description='''Mosetundra omfatter særpreget arktisk natur som er betinget av kombinasjonen av permafrost og naturlig gjødsling. Mosetundra kjennetegnes ved sammenhengende matter av store, relativt hurtigvoksende moser som ligger direkte på et permafrostlag 20–40 cm under moseoverflata, og som, i motsetning til våtmarkssystemer, mangler et fritt grunnvannsspeil i det aktive laget. Mosetundra er et torvdannende system (IO∙0a som dLKM). Mosetundra gjødsles vanligvis av fugl, men på Svalbard finnes dessuten en spesiell type mosetundra på steder med høy tetthet av stasjonær svalbardrein. Den mest typiske mosetundraen finnes i skråninger med 5–30° helning under (større) fuglefjell i den nordarktiske bioklimatiske sonen på Svalbard.'''
)