# %%
from model.model import MajorType, MajorTypeInfo

# %% L8
l8_major_type = MajorType(
    _id='L8',
    majorTypeGroup_id='L',
)
l8_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=l8_major_type,
    name='Strongly altered or artificial freshwater sediment',
    description='Strongly altered or artificial freshwater sediment includes soft substrates in lakes and rivers that are altered by human intervention as well as new soft substrates, e.g. in artificial lakes and farm ponds constructed on former wetland or terrestrial land. Sediments that belong to this major type may result from landfill operations, regulation of rivers and lakes, deposition of sewage sludge and industrial, mining or other wastes.',
)
l8_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=l8_major_type,
    name='Sterkt endret eller ny limnisk sedimentbunn',
    description='''Sterkt endret limnisk sedimentbunn omfatter bunn i innsjøer, elver og kilder som er vesentlig endret ved deponering eller fjerning av masser eller ved vassdragsregulering, og ny limnisk sedimentbunn oppstått gjennom irreversibelt inngrep på sted der det tidligere var fastmark eller våtmark. Sterkt endret eller ny limnisk sedimentbunn dekker vanligvis små arealer, med unntak av store kraftmagasiner. Neddemt fastmark eller våtmark, og sterkt endret bunn oppstått ved deponering eller uttak av masser, gjennomgår rask suksesjon dersom ikke helt spesielle forhold retarderer suksesjonen eller senker suksesjonshastigheten sterkt. Sterkt regulerte innsjøer og elver får gjerne sterkt redusert artstilfang, av de fleste organismegrupper (Saltveit 2006, Mjelde et al. 2013).'''
)