# %%
from model.model import MajorType, MajorTypeInfo

# %% T17
t17_major_type = MajorType(
    _id='T17',
    majorTypeGroup_id='T',
)
t17_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t17_major_type,
    name='Open active landslide',
    description='The open active landslide major type includes steep slopes at sites where active mass transportation processes are strong enough to prevent establishment of forest. The substrate is unstable and dominated by soil or fine mineral material (gravel, sand, silt or clay). The major type is most commonly found along rivers and streams that run through thick fluvial or glacifluvial deposits, e.g. ravines, where landslide processes are kept active by riverbank erosion. The vegetation is sparse, consisting of a bryophyte- or lichen-dominated crust, a meadow-like sward or low thickets.',
)
t17_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t17_major_type,
    name='Aktiv skredmark',
    description='''Åpen skredmark omfatter mark på ustabilt substrat, dominert av jord eller oftere fint mineralmateriale (grus, sand, silt eller leire). Åpen skredmark finnes i bratte skråninger med aktive massebevegelsesprosesser (se NiN[1] Artikkel 11) som fører til hyppig skredaktivitet, men der skredene ikke er større enn at arealenhetene opprettholder en mosaikk mellom nakne vegetasjonsdekte partier. Åpen skredmark finnes hyppigst langs elver og bekker som renner gjennom tjukke løsmasselag (f.eks. i ravinedaler), Elver som undergraver bakkeskråninger i løsmateriale vil på grunn av evnen til sideerosjon holde skråningen bratt og derigjennom sørge for at skredmarka stadig forstyrres av gjentatte småskred.'''
)