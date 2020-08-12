# %%
from model.model import MajorType, MajorTypeInfo

# %% T30
t30_major_type = MajorType(
    _id=30,
    majorTypeGroup_id='T',
)
t30_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t30_major_type,
    name='Alluvial forest',
    description='Alluvial forest includes periodically flooded, non-wetland forest (see T4 for definition of forest) on banks of rivers and lakes, impacted by water-mediated disturbance. Alluvial processes in rivers and wave action in lakes regulates the composition of the sediment by balancing sedimentation and erosion. The dominant grain size varies from clay to stone, depending on disturbance intensity. This major type also includes sea water-influenced forests in the upper part of the tidal belt.',
)
t30_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t30_major_type,
    name='Flomskogsmark',
    description='''Flomskogsmark omfatter skogsmarksarealer i flomsonen, først og fremst langs større elver, der bredden er utsatt for forstyrrelse (erosjon og/eller sedimentasjon) forårsaket av vann i bevegelse (limnogent vann, eventuelt med kildevannstilførsel fra fastmarkssiden i tillegg). Flommark er tresatt når vannets forstyrrelseseffekt er lav nok til at vedvekster klarer å etablere seg og opprettholde stabile bestander over tid. Flomskogsmark finnes oftest som en sone mellom åpen flomfastmark og annen fastmark på landsiden av flommarkssonen. Flomskogsmarka kan være et (langvarig) stadium langs en suksesjonsgradient på steder med aktiv elvesedimentasjon og/eller representere en relativt stabil situasjon (med gitt omfang av vannforårsaket forstyrrelse) på flommark der det er balanse mellom sedimentasjon og erosjon.
	Artssammensetningen i flomskogsmark, også på steder der kildevannspåvirkning gjennom grunnen er lite sannsynlig, har mange arter felles med storbregne- og høgstaudedominerte (kildevannspåvirkete) fastmarkssystemer. Det indikerer at elvevannstilførsel i seg sjøl har noe av den samme effekten på artssammensetningen som framspring av friskt grunnvann.
'''
)