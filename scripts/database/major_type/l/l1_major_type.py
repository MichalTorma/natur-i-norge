# %%
from model.model import MajorType, MajorTypeInfo

# %% L1
l1_major_type = MajorType(
    _id=1,
    majorTypeGroup_id='L',
)
l1_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=l1_major_type,
    name='Euphotic freshwater rock',
    description='Euphotic freshwater rock includes rockwalls, outcrops and stable boulder- and stone-beds in rivers and the euphotic belt of lakes. Mosses and liverworts (Bryophyta), benthic macroscopic and microscopic green algae and several animal groups, such as dayflies (Ephemeroptera), stoneflies (Plecoptera) and caddisflies (Trichoptera), are dominant organism groups.',
)
l1_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=l1_major_type,
    name='Eufotisk fast ferskvannsbunn',
    description='''Eufotisk fast ferskvannsbunn omfatter elvebunn og innsjøbunn med stabilt bunnsubstrat og tilstrekkelig lysinnstråling til at nettofotosyntesen er positiv. Eufotisk fast ferskvannsbunn omfatter fast fjell og, i innsjøer og elver med svak strøm, også blokk- og steindominert bunn. Karplantevegetasjon mangler vanligvis. Påvekstsamfunnene domineres av moser og/eller grønnalger. Samfunn av insekter, f.eks. steinfluer (Plecoptera) og vårfluer (Trichoptera), kan forekomme.'''
)