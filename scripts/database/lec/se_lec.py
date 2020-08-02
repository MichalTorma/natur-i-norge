# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

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
    language=en_language,
    lec=se_lec,
    name='Sedimentation intensity',
    description='Variation in the intensity of sedimentation in freshwater and marine sites where decelerating river water loses its mass transportation capacity and sedimentation regularly dominates over ero-sion, typically found in the outer parts of deltas; at high intensity ending in a species-thinning situation',
)
se_lec_info_nb = LECInfo(
    language=nb_language,
    lec=se_lec,
    name='Sedimentbasert forstyrrelse',
    description='''Massebalansen (hvorvidt materiale tilføres eller fjernes) er en svært viktig miljøvariabel i mange natursystemer. Massebalansen er negativ når substratet eroderes (i og langs elver først og fremst på steder der vannhastigheten er økende) og positiv når nytt substrat akkumuleres (først og fremst der vannhastigheten er avtakende, hvor transportert suspendert materiale sedimenteres). I havet og i større innsjøer er normalsituasjonen svak sedimentasjon fordi det meste av det tilførte materialet sedimenteres og blir ikke fjernet. Sedimentasjonsbasert forstyrrelse (SE) adresserer forstyrrelseseffekter av vedvarende, sterk sedimentasjon i ferskvannsbunnsystemer og saltvannsbunnsystemer. Sedimentasjon finner først og fremst sted i ytre deler av deltaområder utenfor utløpet av breelver og andre elver som transporterer mye masse. Der finner det sted en gradert sedimentasjon, slik at de største (tyngste) partiklene sedimenteres innerst, det minste (letteste) ytterst. Også forekomsten av moving dunes på saltvannsbunn kan muligens ses på som sedimentbasert forstyrrelse (SE).
	Til grunn for basistrinninndelingen av sedimentbasert forstyrrelse (SE) er lagt at dette er en artsuttynningsgradient, der artsuttynningsintervallet starter allerede ved overgangen mellom trinnene ER∙0 og ER∙a og at endepunktet befinner seg der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i) skal da sedimentbasert forstyrrelse (SE) deles i fire basistrinn.
	Også vannforstyrrelsesintensitet (VF) adresserer effekter av vann som forstyrrelsesagens i ferskvannssystemer, men VF adresserer mark/bunn med balanse mellom sedimentasjon og erosjon (SE∙0), og mellom vannets forstyrrelseseffekt og substratets kornstørrelsesfordeling. Sedimentasjonsbasert forstyrrelse (SE) er motsatsen til erosjonsutsatthet (ER) i den forstand at ER adresserer forstyrrelseseffekter av gjentatte erosjonsepisoder.
''',
)