# %%
from model.model import MajorType, MajorTypeInfo

# %% T19
t19_major_type = MajorType(
    _id=19,
    majorTypeGroup_id='T',
)
t19_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t19_major_type,
    name='Patterned ground',
    description='Patterned ground consists of regular rings, polygons or stripes of coarse mineral material which alternate with fine, predominantly silt-dominated material. This major type, which is conditioned on strong frost-mediated disturbance (cryoturbation), is typically found in relatively flat areas with permafrost and high groundwater table in the middle and high alpine bioclimatic zones and in the Arctic.',
)
t19_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t19_major_type,
    name='Oppfrysingsmark',
    description='''Oppfrysingsmark er en veldefinert naturtype som omfatter mark, ofte med fuktmarkskarakter, i mellomarktisk og nordarktisk, mellomalpin og høgalpin bioklimatisk sone. Oppfrysingsmark er knyttet til områder med permafrost og sterk frostvirkning (oppfrysing, kryoturbasjon) som gir opphav til karakteristiske mikro-landformer (regelmessige ring-, polygon- eller stripestrukturer av grovt mineralmateriale som alternerer med fint, overveiende silt-dominert materiale (‘finjord’) i et mer eller mindre regelmessig mønster. Oppfrysingsmark mangler sammenhengende karplantedekke med vedplanter. På det forstyrrelsesutsatte jordsmonnet i finjordsflekkene er artsutvalget begrenset til forstyrrelsestolerante arter; levermoser spiller en viktig rolle. På de grovere substratene kan det finnes lav, men lavdekningen avtar sterkt når frostprosessene blir særlig aktive. Både finjords- som grovmaterialområdene inngår i T19 Oppfrysingsmark.'''
)