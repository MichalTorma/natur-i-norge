# %%
from model.model import MajorType, MajorTypeInfo

# %% T31
t31_major_type = MajorType(
    _id=31,
    majorTypeGroup_id='T',
)
t31_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t31_major_type,
    name='Boreal heath',
    description='Boreal heath includes open, semi-natural land below the climatic timberline, formed by deforestation, primarily as a result of summer farming and mining, in the 17th, 18th and 19th centuries. After deforestation, a distinctive ecosystem was formed by actively keeping the land open by clearance of shrubs and trees and low-intensity livestock grazing. The variation in species composition parallels that of forest (T4), with lime richness and risk of drought as the most important LECs, but shade-tolerant and litter-dwelling species are less prominent in boreal heath and mycorrhizal partners of forest trees are lacking. Boreal heath covers large areas in the north boreal bioclimatic zone, with decreasing areal importance towards warmer zones. Over the last decades, the management that kept boreal heaths open has ceased and boreal heaths in various stages of succession towards forest occur abundantly.',
)
t31_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t31_major_type,
    name='Boreal hei',
    description='''Boreal hei omfatter åpne hei- og på kalkrik grunn svakt engpregete, først og fremst dvergbuskdominerte natursystemer uten et dominerende tresjikt. Boreal hei er formet gjennom avskoging av fastmarksskogsmark og opprettholdelse av åpen mark gjennom rydding av kratt og trær og sommerbeite med moderat beitetrykk. Boreal hei forekommer over hele landet, med arealmessig tyngdepunkt i mellomboreal og nordboreal bioklimatisk sone i indre deler av Sør-Norge.'''
)