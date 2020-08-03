# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% HI
hi_lec = LEC(
    _id='HI',
    structuringProcess_id='D',
    patternOfVariation_id='g',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=5,
    spatialScale=6,
)
hi_lec_info_en = LECInfo(
    language_id='en',
    lec=hi_lec,
    name='Land management intensity',
    description='Variation in the intensity of agricultural land management activities, including related anthropogeneous impacts not intended to increase production; running from natural sites with no traces of management, via extensively managed (e.g.,  by grazing, haymaking or prescribed burning), semi-natural sites to intensively managed sites (managed by ploughing, fertilisation, treatment with herbicides and sowing of crops)',
)
hi_lec_info_nb = LECInfo(
    language_id='nb',
    lec=hi_lec,
    name='Hevdintensitet',
    description='''Hevd, i motsetning til annen menneskebetinget forstyrrelse, defineres som ’regelmessig menneskebetinget aktivitet som opprettholder spesifikke naturtyper gjennom forstyrrelse, eventuelt i kombinasjon med tiltak for å fremme landbruksproduksjon; aktiviteter og påvirkninger som inkluderes i hevdbegrepet er slått, beiting og husdyrtråkk, brenning, jordbearbeiding, rydding, sprøyting, gjødsling, høsting av tresjiktet, såing og vanning; bestemte hevdbetingete naturtyper forutsetter bestemte hevdregimer’. Sammenhenger mellom ulike hevdrelaterte påvirkninger og hevdintensiteten er sammenstilt i NiN[2] Artikkel 1; Tabell B3–2 og Fig. B3–3. Hevd impliserer forstyrrelse i henhold til definisjonen av dette begrepet fordi hevden medfører fjerning av biomasse. Hevd-intensitet defineres som ’hevdens omfang, vurdert på grunnlag av grad [severity] og frekvens [recurrence]’. Definisjonen av hevd omfatter også andre menneskebetingete aktiviteter enn de som har som formål å fremme produksjon, f.eks. er slått og sprøyting av vegkanter, plenslått etc., etter definisjonen hevd. Fordi systemer tilrettelagt for jordbruksproduksjon, det vil si ’produksjon av mat, dyrefor, pryd- og nytteplanter og enkelte råvarer og tjenester for energi-, industri- eller andre formål’, skiller seg vesentlig fra andre hevdpregete systemer, blant annet med hensyn til artssammensetningen, skilles i NiN 2 mellom jordbruksmark (’mark preget av hevd med sikte på jordbruksproduksjon’) og annen hevdpreget mark. 
	Begrepene semi-naturlig hevdpreget mark og sterkt endret hevdpreget mark brukes til å karakterisere to hoveddeler av hevdintensitetsgradienten. Innenfor hver av disse kategoriene skilles mellom semi-naturlig jord-bruksmark, definert som ’jordbruksmark preget av hevd med en intensitet som resulterer i, eller opprettholder, et system som tilfredsstiller definisjonen av semi-naturlig mark’, og oppdyrka mark (= jordbruksmark preget av intensiv hevd), definert som ‘jordbruksmark som preges av hevd med en intensitet som resulterer i, eller opprettholder, et system som tilfredsstiller definisjonen av sterkt endret mark’, på hevdpreget mark med jordbruksproduksjon som hovedformål, og fra hevdpreget mark uten jordbruksproduksjon som hovedformål. 
''',
)