# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% SU
su_lec = LEC(
    _id='SU',
    structuringProcess_id='D',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=3,
    spatialScale=4,
)
su_lec_info_en = LECInfo(
    language_id='en',
    lec=su_lec,
    name='Landslide intensity',
    description='Variation in the intensity of disturbance by landslides in clay- to gravel-dominated quaternary deposits; the term ‘landslide’ is used for situations where a part of the substrate with its biomass is detached and new mineral material is exposed; ends in a species-thinning situation at which a primary succession is initiated after each landslide event',
)
su_lec_info_nb = LECInfo(
    language_id='nb',
    lec=su_lec,
    name='Skredutsatthet',
    description='''Med skred menes spontan utrasing og nedadrettet transport av stedegne materialmasser (jord-, sand-, silt- eller leirskred) i en skråning, forårsaket av erosjon nedenfra eller fra sidene, eller av prosesser i massene. Skred, til forskjell fra ras (forstyrrelse i skråning forårsaket av at snø-, is- eller vannmasser passerer over marka), innebærer at marka med sitt innhold av organismer, går tapt og at ny mark eksponeres. Skred innebærer derfor (i utgangspunktet) en mer gjennomgripende forstyrrelse av marka enn ras, og innebærer starten på et primærsuksesjonsforløp.
	Skredutsatthet (SU) adresserer intensiteten i forstyrrelseseffekten av skred slik denne gir seg utslag i artssammensetningen, sammenliknet med tilsvarende mark som ikke utsettes for skred. Fordi skredintensiteten varierer [intensiteten av en forstyrrelse, eller dens omfang; bestemmes av tre ’dimensjoner’: grad (severity), frekvens (recurrence) og romlig utstrekning (spatial extent)], og denne variasjonen gir seg utslag i hvor sterkt artssammensetningen på skredutsatt mark avviker fra artssammensetningen på sammenliknbar, ikke skredutsatt mark, blir skredutsatthet (SU) beskrevet som en kompleks miljøgradient. Variasjonen i artssammensetning som respons på variasjon i skredutsatthet (SU) vil imidlertid bare være kontinuerlig inntil det punktet der skredintensiteten passer ei grense, først og fremst med hensyn til grad og romlig utstrekning, og skred forekommer så sjelden, at skredområdet vil fungere som et eget økosystem preget av historisk disruptiv forstyrrelse og gå inn i en langsom primær suksesjon (LA). Hvor stor forskjell i artssammensetningen i forhold til sammenliknbar, ikke skredutsatt natur som kan forekomme før denne grensa passeres, vil sannsynligvis variere mellom natursystemer. Skredutsatthet (SU) er tentativt delt inn i tre basistrinn mellom MU∙0 (ikke skredutsatt mark) og endetrinnet MU∙¤, som inneholder mark preget av historisk disruptiv forstyrrelse og som etter kriteriene for hovedtypeinndeling skal tilordnes en annen hovedtype (jf. NiN[2] Artikkel 1, kapittel B4). Til grunn for trinninndelingen er lagt at det finnes et mellom-basistrinn før artsuttynning inntreffer (i trinn MU∙b), og at det er rom for ett basistrinn før disruptiv forstyrrelse inntreffer. Det finnes imidlertid ikke empirisk materiale som rettferdiggjør mer enn ett basistrinn (i skredutsatt fastmarksskogsmark; se NiN[2] Artikkel 2, kapittel B9).
	Små, hyppige skred resulterer i at mineraljord blottlegges ofte nok til at artssammensetningen får innslag av arter som prefererer eller tolererer denne formen for forstyrrelse (f.eks. små mosearter som har evne til rask kolonisering av ny mark, og karplantearter som er avhengig av blottlagt mineraljord for å spire).
''',
)