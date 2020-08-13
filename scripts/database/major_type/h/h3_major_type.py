# %%
from model.model import MajorType, MajorTypeInfo

# %% H3
h3_major_type = MajorType(
    _id='H3',
    majorTypeGroup_id='H',
)
h3_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=h3_major_type,
    name='Anoxic marine waterbody',
    description='Anoxic marine waterbodies comprise the non-circulating, permanently stagnant, oxygen-free waters at the bottom of some fjords, estuaries and lagoons, often characterised by strongly restricted seasonal exchange of water.',
)
h3_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=h3_major_type,
    name='Ikke-sirkulerende marine vannmasser i fysisk avgrensete saltvannsforekomster',
    description='''For at marine vannmasser skal unngå sirkulasjon, må de enten ha så sterkt redusert saltholdighet at vannets tetthetsmaksimum > 0 °C, slik at de får et sirkulasjonssystem lik det vi finner i innsjøer, eller de må befinne seg på bunnen i dype fjorder med så høy terskel at ikke atlantisk vann strømmer inn over terskelen når sterk fralandsvind frakter overflatevannet utover havet. Ikke-sirkulerende marine vannmasser er den marine parallellen til det permanent stagnerende bunnvannet (monimolimnion) i meromiktiske innsjøer. Vann som aldri blander seg med resten av vannet i fjorden eller pollen er fritt for oksygen og kjennetegnes av spesielle kjemiske forhold, ofte høye konsentrasjoner av CO2, CH4, Ca, Fe og/eller Mn, en artssammensetning dominert av bakterier og ekstrem artsfattigdom. Bakterieslekta Beggiatoa danner hvitaktige, karakteristiske bakteriekolonier i overgangen mellom oksygenfrie vannmasser og bunn. Omfanget av variasjon i kjemiske forhold og artssammensetning i ikke-sirkulerende marine vannmasser er dårlig kjent, og det vites heller ikke i hvilken grad hver enkelt forekomst av slike vannmasser har unike trekk.'''
)