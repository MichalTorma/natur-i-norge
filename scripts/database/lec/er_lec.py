# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% ER
er_lec = LEC(
    _id='ER',
    structuringProcess_id='D',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=8,
)
er_lec_info_en = LECInfo(
    language_id='en',
    lec=er_lec,
    name='Erosion intensity',
    description='Variation in the intensity of water-mediated disturbance on river bottoms and the adjacent flooded ground, in sites where erosion clearly dominates over sedimentation (e.g., along seasonal meltwater rivers with negligible sediment transport); ends in a species-thinning situation.',
)
er_lec_info_nb = LECInfo(
    language_id='nb',
    lec=er_lec,
    name='Erosjonsutsatthet',
    description='''Massebalansen (hvorvidt materiale tilføres eller fjernes) er en svært viktig miljøvariabel i mange natursystemer. Massebalansen er negativ når substratet eroderes (i og langs elver først og fremst på steder der vannhastigheten er økende) og positiv når nytt substrat akkumuleres (først og fremst der vannhastigheten er avtakende, hvor transportert suspendert materiale sedimenteres). Erosjonsutsatthet (ER) adresserer effekter av vannforstyrrelse som er relatert til massebalansen i ferskvannsbunnsystemer og flommarker langs rennende vann. Denne LKM skiller steder der vannet tidligere har fjernet alt materialet den enkelt har transportkompetanse til å fjerne (og som nå tilføres små eller ubetydelige sedimentmengder og derfor utsettes for erosjon) fra steder med god balanse mellom tilførsel (sedimentasjon) og fjerning (erosjon) av sedimenter. Den blir benyttet til å beskrive forskjellen i T30 Flomskogsmark mellom erosjonspregete krattsamfunn på grove sedimenter langs store elver, på Østlandet typisk dominert av doggpil (Salix daphnoides), fra mer sedimentasjonsutsatte krattsamfunn typisk dominert av mandelpil (Salix triandra) (se Fremstad 1981). 
	Til grunn for basistrinninndelingen av erosjonsutsatthet (ER) er lagt at dette er en artsuttynningsgradient, der artsuttynningsintervallet starter allerede ved overgangen mellom trinnene ER∙0 og ER∙a og endepunktet er der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da erosjonsutsatthet (ER) deles i fire basistrinn.
	Også vannforstyrrelsesintensitet (VF) adresserer effekter av vann som forstyrrelsesagens i ferskvannssystemer, men VF adresserer mark/bunn med balanse mellom sedimentasjon og erosjon (ER∙0), og mellom vannets forstyrrelseseffekt og substratets kornstørrelsesfordeling. Sedimentasjonsbasert forstyrrelse (SE) er motsatsen til erosjonsutsatthet (ER) i den forstand at SE adresserer forstyrrelseseffekter av vedvarende sedimentasjon.
	I tidligere framlegg til NiN versjon 2 ble også erosjonsutsatthet (ER) benyttet til å karakterisere de spesielle flommarkene i dødislandskapet på Gardermo-sletta (Ullensaker, Akershus). Disse blir i NiN versjon 2 karakterisert ved hjelp av LKM flomregime (FR).
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='ER.0',
    lec=er_lec,
    value='0',
    order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='without erosion'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='apparently good mass balance, ie balance between supply (sedimentation) and removal (erosion) of material'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='uten erosjonspreg'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='tilsynelatende god massebalanse, dvs. balanse mellom tilførsel (sedimentasjon) og fjerning (erosjon) av materiale'
)
# a
a_elem_segment=ElementarySegment(
    _id='ER.a',
    lec=er_lec,
    value='a',
    order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='slightly erosive'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='slightly negative mass balance, but with a species composition that bears an observable sign of erosion'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='litt erosjonspreget'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='svakt negativ massebalanse, men med artssammensetning som bærer observerbart preg av erosjon'
)
# b
b_elem_segment=ElementarySegment(
    _id='ER.b',
    lec=er_lec,
    value='b',
    order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='clearly erosive'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='clearly negative mass balance; the substrate is supplied with clearly less new material by sedimentation than the amount of material eroded away; the species composition consists primarily of erosion-tolerant species'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='klart erosjonspreget'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='klart negativ massebalanse; substratet tilføres klart mindre nytt materiale ved sedimentasjon enn mengden materiale som eroderes vekk; artssammensetningen består først og fremst av erosjonstolerante arter'
)
# all
all_elem_segment=ElementarySegment(
    _id='ER.¤',
    lec=er_lec,
    value='¤',
    order=3
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<class>',
    value='characterized by disruptive erosion'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<description>',
    value='erosion with such a high intensity (combination of strong disturbance and high disturbance frequency) that the establishment and maintenance of permanent populations of site-associated organisms is prevented'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<class>',
    value='preget av disruptiv erosjon'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<description>',
    value='erosjon med så høy intensitet (kombinasjon av sterk forstyrrelsesgrad og høy forstyrrelsesfrekvens) at etablering og opprettholdelse av permanente populasjoner av stedstilknyttete organismer forhindres'
)
