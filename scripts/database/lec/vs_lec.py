# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% VS
vs_lec = LEC(
    _id='VS',
    structuringProcess_id='R',
    patternOfVariation_id='G',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=1,
    spatialScale=3,
)
vs_lec_info_en = LECInfo(
    language=en_language,
    lec=vs_lec,
    name='Vannsprutintensitet',
    description='''Når elver med jevnt høy vannføring går i stryk og fosser, dannes ‘fosserøyk’ av vannsprut. Denne ‘fosserøyken’ består av dråper og mindre partikler (aerosoler). Fordi store partikler faller til bakken raskere enn små, etableres det en gradient i vannsprutintensitet (VS) fra fossen ut i omkringliggende natur. Størrelsen på området som blir influert av fossesprut øker med økende fallhøyde og økende vannføring i elva, og påvirkes også av lokale topografiske forhold. For eksempel vil sprut fra fosser i trange gjel kunne transporteres mange hundre meter fra fossen, inn i sidedaler etc., når de lokale forholdene ligger til rette for det. Lokale vindforhold kan ha stor betydning. Størrelsen på det fossesprutpåvirkete området er korrelert med vannsprutintensiteten nær fossen.
	Med avtakende intensitet av fossesprut fra ‘fosseregn’ med store dråper nærmest via ‘fosseyr’ (mindre dråper) og ‘fossetåke’ (nesten bare aerosoler) endrer miljøforholdene seg. Nærmest fossen er luftfuktigheten høy og stabil og temperaturene modereres betydelig (kjølig om sommeren, midt om vinteren) så lenge elva og fossen ikke fryser til. Med økende avstand fra fossen øker temperaturvariasjonen (maksimums- og minimumstemperaturene) og luftfuktigheten inntil det ikke lenger er mulig å spore fosserøykinnflytelse.
	Mens klare effekter av fosserøykinnflytelse på artssammensetningen av epifytter er påvist, hersker det stor usikkerhet med hensyn til effekten på artssammensetningen på marka. Som en tentativ løsning inntil det foreligger empiriske data som forteller en annen historie, er vannsprutintensitet delt i fire basistrinn der den viktige grensa mellom fosserøykinfluert skogsmark og åpne fosse-enger (betinget av at arter med flerårige overjordiske deler ikke tåler innfrysing i is om vinteren) er tatt inn som grense mellom trinn VS∙a og VS∙b. Det foreligger ikke sterke indikasjoner på omfanget av variasjon innad i fosse-enger (og på fosseberg) relatert til variasjon i vannsprutintensitet, men det er sannsynlig at en viss variasjon finnes langs en slik gradient. Det er lagt til grunn at denne har et omfang som forsvarer en oppdeling i to basistrinn før jorddekt fastmark (fosse-enger) går over til nakent fosseberg (men fosseberg finnes naturligvis over hele spekteret av variasjon i vannsprutintensitet på bergvegger og andre steder der de lokale topografiske forholdene forhindrer jordsmonnsutvikling. Dette resulterer i en oppdeling i fire basistrinn mellom nulltrinnet og overgangstrinnet i ferskvannsdelen av flomsonen.
''',
)
vs_lec_info_nb = LECInfo(
    language=nb_language,
    lec=vs_lec,
    name='Water-spray impact',
    description='Variation in the impact of water spray from water-falls and large, fast-flowing rivers, typically forming a distinct zonation of vegetation by gradual loss of woody plants and other frost-sensitive, perennial species that do not tolerate encapsulation in ice crust during wintertime; towards the water source the physical characteristics of the supplied water (from mist via small and large droplets to large drops) changes and the supplied amounts of water increases strongly, ending in absence of soil forma-tion and a species-thinning situation even on rock',
)
