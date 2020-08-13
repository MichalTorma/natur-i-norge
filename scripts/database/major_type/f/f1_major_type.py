# %%
from model.model import MajorType, MajorTypeInfo

# %% F1
f1_major_type = MajorType(
    _id='F1',
    majorTypeGroup_id='F',
)
f1_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=f1_major_type,
    name='River and stream waterbody',
    description='This major type includes waterbodies of rivers and streams, i.e. running water. In contrast to lake water, running water is inherently dynamic and lacks permanent populations of species without swimming abilities such as planctonic crustaceans.',
)
f1_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=f1_major_type,
    name='Elvevannmasser',
    description='''Elvevannmasser omfatter økosystemer i rennende vann (lotiske systemer), det vil si ferskvannsforekomster med høy vanngjennomstrømningshastighet og kort oppholdstid, biologisk karakterisert ved mangel på en fullstendig næringskjede som inneholder krepsdyrplankton. Elvevannmassenes organismesamfunn karakteriseres først og fremst av innholdet av pelagiske, aktivt svømmende arter (nekton). Som økosystem er elvevannmassene et åpent system som stadig tilføres nytt vann med løste næringsstoffer og levende organismer og dødt organisk materiale som passivt transporteres nedover med strømmen.'''
)