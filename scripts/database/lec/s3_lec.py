# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% S3
s3_lec = LEC(
    _id='S3',
    structuringProcess_id='S',
    patternOfVariation_id='mf',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
s3_lec_info_en = LECInfo(
    language_id='en',
    lec=s3_lec,
    name='Sediment sorting',
    description='Complex environmental variable consisting of three single LECs: erosion resistance (NiN code S3E; running from suspended material with no resistance to erosion, to bedrock); fine-matter content (S3F; the fraction of substrate made up by silt and clay); and special sediments (S3S; a categorical variable that includes, e.g., shellsand, coral gravel and submerged peat)',
)
s3_lec_info_nb = LECInfo(
    language_id='nb',
    lec=s3_lec,
    name='Sedimentsortering',
    description='''Sedimentsortering er en flerdimensjonal lokal kompleks miljøvariabel (fLKM) som adresser hele spekteret av økologiske effekter av viktige prosesser knyttet til sedimentenes kornstørrelsesfordeling. I NiN versjon ble dette komplekset av variasjon håndtert som én ‘lokal basisøkoklin’, kornstørrelse (KO), som fordelte variasjonen i dominerende kornstørrelse fra leire til fast fjell på 9 kornstørrelsesklasser med tillegg av 6 såkalte ‘spesialtrinn’ for spesielle, først og fremst biogene, substrater. Kornstørrelsen blir beskrevet ved bruk av Wentworths kornstørrelsesskala (Wentworth 1922) med 25 klasser som hver omfatter et intervall der kornstørrelsen dobles (gjengitt som NiN[2] Artikkel 1, Tabell B3–5). Dette er ulogisk i NiN-sammenheng fordi det ikke er noen entydig, monoton sammenheng mellom gradienter i artssammensetning og gradienter i sedimentenes kornstørrelsesfordeling. Derfor er det heller ikke er mulig å transformere fysisk kornstørrelse til én variabel som artssammensetningen er lineært relatert til ved én enkel transformasjon. I NiN versjon 2 er sedimentsortering derfor behandlet på to måter. På saltvannsbunn er det identifisert to viktige gradienter i artssammensetning som er nært knyttet til prosessene som forårsaker variasjon i sedimentenes kornstørrelsesfordeling. Disse inngår som to komplekse miljøgradienter i den flerdimensjonale lokale komplekse miljøvariabelen (fLKM) sedimentsortering (S3): erosjonsmotstand (S3E) og finmaterialinnhold (S3F). I tillegg finnes flere kategorier av biogene substrater som har egenskaper som gjør at deres artssammensetning skiller seg betydelig eller vesentlig fra sorterte sedimenter som er sammenliknbare med hensyn til plassering langs S3E og S3F). Disse er inkludert i S3 som en kategorisk variabel, spesielle sedimenter (S3S). I ferskvannsbunnsystemer er kornstørrelsesfordelingen enten et direkte uttrykk for vannforstyrrelsesintensitet (VF), eller av mindre betydning og opphav til mindre forskjeller i artssammensetning mellom spesifikke substratkategorier. Det samme er tilfellet i fastmarkssystemer. I disse systemene benyttes derfor en forenklet oppdeling, operasjonalisert som faktorvariabelen dominerende kornstørrelsesklasse (S1) som inneholder basisklasser for ulike kornstørrelser som fritt kan kombineres til hovedtypetilpassete trinn på grunnlag av kunnskap eller antakelser om omfanget av variasjon i artssammensetning som de gir opphav til. De to alternative måtene å beskrive variasjon relatert til sedimentsortering og kornstørrelse blir betegnet henholdsvis S3 (trevariabel-skjemaet; se NiN[2] Artikkel 1 Fig. B3–6) og S1 (envariabel-skjemaet). 
''',
)