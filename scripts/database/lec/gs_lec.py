# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% GS
gs_lec = LEC(
    _id='GS',
    structuringProcess_id='S',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=1,
    spatialScale=4,
)
gs_lec_info_en = LECInfo(
    language_id='en',
    lec=gs_lec,
    name='Cave-induced sheltering',
    description='Light attenuation and reduced amplitudes of temperature and air humidity along the physical gradient from open ground via overhanging rocks to the interior of deep caves, ending in a species-thinning situation',
)
gs_lec_info_nb = LECInfo(
    language_id='nb',
    lec=gs_lec,
    name='Grottebetinget skjerming',
    description='''Kompleks miljøgradient som beskriver lyssvekking og redusert amplitude i flere enkeltvariabler som luftfuktighet og lys langs en fysisk gradient fra åpen mark til det indre av dype grotter. Grottebetinget skjerming er relevant for variasjon i artssammensetning både i terrestre og akvatiske systemer, og for en lang rekke artsgrupper. Artssammensetningen i indre deler av grotter (sterk grottebetinget skjerming) er dårlig kjent
	Til grunn for trinndeling av GS er lagt at gradienten ender i artsuttynning med nedre endetrinn for artsuttynningsintervallet i trinn GS∙b.
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='GS.0',
    lec=gs_lec,
    value='0',
    order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='outside the cave'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='no shielding; habitat without protection against precipitation and other precipitation from above'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='utenfor grotte'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='ingen skjerming; levested uten skjerming mot nedbør og annet nedfall ovenfra'
)
# a
a_elem_segment=ElementarySegment(
    _id='GS.a',
    lec=gs_lec,
    value='a',
    order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='overhang'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='overhangs under rocks, slopes etc. (slope> 90 °; cavities extending 0–5 m inwards); strongly affected by the environment outside the cave but not directly affected by precipitation and other precipitation from above'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='overheng'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='overheng under berg, hellere etc. (helning > 90 °; hulrom som strekker seg 0–5 m innover); sterkt påvirket av miljøet utenfor grotta men ikke direkte påvirket av nedbør og annet nedfall ovenfra'
)
# b
b_elem_segment=ElementarySegment(
    _id='GS.b',
    lec=gs_lec,
    value='b',
    order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='outer parts of deep cave'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='fairly strong shielding; significantly affected by fluctuations in the environment outside the cave and usable illuminated'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='ytre deler av dyp grotte'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='nokså sterk skjerming; i betydelig grad påvirket av svingninger i miljøet utenfor grotta og brukbart opplyst'
)
# cd
cd_elem_segment=ElementarySegment(
    _id='GS.cd',
    lec=gs_lec,
    value='cd',
    order=3
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='<class>',
    value='middle parts of deep cave'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='<description>',
    value='strong shielding; middle part of deep cave or inner part of shallow cave; to some extent affected by fluctuations in the environment outside the cave and dimly lit; An important limit (towards step ¤) is where there is no longer enough light for mosses to grow'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='<class>',
    value='midtre deler av dyp grotte'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='<description>',
    value='sterk skjerming; midtre del av dyp grotte eller indre del av grunn grotte; i noen grad påvirket av svingninger i miljøet utenfor grotta og svakt opplyst; ei viktig grense (mot trinn ¤) er der det ikke lenger er lys nok til at moser kan vokse'
)
# all
all_elem_segment=ElementarySegment(
    _id='GS.¤',
    lec=gs_lec,
    value='¤',
    order=4
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<class>',
    value='inner parts of deep cave'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<description>',
    value='very strong shielding; where the environment is not affected by fluctuations in the environment outside the cave'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<class>',
    value='indre deler av dyp grotte'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<description>',
    value='svært sterk skjerming; der miljøet ikke påvirkes av svingninger i miljøet utenfor grotta'
)
