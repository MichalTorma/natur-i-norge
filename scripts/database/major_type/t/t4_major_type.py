# %%
from sqlalchemy.orm import relationship
from model.model import ElementarySegment, Language, MajorType, MajorTypeInfo, MinorType, MinorTypeInfo, MajorTypeLEC, StandardSegment, StandardSegmentElement, StandardSegmentInfo

# %% T4
t4_major_type = MajorType(
    _id='T4',
    majorTypeGroup_id='T',
)
t4_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t4_major_type,
    name='Forest',
    description='The forest major type comprises all terrestrial ‘normal variation’ below the alpine and polar forest limits, characterised by trees as structuring species group. Forests are characterised by long-term presence of trees that, at maturity, make up a stand characterised by vertical projection of tree crowns occupying more than 10 % of the area. Clear-cuts are included in the forest major type if replanted or naturally regenerated without delay. Trees are woody plants more than 5 m tall or that may grow to heights of at least 5 m, or, under growth-reducing conditions, more than 2 m. All non-wetland terrestrial land which meets these criteria, except alluvial forests which make up a major type on its own (T30), is included in the forest (T4) major type. Semi-natural and strongly altered land that meets the demand of forests for tree stand density are, by definition, not included in the concept of forest but in NiN characterised as woodland and included in the respective major types. Lime richness and risk of drought are most important LECs in this major type.',
)
t4_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t4_major_type,
    name='Fastmarksskogsmark',
    description='''Fastmarksskogsmark omfatter alle fastmarksarealer som tilfredsstiller skogsmarksdefinisjonen og som ikke påvirkes av flom. Skogsmark er naturlig mark som er sterkt preget av langvarig innflytelse fra trær og som ved et gitt tidspunkt er tresatt eller som i nær fortid har vært og i nær framtid forventes igjen å være tresatt. Mark der gjentatte forstyrrelser, inngrep eller liknende over lengre tid har forhindret utvikling av ny tresatt mark er ikke skogsmark. Fastmarksskogsmark omfatter nesten all skogsmark på fastmark i Norge, og dekker dermed størstedelen av landarealet under skoggrensa. Skogbruksaktivitet og annen bruk gir opphav til stor variasjon langs tilstandsøkokliner og i objektinnhold. Skogsmarksøkosystemets strukturkompleksitet (sjiktning, forekomst av livsmedier på levende og død ved etc.) gjør at det huser en betydelig andel av organismemangfoldet i Norge. Mange arter er spesifikt knyttet til fastmarksskogsmark.'''
)

# UF lec assignment
uf_lec = MajorTypeLEC(
    _id='T4-UF',
    lec_id='UF',
    majorType=t4_major_type,
    lecType_id='mLEC',
    axis=0,
)
uf_ab_standard_segment = StandardSegment(
    _id = 'T4-UF.ab',
    majorTypeLEC = uf_lec,
)
StandardSegmentInfo(
    standardSegment=uf_ab_standard_segment,
    language_id='en',
    key='designation',
    value='fresh and fairly fresh (blueberry and weed forest)'
)
StandardSegmentInfo(
    standardSegment=uf_ab_standard_segment,
    language_id='nb',
    key='betegnelse',
    value='frisk og temmelig frisk (blåbær- og lågurtskog)'
)
StandardSegmentElement(
    standardSegment = uf_ab_standard_segment,
    elementarySegment_id = 'UF.a'
)
StandardSegmentElement(
    standardSegment = uf_ab_standard_segment,
    elementarySegment_id = 'UF.b'
)

uf_cd_standard_segment = StandardSegment(
    _id = 'T4-UF.cd',
    majorTypeLEC = uf_lec,
)
StandardSegmentInfo(
    standardSegment=uf_cd_standard_segment,
    language_id='en',
    key='designation',
    value='slightly fresh and intermediate (berry heather forest)'
)
StandardSegmentInfo(
    standardSegment=uf_cd_standard_segment,
    language_id='nb',
    key='betegnelse',
    value='litt frisk og intermediær (bærlyngskog)'
)
StandardSegmentElement(
    standardSegment = uf_cd_standard_segment,
    elementarySegment_id = 'UF.c'
)
StandardSegmentElement(
    standardSegment = uf_cd_standard_segment,
    elementarySegment_id = 'UF.d'
)

uf_ef_standard_segment = StandardSegment(
    _id = 'T4-UF.ef',
    majorTypeLEC = uf_lec,
)
StandardSegmentInfo(
    standardSegment=uf_ef_standard_segment,
    language_id='en',
    key='designation',
    value='slightly exposed to drought (heather forest)'
)
StandardSegmentInfo(
    standardSegment=uf_ef_standard_segment,
    language_id='nb',
    key='betegnelse',
    value='svakt tørkeutsatt (lyngskog)'
)
StandardSegmentElement(
    standardSegment = uf_ef_standard_segment,
    elementarySegment_id = 'UF.e'
)
StandardSegmentElement(
    standardSegment = uf_ef_standard_segment,
    elementarySegment_id = 'UF.f'
)

uf_gh_standard_segment = StandardSegment(
    _id = 'T4-UF.gh',
    majorTypeLEC = uf_lec,
)
StandardSegmentInfo(
    standardSegment=uf_gh_standard_segment,
    language_id='en',
    key='designation',
    value='highly exposed to drought (low forest)'
)
StandardSegmentInfo(
    standardSegment=uf_gh_standard_segment,
    language_id='nb',
    key='betegnelse',
    value='sterkt tørkeutsatt (lavskog)'
)
StandardSegmentElement(
    standardSegment = uf_gh_standard_segment,
    elementarySegment_id = 'UF.g'
)
StandardSegmentElement(
    standardSegment = uf_gh_standard_segment,
    elementarySegment_id = 'UF.h'
)


# KA lec assignment
ka_lec = MajorTypeLEC(
    _id='T4-KA',
    lec_id='KA',
    majorType=t4_major_type,
    lecType_id='mLEC',
    axis=1,
)
ka_abc_standard_segment = StandardSegment(
    _id = 'T4-KA.abc',
    majorTypeLEC = ka_lec,
)
StandardSegmentInfo(
    standardSegment=ka_abc_standard_segment,
    language_id='en',
    key='designation',
    value='low in calcium'
)
StandardSegmentInfo(
    standardSegment=ka_abc_standard_segment,
    language_id='nb',
    key='betegnelse',
    value='kalkfattig'
)
StandardSegmentElement(
    standardSegment = ka_abc_standard_segment,
    elementarySegment_id = 'KA.a'
)
StandardSegmentElement(
    standardSegment = ka_abc_standard_segment,
    elementarySegment_id = 'KA.b'
)
StandardSegmentElement(
    standardSegment = ka_abc_standard_segment,
    elementarySegment_id = 'KA.c'
)

ka_de_standard_segment = StandardSegment(
    _id = 'T4-KA.de',
    majorTypeLEC = ka_lec,
)
StandardSegmentInfo(
    standardSegment=ka_de_standard_segment,
    language_id='en',
    key='designation',
    value='intermediate'
)
StandardSegmentInfo(
    standardSegment=ka_de_standard_segment,
    language_id='nb',
    key='betegnelse',
    value='intermediær'
)
StandardSegmentElement(
    standardSegment = ka_de_standard_segment,
    elementarySegment_id = 'KA.d'
)
StandardSegmentElement(
    standardSegment = ka_de_standard_segment,
    elementarySegment_id = 'KA.e'
)

ka_fg_standard_segment = StandardSegment(
    _id = 'T4-KA.fg',
    majorTypeLEC = ka_lec,
)
StandardSegmentInfo(
    standardSegment=ka_fg_standard_segment,
    language_id='en',
    key='designation',
    value='weakly calcareous'
)
StandardSegmentInfo(
    standardSegment=ka_fg_standard_segment,
    language_id='nb',
    key='betegnelse',
    value='svakt kalkrik'
)
StandardSegmentElement(
    standardSegment = ka_fg_standard_segment,
    elementarySegment_id = 'KA.f'
)
StandardSegmentElement(
    standardSegment = ka_fg_standard_segment,
    elementarySegment_id = 'KA.g'
)

ka_hi_standard_segment = StandardSegment(
    _id = 'T4-KA.hi',
    majorTypeLEC = ka_lec,
)
StandardSegmentInfo(
    standardSegment=ka_hi_standard_segment,
    language_id='en',
    key='designation',
    value='strongly calcareous'
)
StandardSegmentInfo(
    standardSegment=ka_hi_standard_segment,
    language_id='nb',
    key='betegnelse',
    value='sterkt kalkrik'
)
StandardSegmentElement(
    standardSegment = ka_hi_standard_segment,
    elementarySegment_id = 'KA.h'
)
StandardSegmentElement(
    standardSegment = ka_hi_standard_segment,
    elementarySegment_id = 'KA.i'
)

# KI i-lec assignment
ki_lec = MajorTypeLEC(
    _id='T4-KI',
    lec_id='KI',
    majorType=t4_major_type,
    lecType_id='iLEC',
    axis=2,
)
ki_0a_standard_segment = StandardSegment(
    _id = 'T4-KI.0a',
    majorTypeLEC = ki_lec,
)
StandardSegmentInfo(
    standardSegment=ki_0a_standard_segment,
    language_id='en',
    key='designation',
    value='without or only with observable spring water impact' #TODO Ask about this
)
StandardSegmentInfo(
    standardSegment=ki_0a_standard_segment,
    language_id='nb',
    key='betegnelse',
    value='uten eller bare med observerbar kildevannspåvirkning'
)
StandardSegmentElement(
    standardSegment = ki_0a_standard_segment,
    elementarySegment_id = 'KI.0'
)
StandardSegmentElement(
    standardSegment = ki_0a_standard_segment,
    elementarySegment_id = 'KI.a'
)
ki_bc_standard_segment = StandardSegment(
    _id = 'T4-KI.bc',
    majorTypeLEC = ki_lec,
)
StandardSegmentInfo(
    standardSegment=ki_bc_standard_segment,
    language_id='en',
    key='designation',
    value='weak spring water impact (large fern and high perennial forest)'
)
StandardSegmentInfo(
    standardSegment=ki_bc_standard_segment,
    language_id='nb',
    key='betegnelse',
    value='svak kildevannspåvirkning (storbregne- og høgstaudeskog)'
)
StandardSegmentElement(
    standardSegment = ki_bc_standard_segment,
    elementarySegment_id = 'KI.b'
)
StandardSegmentElement(
    standardSegment = ki_bc_standard_segment,
    elementarySegment_id = 'KI.c'
)