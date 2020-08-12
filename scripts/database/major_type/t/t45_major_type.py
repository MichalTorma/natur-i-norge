# %%
from model.model import MajorType, MajorTypeInfo

# %% T45
t45_major_type = MajorType(
    _id=45,
    majorTypeGroup_id='T',
)
t45_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t45_major_type,
    name='Agriculturally improved grassland',
    description='Agriculturally improved grassland includes more or less permanent grassland, managed for fodder production by regular resowing, application of commercial fertiliser, slurry and/or pesticides. Ploughing may be carried out at irregular intervals. A natural flora of perennial and annual weeds typically occurs.',
)
t45_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t45_major_type,
    name='Oppdyrket varig eng',
    description='''Oppdyrket varig eng omfatter jordbruksmark preget av intensiv hevd uten hyppig markbearbeiding, det vil si at mark som gjødsles, sprøytes, tilsås etc., men ikke jevnlig pløyes opp. Oppdyrket varig eng omfatter dermed innmarksarealer som over lengre tid benyttes til dyrking av grasvekster og som ikke inngår i regelmessig rotasjon med korn eller andre ettårige jordbruksvekster (‘permanent kultureng’; Norderhaug et al. 1999, se også NiN[1] Artikkel 26 for drøfting av engbegreper). Oppdyrket varig eng kan nyttes til beite eller graset kan høstes (slås og tørkes på marka eller hesjes, legges i silo eller pakkes i plast). Oppdyrket varig eng omfatter betydelig variasjon i hevdintensitet, relatert først og fremst til omfanget av sprøyting og gjødsling, samt gjødseltype og måten gjødselen spres.'''
)