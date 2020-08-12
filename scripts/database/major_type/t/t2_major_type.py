# %%
from model.model import MajorType, MajorTypeInfo

# %% T2
t2_major_type = MajorType(
    _id=2,
    majorTypeGroup_id='T',
)
t2_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t2_major_type,
    name='Open shallow-soil ground',
    description='Open shallow-soil ground includes ecosystems below the timberline which are naturally open (treeless) because of the shallow soil cover as such and not because of specific disturbance processes. Lime richness and risk of drought are important LECs. This major type often occurs as narrow border zones (ecotones) between bare rock and forest, e.g. along the coast.',
)
t2_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t2_major_type,
    name='Åpen grunnlendt mark',
    description='''Åpen grunnlendt mark omfatter jorddekt åpen naturmark under skoggrensa, det vil si fastmark som ikke tilfredsstiller skogsmarksdefinisjonen og som heller ikke hører inn under noen av de andre natursystem-hovedtypene på åpen naturlig mark i lavlandet (åpen flomfastmark, breforland og snøavsmeltingsområde, fuglefjell-eng, grus- og steindominert strand og strandlinje, sanddynemark, rasmark, rasmarkhei og -eng, aktiv skredmark, nakent berg, isinnfrysingsmark) og som heller ikke er semi-naturlig mark (boreal hei, kystlynghei eller semi-naturlig eng).
	Åpen grunnlendt mark omfatter primært borden med åpen og grunnlendt, men jorddekt fastmark som under skoggrensa skiller bergknaus fra fastmarksskogsmark. Dette er ofte (eller oftest) bare en relativt smal overgang (økoton), men iblant kan åpen grunnlendt naturmark dekke noe større sammenhengende arealer. Særlig er dette tilfellet langs kysten og langs større sjøer, der skogsmarka av ulike grunner ikke strekker seg helt ned til flommarka. Dette kan dels skyldes at miljøforholdene ikke er gunstige for vekst av trær (vindutsatthet, saltsprut etc.), men det kan også komme av at den primære suksesjonen (inkludert jordsmonndannelsen) på bergknauser går langsommere på grunn av sterk vær- og vindeksponering. 
	 Åpen grunnlendt mark er en egen natursystem-hovedtype og ikke slått sammen med nakent berg fordi nakent berg hovedsakelig huser steinboende (epilittiske) arter mens jorddekt (om enn grunnlendt) mark hovedsakelig huser epigeiske (jordboende) arter. Artssammensetningen på nakent berg og på åpen grunnlendt mark overlapper i liten grad, men de to hovedtypene forekommer ofte i en fin-skala mosaikk.
'''
)