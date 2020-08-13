# %%
from model.model import MajorType, MajorTypeInfo

# %% V8
v8_major_type = MajorType(
    _id='V8',
    majorTypeGroup_id='V',
)
v8_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v8_major_type,
    name='Tidal and alluvial swamp forest',
    description='Tidal and alluvial swamp forest (see T4 for definition of forest) comprises swamp forests along lakes and seashores that are inundated during flooding events or spring tides. This major type differs from alluvial forest (T30) by the permanently waterlogged soil and from mire and swamp forest (V2) by being supplied with stagnant lake or tidal (limno-topogenous) water. In contrast, swamp forests receive minerogenous water.',
)
v8_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v8_major_type,
    name='Strandsumpskogsmark',
    description='''Sumpskogsmark betinget av limno-topogen vanntilførsel (dvs. som oversvømmes av vann fra innsjøer og/eller havvann; VT∙a) har en artssammensetning som er betydelig forskjellig fra sammenliknbare systemer betinget av tilførsler av jordvann (NiN[2] Artikkel 2, kapittel B12). Slike skogsmarker er kjent som ‘strandskoger’ (Kielland-Lund 1981, Fremstad 1997), og finnes langs bredden av større innsjøer og ned i supralitoralbeltet på sterkt beskyttete steder langs kysten (innerst i lange, grunne kiler, etc.).'''
)