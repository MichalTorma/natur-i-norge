# %%
from model.model import MajorType, MajorTypeInfo

# %% V2
v2_major_type = MajorType(
    _id='V2',
    majorTypeGroup_id='V',
)
v2_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v2_major_type,
    name='Mire and swamp forest',
    description='Mire and swamp forest comprises wetland forest (see T4 for definition of forest) supplied with minerogenous (geogenous) water. Important LECs are lime richness, duration of period without inundation and strength of spring-water character of the supplied water.',
)
v2_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v2_major_type,
    name='Myr- og sumpskogsmark',
    description='''Myr- og sumpskogsmark med jordvanntilførsel er den eneste normale skogsmarkshovedtypen innenfor våtmarkssystemer, og omfatter all skogsmark i våtmark med alminnelig jordvannstilførsel [vanntilførsel (VT) normalklasse VT∙0]. Innenfor hovedtypen er det en tendens til at torvakkumuleringen avtar med
økende kalkinnhold (KA), slik at kalkrike (KA∙3) matter (TV∙1) typisk har løsbunnpreg (TE∙2).'''
)