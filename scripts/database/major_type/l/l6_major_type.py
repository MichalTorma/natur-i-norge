# %%
from model.model import MajorType, MajorTypeInfo

# %% L6
l6_major_type = MajorType(
    _id=6,
    majorTypeGroup_id='L',
)
l6_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=l6_major_type,
    name='Anoxic freshwater sediment',
    description='Anoxic freshwater sediment borders on oxygen-free, stagnant bottom waters of deep meromictic lakes. Sediments adjacent to periodically anoxic or oxygen-reduced (hypoxic) bottom waters, which also have a species composition that differs substantially from that of normal, circulating (mictic) lakes, are also included in this major type. While anoxia causes a general reduction of species richness, some organisms, e.g. sulphur bacteria, are adapted to life in oxygen-poor environments.',
)
l6_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=l6_major_type,
    name='Afotisk limnisk sedimentbunn preget av oksygenmangel',
    description='''Afotisk limnisk sedimentbunn preget av oksygenmangel omfatter bunnsystemer i meromiktiske innsjøer (innsjøer uten utskifting av bunnvannet, det vil si med permanent stagnerende bunnvann) samt bunnsystemer i innsjøer der forholdene nær bunnen er anoksiske i perioder som er lange nok til at artssammensetningen er vesentlig endret (ved bl.a. fiskedød) i forhold til normal innsjøbunn. Anoksi forårsaker først og fremst reduksjon i artstilfang og artsrikdom, men noen spesialtilpassete arter kommer også til, f.eks. svovelbakterier'''
)