# %%
from model.model import MajorType, MajorTypeInfo

# %% V5
v5_major_type = MajorType(
    _id=5,
    majorTypeGroup_id='V',
)
v5_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v5_major_type,
    name='Thermal spring',
    description='Thermal springs differ from (cold) springs (V4) by the continuous flow of geothermally heated groundwater, i.e. water with sufficiently high average annual water temperature compared to the adjacent soils that a substantial difference in species composition results. In areas under Norwegian jurisdiction, thermal springs occur only in a few places on Spitsbergen.',
)
v5_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v5_major_type,
    name='Varm kilde',
    description='''Varm kilde omfatter åpen mark med sterk kildevannspåvirkning og som tilføres kildevann med en gjennomsnittstemperatur som er tilstrekkelig mye høyere enn årsmiddeltemperaturen i øvre jordlag i området til at det gir seg vesentlige utslag i artssammensetningen (JV∙a eller høyere). Innenfor området som omfattes av Naturtyper i Norge er varme kilder bare kjent fra Svalbard, der et fåtall enkeltkilder er registrert. Jordvarmetilførselen gjør at varm kilde skiller seg fra alle andre natursystem-hovedtyper på land. Artssammensetningen i varm kilde skiller seg fra artssammensetningen i sterk kaldkilde i samme området fordi varmetilførsel er en av de aller viktigste faktorene for å regulere organismenes funksjon og begrense deres vekst. Mange arter har forekomster i varm kilde som ligger langt nord for det øvrige utbredelsesområdet sitt.
Varme kilder er grunnkilder uten torvdannelse (KT∙1), som også kan beskrives som IO∙0a (overveiende uorganisk substrat til substrat med intermediært innhold av organisk materiale).'''
)