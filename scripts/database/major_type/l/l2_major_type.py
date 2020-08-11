# %%
from model.model import MajorType, MajorTypeInfo

# %% L2
l2_major_type = MajorType(
    _id=2,
    majorTypeGroup_id='L',
)
l2_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=l2_major_type,
    name='Euphotic freshwater sediment ',
    description='Euphotic freshwater sediment comprises soft sediments in rivers and lakes, ranging from predominantly inorganic (clay, silt, sand and gravel, in fast-flowing rivers also stone- and boulder-beds) to predominantly organic (dy and gyttja at the bottom of small tarns, and peat at the bottom of flark pools and hollow pools in mires). Vascular plants may occur, but sites dominated by macrohelophytes constitute a separate major type (L4). A considerable diversity of animal communities is found in this major type.',
)
l2_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=l2_major_type,
    name='Eufotisk limnisk sedimentbunn',
    description='''Eufotisk limnisk sedimentbunn omfatter elvebunn og innsjøbunn med tilstrekkelig lysinnstråling til at nettofotosyntesen er positiv, på overveiende organisk sediment, myrtorv eller på ustabilt, overveiende uorganisk bunnsediment. Eufotisk limnisk ferskvannsbløtbunn omfatter sedimenter dominert av stein i svært strømutsatte elver, samt grus og sand, silt og leirbunn i innsjøer og elver. Med unntak av de groveste substratene, som har svært sparsom vegetasjon, kan karplanter finnes (f.eks. ‘pusleplanter’ på leirbunn). Uavhengig av sediment-type inngår ikke bestander av store sumpplanter (makrohelofytter) i denne hovedtypen.'''
)