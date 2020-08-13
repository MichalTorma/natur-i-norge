# %%
from model.model import MajorType, MajorTypeInfo

# %% T32
t32_major_type = MajorType(
    _id='T32',
    majorTypeGroup_id='T',
)
t32_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t32_major_type,
    name='Semi-natural grassland',
    description='Semi-natural grassland includes meadows formed by forest clerarance followed by livestock grazing and/or haymaking, subject to the additional condition of neither being ploughed nor seeded nor heavily fertilised. The vegetation is dominated by graminoids and herbs, while nitrophilous species are not prominent. Semi-natural grassland may be open (treeless) or, also when actively managed, have an open tree layer (wooded or coppice meadows). Land management intensity, lime richness and risk of drought are the most important LECs. Since the middle of the 20th century, traditional use of semi-natural grasslands has decreased and conversion into arable fields, agriculturally improved grassland or abandonment has taken place.',
)
t32_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t32_major_type,
    name='Semi-naturlig eng',
    description='''Semi-naturlig eng omfatter engpregete, åpne eller tresatte økosystemer som er formet gjennom ekstensiv (’tradisjonell’) hevd (beite og slått, eller oftest en kombinasjon av beite og slått) og bruk til jordbruksproduksjon gjennom lang tid, ofte hundrer av år. Marka i semi-naturlig eng kan, men behøver ikke, være ryddet for stein. Semi-naturlig eng omfatter arealenheter som ikke har synlige fysiske spor etter pløying eller tilsåing med for- og matvekster og som mangler eller bare har svake spor etter gjødsling og/eller sprøyting. Semi-naturlig eng kan huse et stort mangfold av arter fra mange organismegrupper, særlig karplanter, sopp og insekter.'''
)