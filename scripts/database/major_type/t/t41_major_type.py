# %%
from model.model import MajorType, MajorTypeInfo

# %% T41
t41_major_type = MajorType(
    _id=41,
    majorTypeGroup_id='T',
)
t41_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t41_major_type,
    name='Agriculturally improved grassland with semi-natural character',
    description='Agriculturally improved grassland with semi-natural character comprises old fields, i.e. former fields (T44) and agriculturally improved grassland (T45) that, due to extensive management (livestock grazing, haymaking etc.) for several decades have developed a superficial visual similarity with, and a species composition that contains many species typical of, semi-natural grassland (T32).',
)
t41_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t41_major_type,
    name='Oppdyrket mark med preg av seminaturlig eng',
    description='''Oppdyrket mark med preg av semi-naturlig eng omfatter sterkt endret jordbruksmark, det vil si arealer som har vært gjenstand for intensiv hevd, men som i forholdsvis lang tid (i hvert fall noen tiår) er slått eller beitet som om det var en semi-naturlig eng og derfor har trekk i artssammensetning og utseende som overfladisk minner om semi-naturlig eng. Denne hovedtypen omfatter jordbruksmark som har en historie som åker eller oppdyrket varig eng, men som av en eller annen grunn, fra et gitt tidspunkt, er omdisponert til ‘tradisjonell’ beite- eller slåttemark. Oppdyrket mark med preg av semi-naturlig eng inngår som del av gard (eller tidligere gard), kan være omgitt av jordbruksmark, og kan inneholde kulturhistoriske referanser som steingjerder, rydningsrøyser etc. Ofte forekommer oppdyrket mark med preg av semi-naturlig eng som lett identifiserbare rektangulære felter i semi-naturlig eng, typisk med en artssammensetning som er mindre artsrik, som mangler mange arter typisk for semi-naturlig eng og/eller med avvikende dominansforhold, f.eks. dominert av arter karakteristisk for tidlige gjengroingsstadier etter opphør av bruk av åker eller oppdyrket varig eng, f.eks. hundekjeks (Anthriscus sylvestris) eller skogstorkenebb (Geranium sylvaticum).'''
)