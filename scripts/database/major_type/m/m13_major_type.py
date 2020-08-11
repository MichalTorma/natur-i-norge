# %%
from model.model import MajorType, MajorTypeInfo

# %% M13
m13_major_type = MajorType(
    _id=13,
    majorTypeGroup_id='M',
)
m13_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m13_major_type,
    name='Anoxic marine sediment',
    description='Anoxic marine sediment occurs in fjords and estuaries where restricted water exchange, often also lack of circulation, result in periodically (hypoxic) or permanently oxygen-free (anoxic) conditions near the bottom. Organisms adapted to anaerobic conditions prevail.',
)
m13_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m13_major_type,
    name='Marin sedimentbunn preget av oksygenmangel',
    description='''Marin sedimentbunn preget av oksygenmangel omfatter bunnsystemer i fjorder og poller der mangelfull vannsirkulasjon fører til permanent oksygenfrie (anoksiske) bunnforhold. Fordi anoksiske forhold forutsetter mangelfull vannsirkulasjon, er anoksisk saltvannsbunn først og fremst assosiert med lav vannbevegelse og domineres derfor av sedimentbunn, men kombinasjonen av anoksiske forhold og fast bunn forekommer også. Permanent anoksisk saltvannsbunn har en særpreget artssammensetning fordi artene som lever der må kunne tolerere (eller foretrekke) oksygenfrie forhold. Framvaren (Farsund, Vest-Agder) er et klassisk eksempel på en vannforekomst dominert av anoksisk sedimentbunn. Periodisk og permanent anoksi forårsaker først og fremst reduksjon i artstilfang og artsrikdom, men noen spesialtilpassete arter kommer også til, f.eks. svovelbakterier.'''
)