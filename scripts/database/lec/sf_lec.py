# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% SF
sf_lec = LEC(
    _id='SF',
    structuringProcess_id='S',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=3,
    spatialScale=2,
)
sf_lec_info_en = LECInfo(
    language_id='en',
    lec=sf_lec,
    name='Littoral hypersalinity',
    description='Variation in the extent to which seasalt concentrations in geolittoral and supralittoral soils are elevated above normal levels due to evaporation from stagnant saline water, e.g., in temporal tidal pools and depressions in tidal meadows; ends in a species-thinning situation characterised by a few, halophyte specialists',
)
sf_lec_info_nb = LECInfo(
    language_id='nb',
    lec=sf_lec,
    name='Saltanriking av mark i fjærebeltet',
    description='''Variasjon i vannets saltinnhold fra ferskvann til saltvann med normalt saltinnhold er en viktig årsak til variasjon i artssammensetning i saltvannssystemer og områder i umiddelbar tilknytning til disse (først og fremst fjærebeltesystemer). Marin salinitet (SA) benyttes for å beskrive denne variasjonen, både i vann og i bunn/mark. Enkelte steder i fjærebeltet, der stagnerende saltvann får stå i lengre perioder og fordampe (pøler, litoralbasseng og saltenger), øker markas salinitet over normalnivået (hypersalinitetsepisoder). Tilpasninger til hypersaline forhold medfører variasjon i artssammensetning som ikke bare kan ses på som en forlengelse av artssammensetningsgradienten langs marin salinitet (SA). Saltanriking av mark i fjærebeltet (SF) er derfor er behandlet som en separat lokal kompleks miljøvariabel i NiN 2. 
	Til grunn for basistrinninndelingen av saltanriking av mark i fjærebeltet (SF) er lagt at dette er en artsuttynningsgradient, der artsuttynningsintervallet starter allerede ved overgangen mellom trinnene ER∙0 og ER∙a og at endepunktet for gradienten befinner seg der disruptivt miljøstress forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da saltanriking av mark i fjærebeltet (SF) deles i fire basistrinn.
''',
)