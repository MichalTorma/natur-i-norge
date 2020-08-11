# %%
from model.model import MajorType, MajorTypeInfo

# %% L7
l7_major_type = MajorType(
    _id=7,
    majorTypeGroup_id='L',
)
l7_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=l7_major_type,
    name='Strongly altered or artificial hard freshwater substrate',
    description='Strongly altered or artificial hard freshwater substrate includes substrates that are altered by human actions or new, e.g. concrete, glass and steel. This major type includes permanent or temporary constructions such as quays, piers, hydropower dams and plants and bridge foundations and irreversibly changed former terrestrial land such as reservoir embankments.',
)
l7_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=l7_major_type,
    name='Sterkt endret eller ny fast ferskvannsbunn',
    description='''Sterkt endret fast ferskvannsbunn omfatter hovedsakelig ferskvannsbunn som er vesentlig endret ved vassdragsregulering eller irreversibelt inngrep på sted der det tidligere var fastmark, f.eks. ved permanent oppdemming eller sterk regulering av vassdrag.   Sterkt endret eller ny fast ferskvannsbunn dekker vanligvis små arealer, med unntak av store kraftmagasiner. Neddemt fastmark gjennomgår rask suksesjon dersom ikke helt spesielle forhold retarderer suksesjonshastigheten. Sterkt regulerte innsjøer og elver får gjerne sterkt redusert artstilfang, av de fleste organismegrupper (Saltveit 2006, Mjelde et al. 2013).
	Hovedtypen omfatter også nye ferskvannsbunnsubstrater, f.eks. framkommet ved bygging av større installasjoner (demninger, kraftverk, moloer, brygger etc.)
'''
)