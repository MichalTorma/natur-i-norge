# %%
from model import LEC
from model import LECInfo
from database_fill.language_data import en_language, nb_language
from database_fill.structuring_process_data import d_structuring_process
from database_fill.pattern_of_variation_data import f_pattern_of_variation

# %% FR
fr_lec = LEC(
    _id='FR',
    structuringProcess=d_structuring_process,
    patternOfVariation=f_pattern_of_variation,
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=4,
    spatialScale=10,
)
fr_lec_info_en = LECInfo(
    language=en_language,
    lec=fr_lec,
    name='Flooding regime',
    description='Binary variable that separates a \'normal\' flooding regime typically with a seasonal peak discharge in spring during to snowmelt and shorter peaks after intense rain storms, and a regime characterised by prolonged inundation (for months) by stagnant water, e.g., in flooded kettle holes after snowmelt.',
)
fr_lec_info_nb = LECInfo(
    language=nb_language,
    lec=fr_lec,
    name='Flomregime',
    description='''Det normale flomregimet i norske elver og vassdrag kjennetegnes ved en tydelig flomtopp om våren under snøsmeltingen som kan ha noen ukers varighet og mindre og/eller mer kortvarige flomtopper etter kraftige og/eller langvarige regnværsepisoder. Slike flomtopper forekommer i norsk klima særlig om høsten. Dette normale flomregimet kjennetegnes ved at vannpåvirkningsintensiteten (VF) samvarierer med vannføringen i elva og er størst under flomtoppen. Da er også, generelt, massebalansen i utsatte bunnsubstrater mest negativ, det vil si at substratet da blir erodert. Massebalansen skifter til positiv når flommen avtar og transportert, suspendert materiale sedimenteres. Et svært avvikende flomregime finnes på Gardermo-sletta (Ullensaker, Akershus), der mange km2 dekkes av et relativt flatt dødislandskap med mange dødisgroper og store, lettdrenerte, tjukke sand- og grusavsetninger. Fra seinvåren til langt utpå høsten er størstedelen av dette området sjøldrenerende ved at nedbørvann siger gjennom grunnen og blir del av grunnvannet. Noen dødisgroper har myr eller små innsjøer i bunnen, men de fleste er veldrenerte. Frost i marka (marka er typisk frossen fra november–desember til april–mai) forhindrer imidlertid dreneringen, alle groper i terrenget fylles etter hvert med vann (og snø) som fryser til. Så lenge marka er frosset fortsetter vannstanden å stige til den eventuelt når en terskel. Da renner ytterligere vanntilførsel bort som overflatevann. Snøsmeltingen om våren medfører store vanntilførsler til den fortsatt frosne marka, og fyller groper som ikke allerede er fylt med vann ytterligere. Først når frosten i marka tiner opp godt utpå våren, begynner vannstanden å synke, først sakte, deretter raskere. I april–mai blir marka igjen tørrlagt, etter flere måneders nedsenking i mer eller mindre stagnerende vann. Sand- og grussedimentene tørker da raskt opp og marka blir sterkt tørkingsutsatt i tørre somre.
	Mark som gjennomgår en slik årssyklus med vannakkumulering gjennom mange måneder og gradvis tørrlegging og til sist uttørking av marka gjennom sommeren, for så å fylles opp på ny gjennom neste vinter, har en artssammensetning med så mange kjennetegn felles med flommarker med et normalt flomregime, at de utvilsomt plasserer seg sammen med disse i en og samme hovedtype; T18 Åpen flomfastmark. Samtidig setter det spesielle flomregimet et tydelig særpreg på miljøforhold og artssammensetning, som tentativt svarer til en betydelig forskjell i artssammensetning. Karakteristiske arter er bleikfiol (Viola persicifolia), trådsiv (Juncus filiformis), åkermynte (Mentha arvensis) og myrmaure (Galium palustre). Flomregime (FR) beskriver forskjellen mellom et normalt flomregime og et flomregime preget av forlenget oversvømmelse, slik vi finner på Gardermo-sletta. Det er uvisst om tilsvarende flomregime finnes andre steder i landet.
	I NiN versjon 1 ble dette spesielle flomregimet beskrevet som negativ massebalanse, og i tidlige framlegg til NiN versjon 2 (NiNnot124) som erosjonsutsatthet. Det faktum at flomregimet som preget dødislandskapet på Gardermo-sletta ikke i særlig grad innebærer sedimentasjon (fordi flomvannets transportkapasitet er liten), medfører imidlertid ikke at erosjon er den utslagsgivende prosessen. Mer sannsynlig er det at vannet heller ikke har noen sterk eroderende effekt, men at det er det spesielle flomregimet i seg sjøl, med langvarig oversvømmelse, i kombinasjon med et lettdrenert substrat som i perioder er sterkt uttørkingsutsatt, som er hovedårsakene til den spesielle artssammensetningen.
	Årssyklusen i dødisgropene på Gardermo-sletta har likhetstrekk med årssyklusen i dødisgropene lengst nord på Østlandet, der klimaet er mer kontinentalt med mindre nedbør og lengre perioder med frossen mark. Der fryser marka raskt inn i is, og den beskjedne nedbøren som kommer har også en tendens til å ende opp som is. Artssammensetningen blir dermed preget av arter som tåler isinnfrysing i stedet for arter som tåler langvarig oversvømming. Dette isforstyrrelsesregimet blir beskrevet ved hjelp av isbetinget forstyrrelse (IF).
''',
)