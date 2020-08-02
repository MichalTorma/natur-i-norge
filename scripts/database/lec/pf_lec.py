# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% PF
pf_lec = LEC(
    _id='PF',
    structuringProcess_id='S',
    patternOfVariation_id='f',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=7,
)
pf_lec_info_en = LECInfo(
    language=en_language,
    lec=pf_lec,
    name='Permafrost',
    description='Binary variable that separates arctic-alpine ecosystems without and with permafrost, the latter  typically with a shallow active topsoil layer that thaws in summer; both categories may or may not be influenced by solifluction and/or cryoturbation',
)
pf_lec_info_nb = LECInfo(
    language=nb_language,
    lec=pf_lec,
    name='Permafrostbetinget ',
    description='''Permafrost innebærer at all jord under et visst djup er permanent frossen. Over den permanent frosne marka ligger det aktive laget, som tiner hver sommer (alle norske fastlandsområder har sommermiddeltemperatur over 0 °C). Permafrost defineres ofte som landmasser der temperaturen ikke i løpet av to år overstiger 0 °C (http://met.no/met/met_lex/l_p/ permafrost.html). Store deler av Norge er dekket av permafrost, men fordi man om sommeren kan måtte 1–3 m ned i bakken for å oppdage permafrosten, er den eksakte utbredelsen av permafrost i Norge mangelfullt kjent.
	Jordtemperaturen er avhengig både av sommer- og av vintertemperaturen. Forekomsten av et beskyttende snødekke om vinteren stabiliserer vintertemperaturen på et mye høyere nivå enn der snødekke mangler. Snødekkefordelingen varierer på skalaer fra det lokale (bestemt av rygger og forsenkninger, på skalaer ned til 5–10 m) til det regionale (nedbøren avtar fra oseaniske til kontinentale områder) og forårsaker så vel lokal som regional variasjon i forekomsten av permafrost. Fordi både kalde vintre og lav nedbør kjennetegner kontinentale fjellområder, synker permafrostgrensa sterkt fra oseaniske til kontinentale områder (fra vest mot øst og fra kyst til innland i Sør-Norge, og fra kyst til innland i Nord-Norge). I de østligste delene av Sør-Norge kan det hende at permafrost forekommer ned til under skoggrensa.
	Forekomst (eller ikke-forekomst) av permafrost har en rekke direkte og indirekte effekter på marksystemene. Permafrost fører til intensivering av alle periglasiale prosesser (frostprosesser), først og fremst oppfrysing (kryoturbasjon). For artssammensetningen og miljøforholdene i øvre marksjikt (og typetilhørighet på natursystemnivået i NiN) er det imidlertid uvesentlig om bakken er permanent frosset på fem meters dyp dersom det aktive laget ikke er utsatt for sterk frostvirkning. Omvendt vil forekomsten av kryoturbasjon og, ikke minst, jordflyt, ha store effekter på markegenskaper og artssammensetning også utenfor permafrostområdet. En egen LKM for permafrost, i tillegg til jordflyt (JF) og oppfrysing (OF), som også er sterkt koblet til forekomst av permafrost, er inkludert i NiN for, eventuelt sammen med JF og OF, å skille naturtyper som har permafrost som en nødvendig forutsetning, fra andre naturtyper i arktisk-alpine områder. Permafrost (PF) differensierer også en spesiell naturtype på permafrost med så tynt aktivt lag at dårlig drenering eller rask innfrysing av organisk materiale i permafrosten er utslagsgivende for økosystemenes struktur (arktisk permafrost-våtmark). Slike økosystemer finnes på Svalbard, men mangler i fastlandsfjellene fordi grunn jord og bratt terreng i mellomalpin og høgalpin bioklimatisk sone forhindrer utvikling av slike, karakteristiske permafrost-betingete natursystemer.
''',
)