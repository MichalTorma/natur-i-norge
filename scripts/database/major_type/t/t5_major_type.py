# %%
from model.model import MajorType, MajorTypeInfo

# %% T5
t5_major_type = MajorType(
    _id=5,
    majorTypeGroup_id='T',
)
t5_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t5_major_type,
    name='Cave and overhang',
    description='Cave and overhang include the variation from overhangs, i.e. rock walls with inclination > 90°, to deep caves. An overhang becomes a cave when the cavity is five or more metres deep. Caves are formed by chemical weathering of limestone or coastal processes like wave erosion. LEC cave-induced sheltering expresses the gradual fading of light and stabilisation of environmental conditions such as temperature and moisture with increasing distance from the cave entrance. Caves may harbour specialised organisms.',
)
t5_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t5_major_type,
    name='Grotte og overheng',
    description='''Ei grotte (hule) er et naturlig hulrom i fjell under jordoverflata, som er stor nok til at et menneske kan komme seg inn og lang nok til at deler av den aldri opplyses av dagslys. Grotter utmerker seg blant natursystemer på ikke jorddekt mark med svært spesielle leveforhold for organismer. De fleste forekomster av dype grotter er knyttet til kalksteinsforekomster (kalkgrotter). Kalkgrotter oppstår ved at vann som er rikt på oppløst karbondioksid over lang tid forårsaker kjemisk forvitring av kalksteinen. Forvitringen starter gjerne i sprekker, og gjør at eksisterende hulrom i kalksteinen utvider seg. I løpet av flere tusen år kan komplekse underjordiske dreneringssystemer utvikle seg, blant annet med underjordiske elveløp, dryppsteiner, kalktuffer og andre landformer. På steder med spesielle forhold finnes spektakulære dryppsteinsstrukturer (stalaktitter, istapp-liknende former fra huletaket dannet av utfelt kalkstein, og stalagmitter, tilsvarende former stående på hulebunnen).
	I Norge finnes en konsentrasjon av grotter i Nordland (og i Rana spesielt), men grotte forekommer spredt over hele landet. Utenfor kalkområdene finnes grotte først og fremst i kystnære områder, formet av bølgevirkning over svært lang tid (for eksempel hullet i Torghatten, Brønnøy, Nordland), men grotter kan også være formet av elver, f.eks. som del av jettegrytesystemer.
	Overheng har en artssammensetning som er tydelig forskjellig fra, og langt mer artsfattig enn, artssammensetningen på bergvegg (≤ 90 ° helning). Til dels er overheng begynnelsen på en artsuttynningsgradient, men overheng huser også arter som normalt ikke finnes på bergvegg, f.eks. klippepulverlav (Chrysothrix chlorina). Artsinventaret tynnes gradvis ut innover i grotta. 
'''
)