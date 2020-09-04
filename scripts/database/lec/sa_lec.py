# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

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
    language_id='en',
    lec=sa_lec,
    name='Marine salinity',
    description='Variation in salinity (halinity), i.e., the concentration of salts, in water-mass and bottom and ground ecosystems in contact with or otherwise influenced by seasalt-enriched water; this LEC runs from hypohaline (fresh) water, defined as water with salinity < 0.5‰, via oligohaline, mesohaline, poly-haline and euhaline waters to metahaline ocean wa-ter with salinity typically in the range 34.2–35.5‰',
)
sa_lec_info_nb = LECInfo(
    language_id='nb',
    lec=sa_lec,
    name='Marin salinitet',
    description='''Variasjon i vannets og bunnen/markas salinitet (saltholdighet) er en viktig årsak til variasjon i artssammensetning i saltvannssystemer og områder i umiddelbar tilknytning til disse (først og fremst i fjærebeltesystemer). Marin salinitet (SA) er viktig over et stort spenn av romlige skalaer og naturtypenivåer. Saliniteten avtar generelt fra det åpne havet innover i fjordene. På lokal skala finnes variasjon i salinitet for eksempel nær utløpet av elver og bekker, og i forsenkninger som i perioder tilføres saltvann som kan stå og fordampe. Marin salinitet (SA) er en kompleks miljøgradient som består av flere enkeltgradienter med variasjon som bare delvis faller sammen. Viktigst er ’normalsaliniteten’, for eksempel definert som gjennomsnittlig saltholdighet i det havvannet som fjærebelte- eller saltvannsbunnen er i kontakt med. Andre viktige enkeltgradienter er maksimums- og minimumssaliniteten, for eksempel definert som den høyeste respektivt laveste saltholdigheten i bunnen/marka på et gitt sted i løpet av en gitt tidsperiode. Minimumssaliniteten har betydning for utbredelsen av dypvannsarter i fjorder. Relasjonen mellom normalsalinitet og maksimalsalinitet kan sammenliknes med relasjonen mellom vannmetning (VM) og uttørkingsfare (UF) i fastmarkssystemer; vannmetning (VM) gir utrykk for normal markfuktighet og uttørkingsfare (UF) gir uttrykk for risikoen for ekstremtørke. Til forskjell fra fuktighetsrelaterte komplekse miljøvariabler i fastmarkssystemer og våtmarkssystemer, er samvariasjonen mellom normal- og maksimalsaliniteten sterk, bortsett fra på steder der periodevis stagnerende saltvann får fordampe (pøler, litoralbasseng og saltenger) slik at saliniteten øker over normalnivået (hypersalinitetsepisoder). 
	Alt vann (og all jord) inneholder salter (i kjemisk betydning; det vil si vannløselige faste stoffer med krystallstruktur, dannet i reaksjon mellom en base eller et metall og en syre). Begrepet marin salinitet (saltholdighet) er imidlertid først og fremst knyttet til saltvannsinfluert vann, bunn eller mark, og trinn langs marin salinitet (SA) kan ordnes i en såkalt thalassisk serie etter økende konsentrasjon av salter som stammer fra havvann. Salinitet er det vanligst brukte begrepet for denne variasjonen, men også begrepet halinitet er i bruk. Begrepet halinitet refererer til forekomst av halider (halogenenes anioner; spesielt klorid-ionet Cl–), som er de anionene som er rikeligst representert i havsaltene. Begrepene salinitet og halinitet brukes til dels om hverandre. Ettersom det er den totale saltholdigheten som har biologisk betydning og ikke halidionekonsentrasjonen, blir begrepet marin salinitet benyttet i NiN. Internasjonale begreper har imidlertid ‘halin som suffiks.
	Trinndelingen av marin salinitet (SA) er tentativ og tar utgangspunkt i variasjonen i pelagisk fauna fra ferskvannstilknyttete til saltvannstilknyttete arter, der det antas at hele artssammensetningen skiftes ut og at det i tillegg finnes spesialiserte brakkvannstilknyttete arter. Trinnet SA∙g er inkludert for å ta høyde for at forskjeller i artssammensetning mellom kyst- og fjordvann (og arktisk vann) på den ene siden og atlantisk vann på den andre siden kan være betinget av salinitetsforskjeller. Grensa mellom disse vannmassetypene ved 34,8 ‰ svarer til grensa mellom euhalint og metahalint vann hos Hansen & Østerhus (2000: Tabell 2). 
	Tilpasninger til hypersalinitetsforhold medfører variasjon i artssammensetning som ikke bare kan ses på som en forlengelse av artssammensetningsgradienten langs marin salinitet (SA) og er derfor behandlet som en separat LKM, saltanriking av mark i fjærebeltet (SF). Trinnet SA∙+ utgjør derfor et overgangstrinn mellom de to gradientene.
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='SA.0',
    lec=sa_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='fresh (hypohaline)'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='not salt affected'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='salt concentration (‰)',
    value='<0.5'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='fersk (hypohalin)'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='ikke saltpåvirket'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='saltkonsentrasjon (‰)',
    value='<0,5'
)
# a
a_elem_segment=ElementarySegment(
    _id='SA.a',
    lec=sa_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='slightly brakish (oligohaline)'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='litt saltpåvirket'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='salt concentration (‰)',
    value='0.5-5'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='litt brakk (oligohalin)'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='litt saltpåvirket'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='saltkonsentrasjon (‰)',
    value='0,5-5'
)
# bc
bc_elem_segment=ElementarySegment(
    _id='SA.bc',
    lec=sa_lec,
    value='bc',
    relative_order=2
)
ElementarySegment(
    _id='SA.b',
    lec=sa_lec,
    value='b',
    order=2,
    relative_order=0,
    parent=bc_elem_segment
)
ElementarySegment(
    _id='SA.c',
    lec=sa_lec,
    value='c',
    order=3,
    relative_order=1,
    parent=bc_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='en',
    key='<class>',
    value='pretty brackish (mesohalin)'
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='en',
    key='<description>',
    value='rather salty'
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='en',
    key='salt concentration (‰)',
    value='5-18'
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='nb',
    key='<class>',
    value='temmelig brakk (mesohalin)'
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='nb',
    key='<description>',
    value='temmelig saltpåvirket'
)
ElementarySegmentInfo(
    elementarySegment=bc_elem_segment,
    language_id='nb',
    key='saltkonsentrasjon (‰)',
    value='5-18'
)
# de
de_elem_segment=ElementarySegment(
    _id='SA.de',
    lec=sa_lec,
    value='de',
    relative_order=3
)
ElementarySegment(
    _id='SA.d',
    lec=sa_lec,
    value='d',
    order=4,
    relative_order=0,
    parent=de_elem_segment
)
ElementarySegment(
    _id='SA.e',
    lec=sa_lec,
    value='e',
    order=5,
    relative_order=1,
    parent=de_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='en',
    key='<class>',
    value='rather salty (polyhaline)'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='en',
    key='<description>',
    value='svært saltpåvirket'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='en',
    key='salt concentration (‰)',
    value='18-30'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='nb',
    key='<class>',
    value='temmelig salt (polyhalin)'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='nb',
    key='<description>',
    value='svært saltpåvirket'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='nb',
    key='saltkonsentrasjon (‰)',
    value='18-30'
)
# f
f_elem_segment=ElementarySegment(
    _id='SA.f',
    lec=sa_lec,
    value='f',
    order=6,
    relative_order=4
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='en',
    key='<class>',
    value='normal salt (euhalin)'
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='en',
    key='<description>',
    value='very salty'
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='en',
    key='salt concentration (‰)',
    value='30-34.8'
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='nb',
    key='<class>',
    value='normalsalt (euhalin)'
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='nb',
    key='<description>',
    value='svært saltpåvirket'
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='nb',
    key='saltkonsentrasjon (‰)',
    value='30-34,8'
)
# plus
plus_elem_segment=ElementarySegment(
    _id='SA.+',
    lec=sa_lec,
    value='+',
    order=7,
    relative_order=5
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='<class>',
    value='weakly salt-rich (weakly metahaline)'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='<description>',
    value='normal salt'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='salt concentration (‰)',
    value='34.8-35.5'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='<class>',
    value='svakt saltanriket (svakt metahalin)'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='<description>',
    value='normalsalt'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='saltkonsentrasjon (‰)',
    value='34,8-35,5'
)
