# %%
from model.model import MajorType, MajorTypeInfo

# %% T1
t1_major_type = MajorType(
    _id='T1',
    majorTypeGroup_id='T',
)
t1_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t1_major_type,
    name='Bare rock',
    description='Bare rock includes rock surfaces without soil cover or with a soil cover too thin to support vascular plants. Bare rock may lack vegetation or support lichen- and/or moss-dominated communities. Bare rock comprises rock walls, rock pavements and rock outcrops. Lime richness and risk of desiccation are the most important LECs; other important LECs are supply of trickling water and slope-related disturbance intensity. Bare rock also includes specialised ecosystems in the spray zone near waterfalls, in snowbeds, on wind-exposed rock outcrops and ornitocoprophilic communities on bird perching stones.',
)
t1_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t1_major_type,
    name='Nakent berg',
    description='''Nakent berg er normal hovedtype på fast fjell i dagen, det vil si uten jorddekke. Nakent berg kan være vegetasjonsfritt (i svært langsom eller retardert suksesjon på grunn av disruptivt miljøstress eller forstyrrelse) eller, oftere, er nakent berg mer eller mindre dekket av vegetasjon dominert av moser og lav. Spredte karplanter kan forekomme. Nakent berg omfatter variasjon fra flatberg (fast fjell i dagen tilnærmet uten helning) via sva eller bergknaus (fast fjell i dagen med mindre helning enn bergvegg, men større helning enn flatberg) til bergvegg (loddrette eller nesten loddrette eller overhengende bergflater). Nakent berg forekommer ofte i mosaikk med naturtyper på mark med grunt jorddekke; T2 Åpen grunnlendt naturmark kan f.eks. inngå i større bergvegg-komplekser i form av jorddekte berghyller. På svært fin romlig skala kan nakent berg inneholde naturkomponenter som berghyller uten tilstrekkelig jorddekke til å huse en vegetasjon dominert av karplanter (elementer av flatberg omgitt av bergvegg) og bergsprekker (elementer av forsenkning eller innskjæring i fast fjell, omgitt av bergvegg, sva eller flatberg). Bergsprekker, hulrom, små overheng etc. som inngår som mikroelementer i nakne bergflater eller bergvegger, tilhører arealenheten av nakent berg når de er omgitt av nakent berg på alle kanter. Når de har minst én kant felles med et annet natursystem på jorddekt mark (f.eks. ‘lommer’ innunder nedre kant av en bergvegg der denne går over i skogbunn), tilordnes disse det andre natursystemet.
	Innenfor nakent berg finnes mer eller mindre kontinuerlig variasjon langs tre særlig viktige LKM som er normale lokale hovedkompleksmiljøvariabler på ikke jorddekt fastmark: kalkinnhold (KA), uttørkingseksponering (UE) og overrisling (OR). Hovedtypen omfatter dessuten variasjon langs en rekke tLKM som ikke gir opphav til artssammensetning som er vesentlig forskjellig mellom sammenliknbare naturtyper for endetrinnene innenfor nakent berg. Disse tLKM definerer grunntyper for berg i landstrand-delen av flomsonen langs elver og innsjøer, fosseberg, fugleberg og fuglesteiner, som har vært oppfattet som egne hovedtyper i tidligere framlegg til typeinndeling i NiN. Analyser (se NiN[2] Artikkel 2, kapittel B14) viser imidlertid at artssammensetningen ikke gir tilstrekkelig grunnlag for å skille ut egne hovedtyper for disse.
'''
)