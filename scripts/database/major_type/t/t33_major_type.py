# %%
from model.model import MajorType, MajorTypeInfo

# %% T33
t33_major_type = MajorType(
    _id=33,
    majorTypeGroup_id='T',
)
t33_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t33_major_type,
    name='Semi-natural tidal and salt meadow',
    description='Semi-natural tidal and salt meadow comprises open (treeless), sea water-influenced graminoid- and herb-dominated meadows in the upper geolittoral and supralittoral tidal belts. This major type is developed from tidal and salt meadows (T12) by extensive long-term management, typically livestock grazing, which has prevented regrowth succession into forest. With decreasing sea-salt influence during land upheaval, this major type gradually transgresses into semi-natural grassland (T32).',
)
t33_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t33_major_type,
    name='Semi-naturlig strandeng',
    description='''Semi-naturlig strandeng omfatter åpne, engpregete økosystemer i øvre del av fjærebeltet (midtre-øvre geolitoral og supralitoral), som er formet gjennom ekstensiv (’tradisjonell’) hevd (oftest beite, men også enkelte steder slått) og bruk til jordbruksproduksjon gjennom lang tid, ofte hundrer av år. Semi-naturlig strandeng omfatter arealenheter som ikke har synlige fysiske spor etter pløying eller tilsåing med for- og matvekster og som mangler eller bare har svake spor etter gjødsling og/eller sprøyting. Semi-naturlig strandeng skiller seg fra T32 Semi-naturlig eng ved markant innslag av salttolerante arter (halofytter) og fra T12 Strandeng ved sterkt innslag av arter typisk for semi-naturlig mark). Opphør av bruk gjør nå at semi-naturlig strandeng mange steder, særlig i Sør-Norge der takrør (Phragmites australis) er en aggressiv innvandrer. Semi-naturlige strandenger gjennomgår der mange steder suksesjon til en reinbestand av takrør som i løpet av få tiår helt kan mangle spor etter tidligere hevd. Ettersuksesjonstilstanden kan være en åpen takrør-dominert strandeng, eller etter forsumping, en helofytt-saltvannssump eller en strandsumpskog.'''
)