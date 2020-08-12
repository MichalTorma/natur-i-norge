# %%
from model.model import MajorType, MajorTypeInfo

# %% T21
t21_major_type = MajorType(
    _id=21,
    majorTypeGroup_id='T',
)
t21_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t21_major_type,
    name='Sand dune',
    description='The sand-dune major type comprises all naturally open (treeless) parts of sand-dune systems, from unstable, bare sand to established dune meadows and heaths. Sand dunes are dynamic ecosystems formed when strong winds provide continuous supply of sand from an extensive sand source, most often marine sediments near the coast. Accordingly, sand dunes are found along the coast in moderately exposed sites, occasionally also along large rivers that run through sand-dominated glacifluvial deposits. With increasing distance from the sand source the substrate gradually stabilizes due to reduced wind speed and reduced sand supplies. Accordingly, a distinct vegetation zonation is formed, when fully developed comprising bare sandy shore, embryonal, primary, white, gray and brown dunes and dune heath. Dune slacks may arise after erosion of dune meadows down to the groundwater table. ',
)
t21_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t21_major_type,
    name='Sanddynemark',
    description='''Sanddynemark omfatter åpne områder, fortrinnsvis men ikke nødvendigvis nær kysten, med mer eller mindre ustabilt og sanddominert substrat. Sanddynemarka er et helt særpreget, dynamisk økosystem hvis funksjon er betinget av stadig tilførsel av ny sand (oftest fra havet) med sterke vinder. Større områder med sanddynemark som forekommer i tilknytning til havet framviser oftest variasjon langs en dynestabiliseringsgradient [sandstabilisering (SS)] fra stranda innover land. Langs denne gradienten, som til dels er en primærsuksesjonsgradient, avtar sandtilførselen mens substratstabiliteten og jordsmonnstjukkelsen gradvis øker. Et stykke inne på land er sanda så stabil at sanddynemarka utvikler seg til fastmarksskogsmark (dersom den ikke gjøres om til jordbruksmark gjennom hevd).'''
)