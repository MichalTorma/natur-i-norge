# %%
from model.model import MajorType, MajorTypeInfo

# %% T27
t27_major_type = MajorType(
    _id=27,
    majorTypeGroup_id='T',
)
t27_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t27_major_type,
    name='Boulder field',
    description='Boulder fields are areas dominated by coarse mineral material, mostly boulders but occasionally also stone or gravel. Soil is lacking or sparsely present in crevices on or between boulders. Boulder fields are typically formed in cold climates of the arctic and alpine bioclimatic zones by mechanical weathering during freeze-thaw periods or by frost upheaval that brings larger blocks to the surface. Coarse glacial deposits (Rogen moraines) are also included in this major type. Vegetation is typically restricted to saxicolous lichens, sometimes also mosses, or may be absent.',
)
t27_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t27_major_type,
    name='Blokkmark',
    description='''Blokkmark er sammenhengende områder dominert av blokker eller steiner og som sporadisk kan ha innslag av finere mineralmateriale, men som stort sett mangler jordsmonn mellom blokkene. Bortsett fra steinboende lav- og mosearter er vegetasjonen svært sparsom eller mangler helt. Blokkmark kan oppstå ved forvitring på stedet (forvitringsblokkmark) eller den kan bestå av grove bresedimenter (rogenmorene), eventuelt som resultat av at finmaterialet har blitt vasket ut og/eller at blokkene har kommet opp til overflata ved oppfrysing (oppfrysingsblokkmark).'''
)