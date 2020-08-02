# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% JV
jv_lec = LEC(
    _id='JV',
    structuringProcess_id='S',
    patternOfVariation='ga',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
jv_lec_info_en = LECInfo(
    language=en_language,
    lec=jv_lec,
    name='Geothermal influence',
    description='Variation in geothermal energy supplies, carried by water or gas, ranging from no influence on the species composition via increasing dominance by specialist organisms (eventually only bacteria), at >100 °C ending in a species-thinning situation; no sessile organism maintains persistent populations in such sites',
)
jv_lec_info_nb = LECInfo(
    language=nb_language,
    lec=jv_lec,
    name='Jordvarmeinnflytelse',
    description='''Jordvarme (JV) er uttrykk for intensitet i tilførsler av geotermisk energi utover det normale for et gitt område. Jordvarmeinfluert natur finnes på land, i våre områder med vann som varmebærer (varm kilde), og på havbunnen (varm havkilde) med vann eller gass som varmebærere. Liksom variasjonen i graden av kildestyrke (konsentrert kildevannstilførsel) fra kildesentrum til kildeperiferi i kaldkilde, varierer graden av jordvarmeinnflytelse fra sentrum til periferi i varm kilde og i varm havkilde. 
	Jordvarmeinfluerte kildeområder (JV∙ab) forekommer på Spitsbergen som et fåtall små ’øyer’ av varm kilde, og på havbunnen flere steder (alle trinn) tilknytning til den midtatlantiske rygg (f.eks. Lokeslottet og Mohnryggen).
	Til grunn for basistrinninndelingen av jordvarmeinnflytelse (JV) er lagt at dette er en gradient som ender i et artsuttynningsintervall, at artsuttynningsintervallets nedre endetrinn er JV∙c, og at gradientens naturlige øvre endetrinn er der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da erosjonsutsatthet (ER) deles i sju basistrinn.
''',
)