# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

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

# nul
nul_elem_segment=ElementarySegment(
    _id='NG.0',
    lec=ng_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='without natural fertilizer'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='oligotrophic without observable effect of natural fertilization on the species composition'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='uten naturlig gjødslingspreg'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='oligotrof uten observerbar effekt av naturlig gjødsling på artssammensetningen'
)
# a
a_elem_segment=ElementarySegment(
    _id='NG.a',
    lec=ng_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='observable natural fertilizer character'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='oligotrophic, but with observable effect of natural fertilization on the species composition compared to nature not affected by natural fertilization'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='observerbart naturlig gjødslingspreget'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='oligotrof, men med observerbar (< 1 ØAE) effekt av naturlig gjødsling på artssammensetningen sammenliknet med natur som ikke er påvirket av naturlig gjødsling'
)
# b
b_elem_segment=ElementarySegment(
    _id='NG.b',
    lec=ng_lec,
    value='b',
    order=2,
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='slightly naturally fertilized'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='mesotrophic; clear fertilizer character on the species composition; in contrast to the adjoining nature which lacks this character'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='litt naturlig gjødslingspreget'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='mesotrof; tydelig gjødslingspreg på artssammensetningen; til forskjell fra tilgrensende natur som mangler dette preget'
)
# c
c_elem_segment=ElementarySegment(
    _id='NG.c',
    lec=ng_lec,
    value='c',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='rather strongly naturally fertilized'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<description>',
    value='eutrophic; the fertilization effect is so strong that the plant density is reduced in relation to step NG.b'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<class>',
    value='temmelig sterkt naturlig gjødslingspreget'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<description>',
    value='eutrof; gjødslingspåvirkningen er så sterk at planteartstettheten reduseres i forhold til trinn NG∙b'
)
# d
d_elem_segment=ElementarySegment(
    _id='NG.d',
    lec=ng_lec,
    value='d',
    order=4,
    relative_order=4
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<class>',
    value='very strongly naturally fertilized'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<description>',
    value='eutrophic; the fertilization effect is so strong that the vegetation is often dominated by a single species'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<class>',
    value='svært sterkt naturlig gjødslingspreget'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<description>',
    value='eutrof; gjødslingspåvirkningen er så sterk at vegetasjonen ofte er dominert av en enkelt art'
)
# all
all_elem_segment=ElementarySegment(
    _id='NG.¤',
    lec=ng_lec,
    value='¤',
    order=5,
    relative_order=5
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<class>',
    value='over-fertilized'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<description>',
    value='hypertrophyc; the effect of fertilization is so strong that plants occur only sporadically (more or less vegetation-free soil)'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<class>',
    value='overgjødslet'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<description>',
    value='hypertrof; gjødslingspåvirkningen er så sterk at planter bare sporadisk forekommer (mer eller mindre vegetasjonsfri mark)'
)
