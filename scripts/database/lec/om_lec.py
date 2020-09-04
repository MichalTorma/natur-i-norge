# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% OM
om_lec = LEC(
    _id='OM',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=3,
    spatialScale=10,
)
om_lec_info_en = LECInfo(
    language_id='en',
    lec=om_lec,
    name='Oxygen deficiency',
    description='Variation in the intensity (duration and frequency) of hypoxic (<2 ml O2/L) and anoxic conditions in freshwater and marine water bodies; ending with a species-thinning situation towards permanently anoxic waters',
)
om_lec_info_nb = LECInfo(
    language_id='nb',
    lec=om_lec,
    name='Oksygenmangel',
    description='''I alle forekomster av stillestående vann (innsjøer, fjorder og litoralbasseng) er det av stor betydning for økosystemfunksjonen om vannmassene regelmessig blandes (sirkulerer) og om (og i tilfellet hvor ofte) overflatevannet i vannforekomsten skiftes ut. Fordi heterotrofe organismer (dyr og nedbrytere) forbruker oksygen, vil vannforekomster som ikke sirkulerer eller jevnlig skiftes utvikle oksygenfrie forhold i vannmassene og i de tilgrensende bunnsystemene. Tilgangen på oksygen begrenser hvilke livsformer som kan forekomme, både i saltvannsystemer og i ferskvannssystemer. Strengt aerobe organismer krever stabil oksygentilførsel. På steder med permanent oksygenfrihet finnes derfor bare organismer med anaerob respirasjon (først og fremst bakterier). Innsjøer uten sirkulasjon, med oksygenfritt bunnvannlag (monimolimnion) som aldri blander seg med øvrige vannlag med oksygenfritt bunnvann, kalles meromiktiske innsjøer.
	Den komplekse miljøgradienten oksygenmangel (OM) har anoksisk vann som sitt naturlige endetrinn (OM∙¤). Artstettheten avtar mot dette endetrinnet, men gradienten ender ikke i disruptivt miljøstress.
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='OM.0',
    lec=om_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='oxic'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='episodes of low oxygen content (<2 ml O2 / L water) never occur'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='oksisk'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='episoder med lavt oksygeninnhold (< 2 ml O2/L vann) inntreffer aldri'
)
# a
a_elem_segment=ElementarySegment(
    _id='OM.a',
    lec=om_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='periodically hypoxic'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='periodic low oxygen content (<2 ml O2 / L water) occurs at least once every 6 years; the species composition contains species with tolerance to anoxic conditions to an extent that makes it observably different from oxic environments'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='periodisk hypoksisk'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='periodisk lavt oksygeninnhold (< 2 ml O2/L vann) inntreffer minst én gang hvert 6. år; artssammensetningen inneholder arter med toleranse for anoksiske forhold i et omfang som gjør den observerbart forskjellig fra oksiske miljøer'
)
# b
b_elem_segment=ElementarySegment(
    _id='OM.b',
    lec=om_lec,
    value='b',
    order=2,
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='periodically anoxic'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='periodisk oksygenmangel (oksygenfrie forhold) inntreffer minst hvert 6. år; arter med stor toleranse for anoksiske forhold dominerer'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='periodisk anoksisk'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='periodisk oksygenmangel (oksygenfrie forhold) inntreffer minst hvert 6. år; arter med stor toleranse for anoksiske forhold dominerer'
)
# all
all_elem_segment=ElementarySegment(
    _id='OM.¤',
    lec=om_lec,
    value='¤',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<class>',
    value='anoxic'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<description>',
    value='at least 6 years between each time the bottom is in contact with water with an oxygen content above the limit value of 2 ml O2 / L water; species that are sensitive to anoxic conditions are completely missing'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<class>',
    value='anoksisk'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<description>',
    value='minst 6 år mellom hver gang bunnen er i kontakt med vann med oksygeninnhold over grenseverdien 2 ml O2/L vann; arter som er følsomme for anoksiske forhold mangler fullstendig'
)
