# %%
from model.model import MajorType, MajorTypeInfo

# %% T4
t4_major_type = MajorType(
    _id='T4',
    majorTypeGroup_id='T',
)
t4_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t4_major_type,
    name='Forest',
    description='The forest major type comprises all terrestrial ‘normal variation’ below the alpine and polar forest limits, characterised by trees as structuring species group. Forests are characterised by long-term presence of trees that, at maturity, make up a stand characterised by vertical projection of tree crowns occupying more than 10 % of the area. Clear-cuts are included in the forest major type if replanted or naturally regenerated without delay. Trees are woody plants more than 5 m tall or that may grow to heights of at least 5 m, or, under growth-reducing conditions, more than 2 m. All non-wetland terrestrial land which meets these criteria, except alluvial forests which make up a major type on its own (T30), is included in the forest (T4) major type. Semi-natural and strongly altered land that meets the demand of forests for tree stand density are, by definition, not included in the concept of forest but in NiN characterised as woodland and included in the respective major types. Lime richness and risk of drought are most important LECs in this major type.',
)
t4_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t4_major_type,
    name='Fastmarksskogsmark',
    description='''Fastmarksskogsmark omfatter alle fastmarksarealer som tilfredsstiller skogsmarksdefinisjonen og som ikke påvirkes av flom. Skogsmark er naturlig mark som er sterkt preget av langvarig innflytelse fra trær og som ved et gitt tidspunkt er tresatt eller som i nær fortid har vært og i nær framtid forventes igjen å være tresatt. Mark der gjentatte forstyrrelser, inngrep eller liknende over lengre tid har forhindret utvikling av ny tresatt mark er ikke skogsmark. Fastmarksskogsmark omfatter nesten all skogsmark på fastmark i Norge, og dekker dermed størstedelen av landarealet under skoggrensa. Skogbruksaktivitet og annen bruk gir opphav til stor variasjon langs tilstandsøkokliner og i objektinnhold. Skogsmarksøkosystemets strukturkompleksitet (sjiktning, forekomst av livsmedier på levende og død ved etc.) gjør at det huser en betydelig andel av organismemangfoldet i Norge. Mange arter er spesifikt knyttet til fastmarksskogsmark.'''
)