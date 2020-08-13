# %%
from model.model import MajorType, MajorTypeInfo

# %% T25
t25_major_type = MajorType(
    _id='T25',
    majorTypeGroup_id='T',
)
t25_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t25_major_type,
    name='Open historical landslide',
    description='Open historical landslide includes naturally open (treeless) sites, typically formed by a single landslide event that took place less than 100 years ago and that is not expected to recur before the succession, e.g. into forest, is completed. Most often, the major type arises due to quick clay slides, but landslides in soil, silt, sand or gravel also occur.',
)
t25_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t25_major_type,
    name='Historisk skredmark',
    description='''Historisk skredmark omfatter mark dominert av jord eller fint mineralmateriale (grus, sand, silt eller leire), som er blottlagt i relativt ny tid (for < ca. 100 år siden) gjennom én disruptiv skredbegivenhet med tilstrekkelig stor romlig utstrekning til å utgjøre en egen arealenhet på natursystemnivået (se NiN[1] Artikkel 1, kapittel B3c for begrepsapparat for forstyrrelser). Historisk skredmark er resultatet av en enkeltstående forstyrrelsesbegivenhet, som ikke etterfølges av gjentatte, liknende forstyrrelsesbegivenheter og hvor og den blottlagte (mineral)jorda derfor gjennomgår rask suksesjon mot en ettersuksesjonstilstand som typisk er fastmarksskogsmark. Historisk skredmark er en sjelden naturtype som finnes hyppigst på marine leirsedimenter og steder der det har gått jordras. Skred som resulterer i historisk skredmark kan også imidlertid også forekomme i sand- eller grusdominerte morener.'''
)