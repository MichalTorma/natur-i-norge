# %%
from model.model import MajorType, MajorTypeInfo

# %% T40
t40_major_type = MajorType(
    _id=40,
    majorTypeGroup_id='T',
)
t40_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t40_major_type,
    name='Strongly altered ground with semi-natural grassland character',
    description='Strongly altered ground with semi-natural grassland character comprises surficial soil, gravel, silt, sand or clay deposits (typically belonging to T35) which, after several decades of grazing, hay-making or similar extensive management has developed visual similarity with, and a species composition that contains many species typical of, semi-natural grassland (T32).',
)
t40_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t40_major_type,
    name='Sterkt endret fastmark med preg av semi-naturlig eng',
    description='''Sterkt endret fastmark med preg av semi-naturlig eng omfatter mark som kombinerer egenskapene ‘sterkt endret mark’, det vil si som er resultatet av planering, utfylling el.l., og et ekstensivt hevdregime, det vil si at marka gjennom forholdsvis lang tid (i hvert fall noen tiår) er slått eller beitet som om det var en semi-naturlig eng og derfor har trekk i artssammensetning og utseende som overfladisk minner om semi-naturlig eng. Denne hovedtypen omfatter arealenheter som ikke er tidligere jordbruksmark og som derfor ikke har en historie som ‘tradisjonell’ beite- eller slåttemark. Dette vises oftest tydelig i artssammensetning, plassering i forhold til omgivelsene (ikke del av gard og ikke omgitt av jordbruksmark), og innhold av objekter (mangel på kulturhistoriske referanser som steingjerder, rydningsrøyser etc.). Sterkt endret fastmark med preg av semi- naturlig eng omfatter utfylte og oppbygde vegkanter og vegskjæringer som slås, men ikke sprøytes, flyplasser, plener som skjøttes som ‘blomsterenger’ etc. Artsrike vegkanter, som for størstedelen tilhører denne hovedtypen, kan huse et stort artsmangfold og være viktige som refugium for arter med optimum i semi-naturlige enger og som nå er i tilbakegang (Auestad et al. 1999, 2011).'''
)