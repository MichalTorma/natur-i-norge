# %%
from model.model import MajorType, MajorTypeInfo

# %% L3
l3_major_type = MajorType(
    _id='L3',
    majorTypeGroup_id='L',
)
l3_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=l3_major_type,
    name='Aphotic freshwater sediment',
    description='Aphotic freshwater sediment comprises soft sediments, often with high organic matter content, below the compensation point of lakes. Plants are absent, various animal communities may occur. Animal species richness is lower than in the euphotic belt.',
)
l3_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=l3_major_type,
    name='Afotisk limnisk sedimentbunn',
    description='''Afotisk (mørk) limnisk sedimentbunn omfatter bunntilknyttete natursystemer på større dyp enn kompensasjonsdypet, i innsjøer der bunnvannet ikke regelmessig gjennomgår stagnasjonsperioder med så sterk oksygenmangel at det gir seg utslag i artssammensetningen (hypoksi eller anoksi).  Fordi nesten alt materialet som tilføres den mørke innsjøbunnen sedimenteres, består afotisk limnisk sedimentbunn vanligvis av fine sedimenter i lag med varierende tykkelse og varierende organisk innhold. Bunndyrfaunaen i den afotiske beltet (profundalbeltet) er svært artsfattig, og inneholder foruten bakterier også blant annet detritusspisende insektlarver [f.eks. av fjærmygg (Chironomidae) og svevemygg (Chaboridae)], fåbørstemark (Oligochaeta) og småmuslinger (Mollusca). Fordi all næringstilførsel til den afotiske bunnen må tilføres ovenfra, regulerer mengden av og kvaliteten på det tilførte organiske materialet produksjonen i dypbunnsamfunnene. Redusert oksygeninnhold under vinterstagnasjonen kan bidra til å begrense produksjonen ytterligere. Produktiviteten er gjennomgående mye lavere på afotisk enn på eufotisk bunn. En viktig tilpasning til det afotiske bunnmiljøet er at mange arter bruker lengre tid på å gjennomføre sin livssyklus.'''
)