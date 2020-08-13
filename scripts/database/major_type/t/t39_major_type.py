# %%
from model.model import MajorType, MajorTypeInfo

# %% T39
t39_major_type = MajorType(
    _id='T39',
    majorTypeGroup_id='T',
)
t39_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t39_major_type,
    name='Strongly altered or artificial hard substrate',
    description='Strongly altered or artificial hard substrate includes quarries, buildings and other surfaces composed of natural or artificial, e.g. synthetic, hard substrates on which colonisation proceeds slowly and is expected to continue for > 150 years. Examples of synthetic hard materials are aluminum, iron and steel, glass, some hard plastics and reinforced concrete.',
)
t39_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t39_major_type,
    name='Hard sterkt endret og ny fastmark i langsom suksesjon',
    description='''Sterkt endret og ny fastmark i langsom suksesjon omfatter blottlagt nakent berg, f.eks. gjennom omfattende inngrep (f.eks. dagbrudd), blokkdeponier (steintipper, vegfyllinger dominert av blokker etc.) og ny mark med sterkt modifiserte eller syntetiske substrater (livsmedier) som er så fast og bestandig at den koloniseres omtrent like raskt som (eller seinere enn) nakent berg. Ettersuksesjonstilstanden forventes ikke nådd i løpet av 150 år. Eksempler på materialer som resulterer i overflater som faller i denne kategorien er aluminium, jern og stål, glass, en del kunststoffer og armert betong.'''
)