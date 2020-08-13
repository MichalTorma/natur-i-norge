# %%
from model.model import MajorType, MajorTypeInfo

# %% V6
v6_major_type = MajorType(
    _id='V6',
    majorTypeGroup_id='V',
)
v6_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v6_major_type,
    name='Wet snowbed and snowbed spring',
    description='Wet snowbed and snowbed spring comprises wetlands above and north of the timberline, characterised by shortened growing season due to prolonged snow cover and influence by spring water (see V4). This major type typically occurs near the bottom of slopes under late-melting snow patches that provide ample supplies of meltwater far into the growing season.',
)
v6_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v6_major_type,
    name='Våtsnøleie og snøleiekilde',
    description='''Våtsnøleier betegner mer eller mindre langvarig snødekt mark som tilføres smeltevann fra ovenforliggende snøskavler eller breer gjennom store deler av vekstsesongen. Høy markfuktighet og langvarig snødekning gir opphav til en artssammensetning med sterkt innslag både av snøleiearter og arter typisk for myr og kilde. Våtsnøleier er (stort sett) begrenset til lav- og mellomalpin bioklimatisk sone, der den lave produksjonen balanseres av relativt høy nedbrytning forårsaket av rikelige tilførsler av friskt smeltevann (og kildevann), som også kan forårsake bortvasking av produsert organisk materiale. Våtsnøleiene er derfor, i motsetning til myrer, ikke torvmarker og karakteriseres av lavt innhold av organisk materiale (IO) (IO∙0a). Dette er sannsynligvis hovedgrunnen til at våtsnøleiene har blitt betraktet som fastmarksvegetasjonstyper i vegetasjonsinndelingssystemene (Gjærevoll 1956, Fremstad 1997). Analyser av generalisert artslistedatasett B11 viser imidlertid at artssammensetningen i våtsnøleier har større likhet med våtmarkssystemer enn med fastmarkssystemer (NiN[2] Artikkel 2, kapittel B11).
'''
)