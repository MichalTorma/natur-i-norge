# %%
from model.model import MajorType, MajorTypeInfo

# %% F2
f2_major_type = MajorType(
    _id=2,
    majorTypeGroup_id='F',
)
f2_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=f2_major_type,
    name='Circulating lake waterbody',
    description='Circulating lake waterbodies include waters of mictic lakes, tarns and ponds, with their pelagic communities. Most Norwegian lakes above a certain minimum size are dimictic, i.e. with full circulation of water masses every spring and autumn.',
)
f2_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=f2_major_type,
    name='Sirkulerende innsjøvannmasser',
    description='''Sirkulerende innsjøvannmasser omfatter økosystemer i stillestående vann (lentiske systemer), det vil si ferskvannsforekomster med lav vanngjennomstrømningshastighet og lang oppholdstid eller mer eller mindre uten vanngjennomstrømning, biologisk karakterisert ved forekomst av en fullstendig næringskjede som inneholder krepsdyrplankton. Sirkulerende innsjøvannmassers organismesamfunn inneholder pelagiske organismer, både aktivt svømmende (nekton) og passivt flytende arter (plankton), samt organismer som lever i og på vannoverflata (neuston). Som økosystem er sirkulerende innsjøvannmasser et delvis lukket system. Vann med løste næringsstoffer og levende organismer og dødt organisk materiale tilføres fra omgivelsene og avgis, dersom innsjøen er forbundet med et større vassdrag gjennom en utløpsbekk, til andre vannforekomster. To ganger i året, under vår- og høstsirkulasjonen, finner det sted en fullstendig omrøring av vann fra ulike dyp, som blant annet fornyer bunnvannets oksygen.'''
)