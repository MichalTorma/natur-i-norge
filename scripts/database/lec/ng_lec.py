# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% NG
ng_lec = LEC(
    _id='NG',
    structuringProcess_id='S',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=1,
)
ng_lec_info_en = LECInfo(
    language_id='en',
    lec=ng_lec,
    name='Natural manuring',
    description='Variation in the amounts of N and P supplied (to the ground) by wild animals, e.g., seabirds, geese and reindeer; ends in a species-thinning situation typically with few plant species tolerant of hypertrophic conditions present',
)
ng_lec_info_nb = LECInfo(
    language_id='nb',
    lec=ng_lec,
    name='Naturlig gjødsling',
    description='''Naturlig gjødsling forekommer først og fremst i natur med svært høy tetthet av fugl (fuglefjell; natursystem-hovedtypene fugleberg og fuglefjell-eng), men også i annen natur kan artssammensetningen ha svakt eller moderat preg av naturlig gjødsling (for eksempel mosetundra). I noen grad kan også ekskrementer fra andre dyrearter, som for eksempel stasjonære reinsdyrstammer på Svalbard, resultere i lokal variasjon i artssammensetning relatert til gjødslingsintensitet. Uavhengig av hvilken dyregruppe som forårsaker gjødslingseffekten, gjenspeiler naturlig gjødsling (NG) variasjon i totalkonsentrasjonene av nitrogen og fosfor i jordsmonnet, som er mer eller mindre uavhengig av ’normal’ variasjon i mineralnæringstilgang, som kommer til uttrykk langs kalkinnhold (KA). I natur som ikke er påvirket av fuglegjødsling samvarierer imidlertid nitrogen og fosfor (sterkt) med substratets generelle mineralnæringsinnhold (kalkinnholdet). Naturlig gjødsling (NG) må ikke forveksles med tilstandsvariabelen eutrofieringstilstand (EU) som adresserer menneskebetinget variasjon i nitrogentilførsel, ved langtransportert eller fra lokal forurensning, som er en viktig kilde til variasjon i artssammensetning i en rekke natursystemer innenfor natursystem-hovedtypegruppene fastmarkssystemer, våtmarkssystemer og ferskvannssystemer.
	Til grunn for basistrinninndelingen av naturlig gjødsling (NG) er lagt at dette er en gradient som ender i et artsuttynningsintervall, at artsuttynningsintervallets nedre endetrinn er NG∙b, og at gradientens naturlige øvre endetrinn NG∙¤er der disruptivt miljøstress forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da erosjonsutsatthet (ER) deles i seks basistrinn.
''',
)