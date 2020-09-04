# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% SE
se_lec = LEC(
    _id='SE',
    structuringProcess_id='D',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=1,
    spatialScale=6,
)
se_lec_info_en = LECInfo(
    language_id='en',
    lec=se_lec,
    name='Sedimentation intensity',
    description='Variation in the intensity of sedimentation in freshwater and marine sites where decelerating river water loses its mass transportation capacity and sedimentation regularly dominates over ero-sion, typically found in the outer parts of deltas; at high intensity ending in a species-thinning situation',
)
se_lec_info_nb = LECInfo(
    language_id='nb',
    lec=se_lec,
    name='Sedimentbasert forstyrrelse',
    description='''Massebalansen (hvorvidt materiale tilføres eller fjernes) er en svært viktig miljøvariabel i mange natursystemer. Massebalansen er negativ når substratet eroderes (i og langs elver først og fremst på steder der vannhastigheten er økende) og positiv når nytt substrat akkumuleres (først og fremst der vannhastigheten er avtakende, hvor transportert suspendert materiale sedimenteres). I havet og i større innsjøer er normalsituasjonen svak sedimentasjon fordi det meste av det tilførte materialet sedimenteres og blir ikke fjernet. Sedimentasjonsbasert forstyrrelse (SE) adresserer forstyrrelseseffekter av vedvarende, sterk sedimentasjon i ferskvannsbunnsystemer og saltvannsbunnsystemer. Sedimentasjon finner først og fremst sted i ytre deler av deltaområder utenfor utløpet av breelver og andre elver som transporterer mye masse. Der finner det sted en gradert sedimentasjon, slik at de største (tyngste) partiklene sedimenteres innerst, det minste (letteste) ytterst. Også forekomsten av moving dunes på saltvannsbunn kan muligens ses på som sedimentbasert forstyrrelse (SE).
	Til grunn for basistrinninndelingen av sedimentbasert forstyrrelse (SE) er lagt at dette er en artsuttynningsgradient, der artsuttynningsintervallet starter allerede ved overgangen mellom trinnene ER∙0 og ER∙a og at endepunktet befinner seg der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i) skal da sedimentbasert forstyrrelse (SE) deles i fire basistrinn.
	Også vannforstyrrelsesintensitet (VF) adresserer effekter av vann som forstyrrelsesagens i ferskvannssystemer, men VF adresserer mark/bunn med balanse mellom sedimentasjon og erosjon (SE∙0), og mellom vannets forstyrrelseseffekt og substratets kornstørrelsesfordeling. Sedimentasjonsbasert forstyrrelse (SE) er motsatsen til erosjonsutsatthet (ER) i den forstand at ER adresserer forstyrrelseseffekter av gjentatte erosjonsepisoder.
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='SE.0',
    lec=se_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='without sedimentation'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='good mass balance; balance between supply (sedimentation) and removal (erosion) of material'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='uten sedimentasjonspreg'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='god massebalanse; balanse mellom tilførsel (sedimentasjon) og fjerning (erosjon) av materiale'
)
# a
a_elem_segment=ElementarySegment(
    _id='SE.a',
    lec=se_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='slightly sedimentary'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='good mass balance; balance between supply (sedimentation) and removal (erosion) of material'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='litt sedimentasjonspreget'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='svakt positiv massebalanse, men med artssammensetning som bærer observerbart preg av sedimentasjon'
)
# b
b_elem_segment=ElementarySegment(
    _id='SE.b',
    lec=se_lec,
    value='b',
    order=2,
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='clearly sedimentation-characterized'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='clearly positive mass balance; the substrate is supplied with clearly more new material by sedimentation than the amount of material eroded away; the species composition consists primarily of sedimentation-tolerant species'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='klart sedimentasjons-preget'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='klart positiv massebalanse; substratet tilføres klart mer nytt materiale ved sedimentasjon enn mengden materiale som eroderes vekk; artssammensetningen består først og fremst av sedimentasjonstolerante arter'
)
# all
all_elem_segment=ElementarySegment(
    _id='SE.¤',
    lec=se_lec,
    value='¤',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<class>',
    value='characterized by disruptive sedimentation'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<description>',
    value='sedimentation with such a high intensity (combination of strong disturbance and high disturbance frequency) that the establishment and maintenance of permanent populations of site-associated organisms is prevented'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<class>',
    value='preget av disruptiv sedimentasjon'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<description>',
    value='sedimentasjon med så høy intensitet (kombinasjon av sterk forstyrrelsesgrad og høy forstyrrelsesfrekvens) at etablering og opprettholdelse av permanente populasjoner av stedstilknyttete organismer forhindres'
)
