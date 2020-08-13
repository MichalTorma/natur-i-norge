# %%
from model.model import MajorType, MajorTypeInfo

# %% T42
t42_major_type = MajorType(
    _id='T42',
    majorTypeGroup_id='T',
)
t42_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t42_major_type,
    name='Landscaped patch or field',
    description='Landscaped patch or field includes flowerbeds and other regularly cultivated ground with bare soil not used for agricultural production.',
)
t42_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t42_major_type,
    name='Sterkt endret, hyppig bearbeidet fastmark med intensivt hevdpreg utenom åker',
    description='''Sterkt endret, hyppig bearbeidet fastmark med intensivt hevdpreg omfatter mark som kombinerer egenskapene ‘sterkt endret mark’, det vil si som er resultatet av ‘anlegging’ (planering, utfylling etc.), og et intensivt hevdregime med hyppig markbearbeiding, det vil si spavending av jorda, sprøyting, såing etc., men som ikke er jordbruksmark. Definisjonen beskriver ‘åker-liknende arealer’ som ikke brukes til jordbruksproduksjon, det vil si blomsterrabatter, blomsterbed og liknende.'''
)