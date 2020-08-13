# %%
from model.model import MajorType, MajorTypeInfo

# %% T7
t7_major_type = MajorType(
    _id='T7',
    majorTypeGroup_id='T',
)
t7_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t7_major_type,
    name='Snowbed',
    description='Snowbeds occupy the lower part of the topographical ‘ridge-snowbed gradient’ in alpine and arctic areas, as a result of recurrent prevailing wind direction and snow distribution patterns over years. Snowbeds are characterised by a combination of shortened growing seasons due to prolonged snow cover and, at the same time, shelter against low temperatures and wind abrasion during winter. The variation in snowbeds ranges from moderate snowbeds (facing lee sides) via late and extreme snowbeds to vegetation-free snowbeds where the snow does not melt every year. Lime-richness and water supply are other important LECs in this major type.',
)
t7_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t7_major_type,
    name='Snøleie',
    description='''Snøleie omfatter jorddekt fastmark med etablert vegetasjon, på fastlandet over eller nær skoggrensa og i Arktis. Snøleie kjennetegnes først og fremst ved at langvarig snødekke begrenser vekstsesongens lengde. Solifluksjon (jordflyt) er vanlig og øker i intensitet med økende snødekkevarighet. Med unntak for dvergvier-artene spiller vedaktige planter en underordnet rolle mens urter, grasvekster og moser kan dominere. Snøleiene favner stor variasjon i artssammensetning, fra artsrike, grashei- eller engpregete moderate snøleier gjennom en artsuttynningsgradient der først karplanter faller ut, deretter moser og lav. Endetrinnet innenfor snøleiene er vegetasjonsfrie grussnøleier som ikke smelter fram i alle år. Snøleier dekker store arealer i lavalpin og mellomalpin bioklimatisk sone og i mellomarktisk tundrasone på Svalbard, og forekommer også i høgalpin sone og det nordarktiske tundrabeltet. Arealandelen av snøleier øker fra kontinentale mot oseaniske områder.'''
)