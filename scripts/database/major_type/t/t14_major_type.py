# %%
from model.model import MajorType, MajorTypeInfo

# %% T14
t14_major_type = MajorType(
    _id=14,
    majorTypeGroup_id='T',
)
t14_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t14_major_type,
    name='Exposed ridge',
    description='Exposed ridge comprises the upper end of the topographical ‘ridge-snowbed gradient’ in alpine and arctic areas where this type is confined to convex terrain. Ecologically, this major type is characterised by lack of permanent snow cover in winter, periods with extremely low temperatures, freeze-drying conditions and physical wind abrasion. The specialised composition of stress-tolerant species is dominated by chionophobic yellow or dark lichens with scattered mosses and vascular plants. Deflation patches with exposed mineral soil (gravel or sand) may occur on the most strongly wind-exposed ridges.',
)
t14_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t14_major_type,
    name='Rabbe',
    description='''Rabber er mark i fjellet og i Arktis som er preget av vindpåvirkning (VI∙a+), forårsaket først og fremst av mangelen på stabilt snødekke om vinteren. Rabber finnes på konvekse terrengformer – fjelltopper, koller, rygger og svakt konvekse, bratte skråninger der vinden får godt tak. På grunn av relativt likartet snøfordeling fra år til år (som skyldes at den framherskende vindretningen om vinteren i fjellet ofte er den samme – omkring nord), er ofte overgangen mellom lavdominert fjellhei og avblåst rabbe relativt skarp, markert ved skifte fra dominans av vedplanter [dvergbjørk (Betula nana), vier- (Salix spp.), lyngarter] og reinlav-arter (Cladonia spp.) til dominans av vindherdige lavarter som rabbeskjegg (Alectoria ochroleuca), gulskinn (Flavocetraria nivalis) og gulskjerpe (F. cucullata). For å kunne leve på rabber, må karplanter ha tilpasninger til å tåle mekanisk slitasje (snø- og isskuring om vinteren) og stor toleranse uttørkingstoleranse. Mange arter danner tette tuer eller matter. Rabber dekker vanligvis små arealer, men kan i kontinentale fjellstrøk med små snømengder (østlige deler av fjellkjeden) dekke store, sammenhengende arealer. Ekstra sterk vindvirkning kan medføre deflasjon, med flekker av naken grus (finmaterialet er erodert bort) som resultat. Rabber kan stedvis være påvirket av reinbeiting.'''
)