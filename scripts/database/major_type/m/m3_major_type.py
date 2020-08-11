# %%
from model.model import MajorType, MajorTypeInfo

# %% M3
m3_major_type = MajorType(
    _id=3,
    majorTypeGroup_id='M',
)
m3_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m3_major_type,
    name='Littoral rock',
    description='Littoral rock includes rockwalls, outcrops and stable boulders in the tidal belt, delimited upwards by the shift from dominance by saltwater-adapted organisms (e.g., the barnacle Semibalanus balanoides and the winkle Littorina littorea) to dominace by terrestrial organisms, typically the lichen Verrucaria maura. Downwards littoral rock is delimited by the low tide level. This major type includes the upper infra littoral zone, comprises communities from both salt and brackish water as well as variation from sheltered via moderately to strongly exposed hard substrates.',
)
m3_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m3_major_type,
    name='Fast fjærebeltebunn',
    description='''Fast fjærebeltebunn omfatter fast fjell og stabile blokker med permanente samfunn av flerårige alge- og dyrearter, i hele fjærebeltet. Nedre grense settes ved normalt fjæremål, det vil si nivået som vanligvis konstant fuktes av havvann (upper infralitoral zone). Øvre grense settes der dominans av saltvannstilknyttete arter som fjærerur (Semibalanus balanoides) og vanlig strandsnegl (Littorina littorea) avløses av dominans av den svarte laven marebek (Verrucaria maura). Dette er ei viktig biologisk grense, mellom saltvannstilknyttete arter og landtilknyttete arter (Du Rietz 1947, Sjörs 1967, Rueness 1998, Fredriksen & Throndsen 2001). Den eksakte plasseringen av denne grensa avhenger av eksponeringen; desto sterkere eksponering, desto lengre opp i fjærebeltet går grensa. På temmelig eksponerte steder [vannpåvirkningsintensitet (VF∙f)] går grensa omtrent mellom øvre landstrand og bølgeslagsbeltet [supralitoralbeltet; dvs. mellom trinnene TV∙h og TV∙i langs tørrleggingsvarighet (TV)].
Hovedtypen inneholder betydelig variasjon i artssammensetning, først og fremst relatert til grad av eksponering [vannpåvirkningsintensitet (VF)] og vertikal plassering [tørrleggingsvarighet (TV)]. Det er imidlertid også betydelig variasjon relatert til marin salinitet (SA), sannsynligvis også mellom skrånende fast fjell (‘knauser’) og loddrette vegger. Størst differensiering langs VF og TV finnes på bergknauser i normalsalt vann, mens variasjonen er mindre på steder med redusert salinitet (brakkvann, SA∙1&2) og på bergvegger (HF∙2).
	Rur (Semibalanus balanoides, Balanus spp.), strandsnegl (Littorina spp.) og blåskjell (Mytilus edulis) er typiske dyrearter, mens ulike tangarter dominerer ved ulike kombinasjoner av hLKM. Hovedtypen dekker oftest små arealer, men forekommer som ei smal stripe langs det meste av Norges lange kystlinje.
'''
)