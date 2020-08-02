# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% SA
sa_lec = LEC(
    _id='SA',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=4,
    spatialScale=4,
)
sa_lec_info_en = LECInfo(
    language=en_language,
    lec=sa_lec,
    name='Marine salinity',
    description='Variation in salinity (halinity), i.e., the concentration of salts, in water-mass and bottom and ground ecosystems in contact with or otherwise influenced by seasalt-enriched water; this LEC runs from hypohaline (fresh) water, defined as water with salinity < 0.5‰, via oligohaline, mesohaline, poly-haline and euhaline waters to metahaline ocean wa-ter with salinity typically in the range 34.2–35.5‰',
)
sa_lec_info_nb = LECInfo(
    language=nb_language,
    lec=sa_lec,
    name='Marin salinitet',
    description='''Variasjon i vannets og bunnen/markas salinitet (saltholdighet) er en viktig årsak til variasjon i artssammensetning i saltvannssystemer og områder i umiddelbar tilknytning til disse (først og fremst i fjærebeltesystemer). Marin salinitet (SA) er viktig over et stort spenn av romlige skalaer og naturtypenivåer. Saliniteten avtar generelt fra det åpne havet innover i fjordene. På lokal skala finnes variasjon i salinitet for eksempel nær utløpet av elver og bekker, og i forsenkninger som i perioder tilføres saltvann som kan stå og fordampe. Marin salinitet (SA) er en kompleks miljøgradient som består av flere enkeltgradienter med variasjon som bare delvis faller sammen. Viktigst er ’normalsaliniteten’, for eksempel definert som gjennomsnittlig saltholdighet i det havvannet som fjærebelte- eller saltvannsbunnen er i kontakt med. Andre viktige enkeltgradienter er maksimums- og minimumssaliniteten, for eksempel definert som den høyeste respektivt laveste saltholdigheten i bunnen/marka på et gitt sted i løpet av en gitt tidsperiode. Minimumssaliniteten har betydning for utbredelsen av dypvannsarter i fjorder. Relasjonen mellom normalsalinitet og maksimalsalinitet kan sammenliknes med relasjonen mellom vannmetning (VM) og uttørkingsfare (UF) i fastmarkssystemer; vannmetning (VM) gir utrykk for normal markfuktighet og uttørkingsfare (UF) gir uttrykk for risikoen for ekstremtørke. Til forskjell fra fuktighetsrelaterte komplekse miljøvariabler i fastmarkssystemer og våtmarkssystemer, er samvariasjonen mellom normal- og maksimalsaliniteten sterk, bortsett fra på steder der periodevis stagnerende saltvann får fordampe (pøler, litoralbasseng og saltenger) slik at saliniteten øker over normalnivået (hypersalinitetsepisoder). 
	Alt vann (og all jord) inneholder salter (i kjemisk betydning; det vil si vannløselige faste stoffer med krystallstruktur, dannet i reaksjon mellom en base eller et metall og en syre). Begrepet marin salinitet (saltholdighet) er imidlertid først og fremst knyttet til saltvannsinfluert vann, bunn eller mark, og trinn langs marin salinitet (SA) kan ordnes i en såkalt thalassisk serie etter økende konsentrasjon av salter som stammer fra havvann. Salinitet er det vanligst brukte begrepet for denne variasjonen, men også begrepet halinitet er i bruk. Begrepet halinitet refererer til forekomst av halider (halogenenes anioner; spesielt klorid-ionet Cl–), som er de anionene som er rikeligst representert i havsaltene. Begrepene salinitet og halinitet brukes til dels om hverandre. Ettersom det er den totale saltholdigheten som har biologisk betydning og ikke halidionekonsentrasjonen, blir begrepet marin salinitet benyttet i NiN. Internasjonale begreper har imidlertid ‘halin som suffiks.
	Trinndelingen av marin salinitet (SA) er tentativ og tar utgangspunkt i variasjonen i pelagisk fauna fra ferskvannstilknyttete til saltvannstilknyttete arter, der det antas at hele artssammensetningen skiftes ut og at det i tillegg finnes spesialiserte brakkvannstilknyttete arter. Trinnet SA∙g er inkludert for å ta høyde for at forskjeller i artssammensetning mellom kyst- og fjordvann (og arktisk vann) på den ene siden og atlantisk vann på den andre siden kan være betinget av salinitetsforskjeller. Grensa mellom disse vannmassetypene ved 34,8 ‰ svarer til grensa mellom euhalint og metahalint vann hos Hansen & Østerhus (2000: Tabell 2). 
	Tilpasninger til hypersalinitetsforhold medfører variasjon i artssammensetning som ikke bare kan ses på som en forlengelse av artssammensetningsgradienten langs marin salinitet (SA) og er derfor behandlet som en separat LKM, saltanriking av mark i fjærebeltet (SF). Trinnet SA∙+ utgjør derfor et overgangstrinn mellom de to gradientene.
''',
)