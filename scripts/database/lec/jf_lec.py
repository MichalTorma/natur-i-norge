# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% JF
jf_lec = LEC(
    _id='JF',
    structuringProcess_id='D',
    patternOfVariation_id='g',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=4,
    spatialScale=3,
)
jf_lec_info_en = LECInfo(
    language_id='en',
    lec=jf_lec,
    name='Solifluction',
    description='Variation in topsoil stability; i.e., the tendency of soil to become saturated with water during snowmelt and subsequently move downslope; high intensity of solifluction typically results in formation of soli-fluction lobes at which woody plants are lacking and small bryophytes and lichens dominates on fine soil',
)
jf_lec_info_nb = LECInfo(
    language_id='nb',
    lec=jf_lec,
    name='Jordflyt',
    description='''Jordflyt (solifluksjon) forekommer først og fremst i arktiske og alpine områder, og er resultatet av fullstendig vannmetning av jordsmonnet, gjerne under snøsmeltingen eller ved kontinuerlig overrisling med smeltevann fra ovenforliggende snøfonner. Hvis den vannmettete jorda får en viskøs konsistens, kan den begynne å flyte nedover i terrengets helningsretning. Hastigheten på flytjordas bevegelser varierer fra langsom i vegetasjonsdekte skråninger der jordflyt er synlig som valkeaktige flytjordstunger [NiN 1: landformenheten flytjordsvalk (ML–8)], til raskere i brattere skråninger med mer sparsomt vegetasjonsdekke. Når flytjorda tørker opp utover sommeren, får den en skorpeliknende overflate. Alle faktorer som fremmer langvarig vannmetting av jorda, deriblant regionale faktorer som økende nedbør (i form av snø), det vil si et mer humid klima og lavere temperaturer (økende snødekkevarighet), og lokale faktorer som økende helning og lokal snøakkumulasjon, øker sannsynligheten for jordflyt. Solifluksjonstendensen øker derfor med økende høyde over havet og økende breddegrad, og fra rabbe mot snøleie. I seine snøleier og ekstremsnøleier og i mellomalpin sone bærer nesten all mark preg av jordflyt.
	Dahl (1957) bruker begrepet ’solifluksjon’ (som på norsk betyr jordbevegelse) i vid betydning, både om jordflyt i snever betydning (slik begrepet er definert i NiN 2) og om oppfrysing (‘amorphous solifluction’ og ‘structured solifluction’).
	Vedplanter har en vekstform som gjør dem følsomme for jordustabilitet (langsom vekst, lav toleranse for mekanisk skade) og faller derfor ut mot høyden, både på grunn av lave temperaturer og fordi all jorddekt mark er oppfrysings- eller flytjordsmark. Over vedplantegrensa. Små, forstyrrelsestoleranse levermoser og noen bladmoser og lav dominert på flytjordsmark. Det finner sted en artsuttynning langs JF, men forstyrrelseseffekten av jordflyt er ikke sterk nok til å ende i et disruptivt trinn som f.eks., for erosjonsutsatthet (ER) og vindutsatthet (VI).
''',
)