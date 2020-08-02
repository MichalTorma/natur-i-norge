# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% VI
vi_lec = LEC(
    _id='VI',
    structuringProcess_id='R',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=4,
    spatialScale=3,
)
vi_lec_info_en = LECInfo(
    language=en_language,
    lec=vi_lec,
    name='Vindutsatthet',
    description='''Vind gjør seg gjeldende som viktig landformdannende (og økologisk) prosess i sanddynemark der vindprosesser resulterer i stor variasjon langs primærsuksesjonsgradienten sandstabilisering (SS) (se også NiN[1] Artikkel 17). Kraftig lokal vindpåvirkning kan imidlertid også ha en forstyrrelseseffekt som snart, ved moderat økning i påvirkningsintensiteten i forhold til steder uten preg av vindpåvirkning, medfører begynnende artsuttynning og ender i disruptiv forstyrrelse i form av deflasjon (blottlegging av mineraljord etter fysisk ødeleggelse av vegetasjonen). Deflasjonsflekker er vanlig på ekstremt vindutsatte rabber i fjellet, i sanddynemark (eroderte dyner) og på særlig utsatte steder også i kystnær grus- og steinmark, f.eks. på gamle strandvoller dominert av grus på nordsiden av Varangerhalvøya.
	Vinddeflasjon er resultatet av direkte fysisk skade på vegetasjonen, f.eks. frysetørring, sand-, snø- og is-slitasje og annen mekanisk slitasje; i ekstreme tilfeller kan hele torver med vegetasjon rives opp av vinden.
	Til grunn for inndelingen av vindutsatthet (VI) i basistrinn er lagt at dette er en gradient som ender i et artsuttynningsintervall, at artsuttynningsintervallets nedre endetrinn er VI∙a, og at gradientens naturlige øvre endetrinn er der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da vindutsatthet (VI) deles i fem basistrinn.
''',
)
vi_lec_info_nb = LECInfo(
    language=nb_language,
    lec=vi_lec,
    name='Wind-mediated disturbance intensity',
    description='Variation in the intensity of wind-mediated disturbance in open sites such as sand dunes and alpine ridges; ending in a species-thinning situation at disruptively wind-deflated sites; moderately wind-disturbed alpine ridges have a characteristic species composition dominated by yellow lichens'
)
