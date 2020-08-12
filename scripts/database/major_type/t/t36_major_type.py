# %%
from model.model import MajorType, MajorTypeInfo

# %% T36
t36_major_type = MajorType(
    _id=36,
    majorTypeGroup_id='T',
)
t36_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t36_major_type,
    name='Drained wetland and terrestrialised freshwater sediment',
    description='Drained wetland and terrestrialised freshwater sediment includes terrestrial ground originating by drainage of fens, bogs and mire and swamp forests, or by terrestrialisation of former sediment-beds of rivers and lakes. After establishment, drained wetland and terrestrialised freshwater sediment typically undergo rapid succession.',
)
t36_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t36_major_type,
    name='Ny fastmark på tidligere våtmark og ferskvannsbunn',
    description='''Hovedtypen omfatter irreversibelt drenerte og gjennomgripende endrete våtmarkssystemer på (tidligere) torvmark (åpne myrer, myrskogsmarker etc.), der torvnedbrytningen og endringene i det hydrologiske systemet er så omfattende at definisjonen av våtmarkssystem ikke lenger er tilfredsstilt slik at arealenheten har blitt et sterkt endret fastmarkssystem, samt tørrlagt elveleie og innsjøbunn på sedimenter slik at det ligger til rette for rask suksesjon. Tydelige spor etter arealenhetens historie som tidligere torvmark eller ferskvannssystem finnes fortsatt, f.eks. ved forekomsten av dyp, omdannet torvjord, innsjø- og elvesedimenter etc., og, for torvmarkssystemers vedkommende, at en del av våtmarkenes artssammensetning fortsatt finnes som restpopulasjoner. Det høye innholdet av organisk materiale i substratet gjør at en ettersuksesjonstilstand kan forventes nådd i løpet av (100–)150 år etter en rask suksesjon.
Av disse grunnene, men også av hensyn til arealstatistikk, skal drenert tidligere våtmark og ferskvannsbunn oppfattes som grunntyper innenfor en egen natursystem-hovedtype i NiN, tilordnet fastmarkssystemer. Hovedtypen omfatter svært stor og områdespesifikk variasjon i type inngrep, historie og dermed også artssammensetning.'''
)