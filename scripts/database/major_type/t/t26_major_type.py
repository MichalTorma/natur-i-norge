# %%
from model.model import MajorType, MajorTypeInfo

# %% T26
t26_major_type = MajorType(
    _id=26,
    majorTypeGroup_id='T',
)
t26_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t26_major_type,
    name='Glacier foreland',
    description='Glacier foreland includes the land between the current leading edge of glaciers and their maximum extent, typically demarcated by the terminal and/or lateral moraines of the Little Ice Age maximum which at the Norwegian mainland took place ca. year 1750 (later in the Norwegian Arctic). Because soil development and other ecosystem-forming processes are slow in alpine and arctic climates, glacier foreland still undergoes differentiation into other major types, primarily arctic-alpine heath and lee-side, snowbed, fen, spring and (below the timberline) forest, without yet having reached the post-successional stage.',
)
t26_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t26_major_type,
    name='Breforland og snøavsmeltingsområde',
    description='''Breforland og snøavsmeltingsområde omfatter løsmassedekkete fastmarksarealer som har smeltet fram etter lille istids maksimum, det vil for det norske fastlandet si etter ca. 1750, for norske områder i Arktis enda seinere. Fordi dannelsen av et jordsmonn tar mye lengre tid enn 200–300 år, skiller breforland og snøavsmeltingsområde seg fra historisk eldre natursystem-hovedtyper på jorddekt fastmark ved å mangle jordsmonn helt eller skiller seg ut ved at jordsmonnet er tynt og uten tydelige sjikt. Hovedtypen omfatter arealer i langsom suksesjon, der det gjennom etablerings- og konsolideringsfasen (LA∙cdef) finner sted en gradvis differensiering i retning av normale og regionalt arealmessig viktige hovedtyper, over skoggrensa først og fremst T3 Fjellhei, leside og tundra og T7 Snøleie, men også, på steder med tilførsel av stagnerende eller bevegelig vann, mot V1 Åpen jordvannsmyr, V4 Kaldkilde eller V6 Våtsnøleie og snøleiekilde. I tidlige suksesjonstrinn (initial- og koloniseringsfasen; LA∙0ab) er de breavsatte sedimentenes dominerende kornstørrelsesfordeling en viktig bestemmende faktor for hvilken retning suksesjonen etter hvert tar.'''
)