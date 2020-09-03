# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% JV
jv_lec = LEC(
    _id='JV',
    structuringProcess_id='S',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
jv_lec_info_en = LECInfo(
    language_id='en',
    lec=jv_lec,
    name='Geothermal influence',
    description='Variation in geothermal energy supplies, carried by water or gas, ranging from no influence on the species composition via increasing dominance by specialist organisms (eventually only bacteria), at >100 °C ending in a species-thinning situation; no sessile organism maintains persistent populations in such sites',
)
jv_lec_info_nb = LECInfo(
    language_id='nb',
    lec=jv_lec,
    name='Jordvarmeinnflytelse',
    description='''Jordvarme (JV) er uttrykk for intensitet i tilførsler av geotermisk energi utover det normale for et gitt område. Jordvarmeinfluert natur finnes på land, i våre områder med vann som varmebærer (varm kilde), og på havbunnen (varm havkilde) med vann eller gass som varmebærere. Liksom variasjonen i graden av kildestyrke (konsentrert kildevannstilførsel) fra kildesentrum til kildeperiferi i kaldkilde, varierer graden av jordvarmeinnflytelse fra sentrum til periferi i varm kilde og i varm havkilde. 
	Jordvarmeinfluerte kildeområder (JV∙ab) forekommer på Spitsbergen som et fåtall små ’øyer’ av varm kilde, og på havbunnen flere steder (alle trinn) tilknytning til den midtatlantiske rygg (f.eks. Lokeslottet og Mohnryggen).
	Til grunn for basistrinninndelingen av jordvarmeinnflytelse (JV) er lagt at dette er en gradient som ender i et artsuttynningsintervall, at artsuttynningsintervallets nedre endetrinn er JV∙c, og at gradientens naturlige øvre endetrinn er der disruptiv forstyrrelse forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal da erosjonsutsatthet (ER) deles i sju basistrinn.
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='JV.0',
    lec=jv_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='no geothermal influence'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='substrate and / or water temperature not significantly higher than normal for similar locations'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='Temperature increase (Δ˚C)',
    value='< 2'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='ingen jordvarmeinnflytelse'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='substrat- og eller vanntemperatur ikke signifikant høyere enn normalt for tilsvarende steder'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='Temperaturøkning (Δ˚C)',
    value='< 2'
)
# a
a_elem_segment=ElementarySegment(
    _id='JV.a',
    lec=jv_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='observable geothermal influence'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='observable geothermal influence'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='Temperature increase (Δ˚C)',
    value='2 - ~10'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='observerbart jordvarmeinfluert'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='temperatur tilstrekkelig mye høyere enn omgivelsene til at forskjellen i artssammensetning er observerbar eller betydelig'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='Temperaturøkning (Δ˚C)',
    value='2 - ~10'
)
# b
b_elem_segment=ElementarySegment(
    _id='JV.b',
    lec=jv_lec,
    value='b',
    order=2,
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='slightly geothermal influenced'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='temperature sufficiently much higher than the environment for the difference in species composition to be significant'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='Temperature increase (Δ˚C)',
    value='~10 - 25'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='litt jordvarmeinfluert'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='temperatur tilstrekkelig mye høyere enn omgivelsene til at forskjellen i artssammensetning er vesentlig'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='Temperaturøkning (Δ˚C)',
    value='~10 - 25'
)
# c
c_elem_segment=ElementarySegment(
    _id='JV.c',
    lec=jv_lec,
    value='c',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='rather strong geothermal influence'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<description>',
    value='temperature so much higher than the environment that specially adapted species (bacteria) reach their optimum'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='Temperature increase (Δ˚C)',
    value='25 - 50'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<class>',
    value='desc_nbtemmelig sterkt jordvarmeinfluert'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<description>',
    value='temperatur så mye høyere enn omgivelsene til at spesialtilpassete arter (bakterier) når sitt optimum'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='Temperaturøkning (Δ˚C)',
    value='25 - 50'
)
# de
de_elem_segment=ElementarySegment(
    _id='JV.de',
    lec=jv_lec,
    value='de',
    relative_order=4
)
ElementarySegment(
    _id='JV.d',
    lec=jv_lec,
    value='d',
    order=4,
    relative_order=0,
    parent=de_elem_segment
)
ElementarySegment(
    _id='JV.e',
    lec=jv_lec,
    value='e',
    order=5,
    relative_order=1,
    parent=de_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='en',
    key='<class>',
    value='very strong geothermal influence'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='en',
    key='<description>',
    value='proteins are denatured; significant species thinning, but substrates up to 100 ˚C may have communities of specially adapted bacteria'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='en',
    key='Temperature increase (Δ˚C)',
    value='50 - 100'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='nb',
    key='<class>',
    value='svært sterkt jordvarmeinfluert'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='nb',
    key='<description>',
    value='proteiner denatureres; betydelig artsuttynning, men substrater opp til 100 ˚C kan ha samfunn av spesialtilpassete bakterier'
)
ElementarySegmentInfo(
    elementarySegment=de_elem_segment,
    language_id='nb',
    key='Temperaturøkning (Δ˚C)',
    value='50 - 100'
)
# all
all_elem_segment=ElementarySegment(
    _id='JV.¤',
    lec=jv_lec,
    value='¤',
    order=6,
    relative_order=5
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<class>',
    value='disruptive geothermal influence'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<description>',
    value='without adhering organisms'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='Temperature increase (Δ˚C)',
    value='> 100'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<class>',
    value='disruptiv jord-varmeinnflytelse'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<description>',
    value='uten fastsittende organismer'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='Temperaturøkning (Δ˚C)',
    value='> 100'
)
