# %%
from model.model import MajorType, MajorTypeInfo

# %% T16
t16_major_type = MajorType(
    _id='T16',
    majorTypeGroup_id='T',
)
t16_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t16_major_type,
    name='Talus-slope heath and meadow',
    description='Talus-slope heath and meadow comprises naturally open (treeless) sites in talus slopes with more or less continuous vegetation cover. The dominating plant groups shift from ericaceous species in lime-poor sites (heaths) to herbs and graminoids in lime-rich sites (meadows). Establishment of trees is prevented by relatively high snow avalanche disturbance intensity.',
)
t16_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t16_major_type,
    name='Rasmarkhei og -eng',
    description='''Rasmarkhei og rasmarkeng omfatter deler av talusskråninger med stabilisert, jorddekt mark og sluttet vegetasjon med hei- eller engpreg, som oftest har betydelige likhetstrekk med T2 Åpen grunnlendt mark og T3 Fjellhei, leside og tundra. Forskjeller i artssammensetning mellom rasmarkheier og -enger og annen natur på åpen fastmark er først og fremst et resultat av regulerende forstyrrelse i form av gjentatte snøras om vinteren og utrasing av forvitringsmateriale. Forekomst av rasmarkhei og rasmarkeng innenfor en talusskråning forutsetter både forekomst av stabilisert finmateriale og aktive prosesser som hindrer utvikling av fastmarkssystemene som dominerer på ’normal’ stabil mark; det vil under skoggrensa si T4 Fastmarksskogsmark og over skoggrensa T3 Fjellhei, leside og tundra. Sorteringen av forvitringsmaterialet ved styrtgradering (se NiN[1] Artikkel 11) fører til at det ofte finnes et finmaterialrikt område oppunder bergrota. Derfor er det først og fremst der at rasmarkheier og rasmarkenger (’bergrot-enger’) forekommer. Deler av talusskråninger uten stabilisert, jorddekt mark typifiseres som T13 Rasmark.'''
)