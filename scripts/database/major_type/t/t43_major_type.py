# %%
from model.model import MajorType, MajorTypeInfo

# %% T43
t43_major_type = MajorType(
    _id=43,
    majorTypeGroup_id='T',
)
t43_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t43_major_type,
    name='Landscaped grassland',
    description='Landscaped grassland includes road verges, embankments, lawns, parks and similar artificial, regularly cultivated ground with a continuous grass sward, not used for agricultural production.',
)
t43_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t43_major_type,
    name='Sterkt endret, varig fastmark med intensivt preg',
    description='''Sterkt endret, varig fastmark med intensivt hevdpreg omfatter mark som kombinerer egenskapene ‘sterkt endret mark’, det vil si som er resultatet av ‘anlegging’ (planering, utfylling etc.), og et intensivt hevdregime uten hyppig markbearbeiding, det vil si at marka gjødsles, sprøytes, tilsås etc., men ikke jevnlig pløyes opp, spa- vendes, el.l. Hovedtypen omfatter ikke jordbruksmark; definisjonen beskriver ‘arealer som likner på varig oppdyrket eng’ men som ikke brukes til jordbruksproduksjon. Typiske eksempler er plener og parker.'''
)