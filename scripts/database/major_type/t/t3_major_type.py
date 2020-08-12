# %%
from model.model import MajorType, MajorTypeInfo

# %% T3
t3_major_type = MajorType(
    _id=3,
    majorTypeGroup_id='T',
)
t3_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t3_major_type,
    name='Arctic-alpine heath and lee side',
    description='Arctic-alpine heath and lee side includes naturally open ecosystems above or north of the climatic forest limit. Sites below the timberline with environmental conditions that resemble those of arctic-alpine areas (wind-swept ridges, frost-exposed depressions) also belong to this major type. The Arctic-alpine heath and lee side major-type occupies a distinct intermediate position along the topographical ‘ridge-snowbed gradient’, between wind-exposed ridge (T14) which lacks permanent snow cover in winter and snowbed (T7) which is characterised by growing-season reduction due to prolonged snow cover. Dwarf shrubs (Betula nana, Salix spp. and ericaceous species) and lichens characterise the vegetation towards the ridges while herbs, graminoids and bryophytes are typical of lee sides, which border on snowbeds. Like in forest (T4), lime richness and risk of drought are the most important LECs.',
)
t3_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t3_major_type,
    name='Fjellhei, leside og tundra',
    description='''Fjellhei, leside og tundra omfatter jorddekt fastmark på fastlandet over eller nær skoggrensa og i Arktis, som ikke er sterkt påvirket av frostprosesser (oppfrysing) eller jordflyt. Podsolprofiler forekommer ofte i kalkfattig og intermediær lavalpin fjellhei og leside. Hovedtypen dekker store arealer i lavalpin og til dels også mellomalpin bioklimatisk sone på fastlandet og i mellomarktisk tundrasone på Svalbard. Fjellhei, leside og tundra kjennetegnes ved å ha etablert flerårig vegetasjon, oftest med et karakteristisk innslag av busker og/eller dvergbusker. Hovedtypen inntar et fast intervall i den karakteristiske, topografi-relaterte vegetasjonssoneringen i fjellet, og grenser oppover mot avblåst rabbe som mangler stabilt snødekke om vinteren og derfor er sterkt vindutsatt, nedover mot snøleie der toleranse overfor redusert vekstsesonglengde setter grenser for artenes forekomst. Årsaken til denne soneringen er at snøfordelingen har et karakteristisk mønster som gjentar seg fra år til år. Snødekkevarighet er ikke en viktig vekstbegrensende faktor i T3 Fjellhei, leside og tundra. Denne hovedtypen har samme rolle som normal hovedtype på fastmark over skoggrensa som T4 Fastmarksskogsmark har under skoggrensa, og de samme LKM er viktige. Variasjonen langs uttørkingsfare (UF) er imidlertid mer begrenset i fjellet på grunn av at mangelen på tresjikt og tynnere jordsmonn, som åpner for sterkere vindvirkning; de mest uttørkingsutsatte stedene inntas av rabber og paralleller til den friskeste, ikke kildevannspåvirkete skogsmarka mangler. Leside, som bare finnes i lavalpin bioklimatisk sone, utgjør ‘optimaltypen’ i fjellet, og kombinerer stabilt snødekke, lav uttørkingsfare og lang vekstsesong. Mot overgangen mellom lavalpin og mellomalpin bioklimatisk sone blir forholdene som karakteriserer lesida gradvis ‘skviset ut’ på grunn av økende snødekkevarighet og kortere vekstsesong (se NiN[1] Artikkel 15). Fjellheier med tynt snødekke om vinteren kan stedvis være påvirket av reinbeiting.'''
)