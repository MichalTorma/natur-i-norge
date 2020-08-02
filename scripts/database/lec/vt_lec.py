# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% VT
vt_lec = LEC(
    _id='VT',
    structuringProcess_id='S',
    patternOfVariation_id='f',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=3,
    spatialScale=8,
)
vt_lec_info_en = LECInfo(
    language=en_language,
    lec=vt_lec,
    name='Vanntilførsel',
    description='''Våtmarkenes vanntilførsel har lenge vært regnet som en viktig kilde til forskjeller mellom ulike kategorier av våtmarkssystemer. Allerede von Post & Granlund (1926) skilte mellom tre typer av ‘markblöta’; topogen (forårsaket av grunnvann med tilnærmet plant grunnvannsspeil), ombrogen (vanntilførsel utelukkende fra nedbøren) og soligen (forårsaket av grunnvann med hellende grunnvannsspeil). Markfuktighetens karakter og betydning drøftes av Sjörs (1948), som benytter samlebetegnelsen geogen for topogen og soligen vanntilførsel (hans engelske oversettelse av ‘markblöta’ er ‘wet of soil’) og peker på at disse går gradvis over i hverandre og ikke resulterer i klart forskjellige effekter på artssammensetningen. Han legger også til en fjerde kategori, limnogen vanntilførsel (tilførsel av flomvann fra innsjøer og elver), men skriver samtidig at det limnogene vannet hovedsakelig stammer fra geogent vann ‘och dess verkan på blötmarkernas vegetation avviker därför föga från det geogena vattnets.’ Som en femte kategori kunne rheogen vanntilførsel (tilførsel av kildevann vært nevnt).
	Myrvegetasjonsøkologien har hovedsakelig beskjeftiget seg med våtmarkssystemer med geogen og ombrogen vanntilførsel. Analyser av generaliserte datasett B01 og B12 viser at det er betydelig forskjell i artssammensetning mellom disse to vanntilførselskategoriene, og at de må opprettholdes som basiskategorier innenfor den komplekse miljøfaktoren vanntilførsel (VT). Rheogen vanntilførsel fanges opp av den komplekse miljøgradienten kildevannspåvirkning (KI) som adresserer effekter av gradvise økningen i innflytelse fra vann med kildevannsegenskaper. Dersom Sjörs’ oppfatning om forskjellen mellom geogent og limnogen vanntilførsel er riktig, er det ikke grunnlag for flere enn to kategorier innenfor vanntilførsel (VT). Analyser av generalisert datasett B12D (NiN[2] Artikkel 2, kapittel B12e) påviser imidlertid betydelige forskjeller i artssammensetning mellom myrskogsmarker som bare tilføres topogent vann (det vil si som ikke forekommer i tilknytning til innsjøer) og flommyrer langs innsjøer. I NiN versjon 1 ble ‘flommyr’ utskilt som egne grunntyper for myrer langs elver innenfor hovedtypen ‘flommyr, myrkant og myrskogsmark’ på grunnlag av følgende resonnement: ‘Den limnogene vanntilførselen til flommyr medfører både at det tilføres mineralnæring (sand- og siltkorn) og en viss utvasking av mineralkorn og mineralnæringsstoffer. Flomvannet består av regnvann som er blandet med jordvann fra hele nedbørfeltet. Egenskapene til flomvannet blir derfor ’utjevnet’ sammenliknet med vann fra mindre nedbørfelt.’ Sjøl om det ikke foreligger empiriske data fra flommyrer langs elver, indikerer observasjoner (R. Halvorsen, pers. obs.) at disse flommyrene kan ha en artssammensetning som skiller seg observerbart eller betydelig fra myrer som tilføres soligent grunnvann. Vanntilførsel (VT) er derfor delt i fire klasser hvorav klassen for geogen vanntilførsel er et normaltrinn.
''',
)
vt_lec_info_nb = LECInfo(
    language=nb_language,
    lec=vt_lec,
    name='Categories of prevailing water supply',
    description='Complex environmental factor that sorts wetlands into four categories by prevailing water supply: ombrogenous (water from precipitation only), geogenous or minerogenous (some of the supplied water has been in contact with mineral soil), limno-topogenous (lake water), and limno-soligenous (river water)',
)
