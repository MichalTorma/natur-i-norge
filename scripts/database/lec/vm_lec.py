# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% VM
vm_lec = LEC(
    _id='VM',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=5,
    spatialScale=1,
)
vm_lec_info_en = LECInfo(
    language=en_language,
    lec=vm_lec,
    name='Vannmetning',
    description='Vannmetning (VM) beskriver, sammen med uttørkingsfare (UF), variasjon relatert til jordfuktighet på jorddekt fastmark. Miljøvariabelen vannmetning (VM) adresserer fuktighetsforholdene slik de stort sett er (‘median jordfuktighet’; R. Økland & Eilertsen 1993), mens uttørkingsfare (UF) adresserer faren for ekstrem uttørking, kanskje 50- eller 100-årstørken. Variasjonen langs UF og VM er i stor grad er frikoblet i rom, i tid og med hensyn til artenes responser; i fastmarksskogsmark er f.eks. alle kombinasjoner av UF (variasjonen fra frisk blåbærskog til tørkeutsatt lavskog) og VM realisert. Langs vannmetning (VM) finnes variasjon fra veldrenert mark, gjerne på svakt konkave terrengformer, til større eller mindre flekker, gjerne i små forsenkninger, av vegetasjon dominert av torvmoser (Sphagnum spp.) og andre arter som foretrekker fuktige voksesteder, men som også tåler langvarig uttørking). I motsetning til uttørkingsfare (UF), som er identifisert på grunnlag av en fortsatt ubekreftet hypotese (‘uttørkingsfare-hypotesen’), finnes det empiriske data som viser at vannmetning (VM) er sterkt korrelert med median jordfuktighet (f.eks. R. Økland & Eilertsen 1993, T. Økland 1996).',
)
vm_lec_info_nb = LECInfo(
    language=nb_language,
    lec=vm_lec,
    name='Water saturation',
    description='Variation in normal (median) soil moisture, from well-drained via periodically moist to moist soil; transgressing into LEC TV, ‘Duration of period without inundation’; while VM addresses soil moisture content under ‘normal’ situations, e.g., as reflected in the abundance of Sphagnum spp. in forests, LEC UF addresses the risk of extreme drought spells',
)
