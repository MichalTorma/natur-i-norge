# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% SM
sm_lec = LEC(
    _id='SM',
    structuringProcess_id='R',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=1,
    spatialScale=10,
)
sm_lec_info_en = LECInfo(
    language=en_language,
    lec=sm_lec,
    name='Size-related environmental variation in marine and freshwater systems',
    description='Complex-gradient that expresses co-ordinated variation in environmental variables related to the surface area and depth of water masses, such as annual temperature amplitude (and, accordingly, the risk of overheating and freezing), hypersalinity, hypoxia and anoxia; the LEC covers variation from the open sea and large lakes to temporary pools which may lack persistent populations and thus represent a species-thinning situation',
)
sm_lec_info_nb = LECInfo(
    language=nb_language,
    lec=sm_lec,
    name='Størrelsesrelatert miljøvariabilitet (i vannsystemer)',
    description='''Miljøstabilitet (og miljøforutsigbarhet) er en viktig rammebetingelse for hvilke tilpasninger som er nødvendige for å overleve på et levested over tid. I romlig avgrensete vannforekomster (innsjøer, litoralbasseng, poller, fjorder) er størrelse (både horisontal og vertikal utstrekning) en av de viktigste prediktorer for miljøstabilitet. Størrelsen bestemmer langt på veg den årlige temperaturamplituden (maksimums- og minimumstemperaturen), og dermed faren for overoppheting og bunnfrysing, hypersalinitet og anoksi. Ett viktig skille i går mellom vannforekomster som er så grunne at de mangler sjiktning og dypere vannforekomster som to ganger årlig får ‘fornyet’ vannmassene. 
	Viktigheten av størrelsesrelatert miljøstabilitet for artssammensetning i vannforekomster kommer klart til uttrykk i Vannrammedirektivets innsjøtypologi (Anonym 2013), der to av sju ‘typologifaktorer’ (tilsvarer komplekse miljøvariabler) uttrykker størrelse; ‘Størrelse (overflateareal)’ med fire klasser [1 = små (< 0,5 km2); 2 = middels (0,5–5 km2); 3 = store (5–50 km2); 4 = svært store (> 50 km2)] og ‘Dybde innsjøer (middeldyp)’ med tre klasser [1 = svært grunn (< 3 m); 2 = grunn (3–15 m); 3 = dyp (> 15 m)]. Noen artsgrupper, som f.eks. fisk, forsvinner gradvis når innsjøene blir mindre. Men til tross for at kunnskapen om artenes fordeling langs en gradient i størrelsesrelatert miljøstabilitet er mangelfull, er det åpenbart at artssammensetningen varierer over et større spekter enn langs en rein artsuttynningsgradient når størrelsen går fra Mjøsa til en liten dam. I NiN 2er horisontal og vertikal utstrekning tentativt kombinert til én kompleks miljøvariabel som skal gi uttrykk for de to størrelsesdimensjonenes samlete betydning for miljøstabiliteten.
	Til grunn for basistrinninndelingen av størrelsesrelatert miljøvariabilitet (i vannsystemer) (SM) er lagt at gradienten ender i et artsuttynningsintervall, at artsuttynningsintervallets nedre endetrinn er SM∙d, og at gradientens naturlige øvre endetrinn er temporære vannforekomster der akvatiske arter opplever uttørking som disruptivt miljøstress som forhindrer opprettholdelse av permanente populasjoner. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da størrelsesrelatert miljøvariabilitet (i vannsystemer) (SM) deles i åtte basistrinn. I tillegg kommer trinnet g som er nødvendig for å fange opp den betydelige størrelsesrelaterte variasjonen innenfor litoralbasseng.
''',
)