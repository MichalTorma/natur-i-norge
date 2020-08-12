# %%
from model.model import MajorType, MajorTypeInfo

# %% T18
t18_major_type = MajorType(
    _id=18,
    majorTypeGroup_id='T',
)
t18_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t18_major_type,
    name='Open alluvial sediment',
    description='Open alluvial sediment includes naturally open (treeless), periodically flooded banks of rivers and lakes. The major type is conditioned on water-mediated disturbance with intensity high enough to prevent establishment of trees. Alluvial processes (in rivers) and wave action (in lakes) regulate the composition of the sediment by balancing sedimentation and erosion. The dominant grain size varies from clay to stone, depending on disturbance intensity.',
)
t18_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t18_major_type,
    name='Åpen flomfastmark',
    description='''Åpen flomfastmark omfatter åpne fastmarksarealer i flomsonen, først og fremst langs større elver, men også på innsjø-landstrand, på sorterte sedimenter med dominerende kornstørrelse fra stein til leire. Åpen flomfastmark langs elver er vanligvis utsatt for veksling mellom erosjon (i perioder med stor vannføring) og sedimentasjon i perioder med lavere vannføring. Vannets eroderende kraft er avhengig av innholdet av bre- eller elvesedimenter. Åpen flommark, det vil si ikke tresatt flommark, forutsetter sterk eksponering overfor vannforstyrrelse. For at flommarka skal forbli åpen, må vannets forstyrrelseseffekt være så sterk at vedvekster ikke klarer å etablere seg og/eller opprettholde stabile bestander over tid. Vannforstyrrelseseffekten øker mot elveløpet eller vannkanten. De største sammenhengende arealenhetene av åpen flomfastmark finnes på elvesletter (innlandsdeltaer) og langs større elver i flate dalbunner, særlig der elver møtes.'''
)