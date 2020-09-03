# %%
from model.model import LEC
from model.model import LECInfo
from model.model import ElementarySegment
from model.model import ElementarySegmentInfo

# %% UF
uf_lec = LEC(
    _id='UF',
    structuringProcess_id='D',
    patternOfVariation_id='g',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=5,
    spatialScale=5,
)
uf_lec_info_en = LECInfo(
    language_id='en',
    lec=uf_lec,
    name='Risk of drought',
    description='Variation in the risk of damage during periods with exceptionally low soil moisture content, i.e., the most severe drought spells in 50–100 years; variation along LEC UF is affected by topographic position and soil depth; at low drought risk, herbs, grasses, deciduous dwarf shrubs and mosses dominate while at high drought risk evergreen dwarf shrubs and lichens dominate',
)
uf_lec_info_nb = LECInfo(
    language_id='nb',
    lec=uf_lec,
    name='Uttørkingsfare',
    description='''Uttørkingsfare (UF) beskriver, sammen med vannmetning (VM), variasjon relatert til jordfuktighet på jorddekt fastmark. Miljøvariabelen uttørkingsfare (UF) adresserer faren for ekstrem uttørking, kanskje 50- eller 100-årstørken, og er korrelert med topografi, jorddybde og jordsmonnutvikling, mens vannmetning (VM) adresserer fuktighetsforholdene slik de stort sett er (‘median jordfuktighet’; R. Økland & Eilertsen 1993). Variasjonen langs UF og VM er i stor grad er frikoblet i rom, i tid og med hensyn til artenes responser; i fastmarksskogsmark er f.eks. alle kombinasjoner av UF (variasjonen fra frisk blåbærskog til tørkeutsatt lavskog) og VM [forekomsten av større eller mindre flekker, gjerne i små forsenkninger, av vegetasjon dominert av torvmoser (Sphagnum spp.) og andre arter som foretrekker fuktige voksesteder, men som også tåler langvarig uttørking)] realisert.
	Uttørkingsfare (UF) omfatter variasjonen fra blåbær- og lågurtskog på frisk mark med djupere jordsmonn, gjerne i lisider, til lavskog på koller med grunt jordsmonn eller svært veldrenerte morener. Uttørkingsfare (UF) er også relevant for semi-naturlig mark (semi-naturlig eng og kystlynghei) oppstått fra fastmarksskogsmark gjennom langvarig ekstensiv hevd, samt for fjellhei, leside og tundra.
	Det finnes ikke empirisk eller eksperimentelt basert kunnskap som entydig klargjør hvilke miljøfaktorer som er utslagsgivende for variasjonen i artssammensetning langs denne komplekse miljøvariabelen, men ‘uttørkingsfare-hypotesen’ (R. Økland & Eilertsen 1993; se NiN[1] Artikkel 22) postulerer at hovedforklaringen på variasjonen i artssammensetning langs uttørkingsfare (UF) er variasjon i faren for ekstrem uttørking, som i sin tur er bestemt av en rekke forhold som virker sammen, blant annet topografi, jorddybde og jordstruktur. Hypotesen støttes av at mange flekker i skogbunnen (og andre steder), også på grunn mark, tilføres sigevann som bidrar til en høy normal fuktighet, men at disse flekkene i ekstreme tørkeperioder (kanskje hvert10. eller 100. år) blir like sterkt tørkeutsatt som andre flekker i skogbunnsmosaikken når sigevannstilførselen stopper opp. ‘Uttørkingsfare-hypotesen’ forklarer variasjonen i artssammensetning langs gradienten med at artene i fuktige år vil spre seg i retning den tørkeutsatte gradientenden, men at de elimineres utenfor sitt egentlige toleranseområde i svært tørre år. Observasjoner i Finland (Erkamo 1958) og Norge (R. Økland & Eilertsen 1993) støtter denne forklaringen.
	I en serie av sammenliknbare naturtyper som fordeler seg langs uttørkingsfare (UF) fra liten til stor uttørkingsfare, avtar produktiviteten betydelig. Dette gir seg f.eks. utslag i variasjon i trærnes tilvekstrate (f.eks. uttrykt som H40-bonitet).
	R. Økland & Bendiksen (1985) viser at det omkring skoggrensa finner sted en ’forskyvning’ av artssammensetningen i karplantesjiktet (feltsjiktet) i forhold til i bunnsjiktet (moser og lav) idet en gitt karplanteartssammensetning er assosiert med et bunnsjikt med langt sterkere lavdominans enn under skoggrensa. Dette forklares med at vinden s uttørrende effekt over skoggrensa, og er grunnen til at trinn UF∙a ikke anses å være til stede i særlig grad der; god markfukting innebærer gjerne kildevannspåvirkning. I den motsatte enden av gradienten innebærer sterk tørkeutsatthet også så sterk vindvirkning at vindutsatthet (VI) overtar for uttørkingsfare (UF) som viktig miljøvariabel. Lavheia blir da et overgangstrinn langs UF, mens lesida blir et overgangstrinn mot snøleiene der snødekkebetinget vekstsesongreduksjon overtar som viktigste komplekse miljøvariabel langs ‘rabbe-snøleiegradienten’ (se NiN[2] Artikkel 2, kapittel B11).
''',
)

# a
a_elem_segment=ElementarySegment(
    _id='UF.a',
    lec=uf_lec,
    value='a',
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='fresh'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='frisk'
)

# b
b_elem_segment=ElementarySegment(
    _id='UF.b',
    lec=uf_lec,
    value='b',
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='pretty fresh'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='temmelig frisk'
)

# c
c_elem_segment=ElementarySegment(
    _id='UF.c',
    lec=uf_lec,
    value='c',
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='a little fresh'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<description>',
    value='litt frisk'
)

# d
d_elem_segment=ElementarySegment(
    _id='UF.d',
    lec=uf_lec,
    value='d',
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<class>',
    value='intermediate'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<description>',
    value='intermediær'
)

# e
e_elem_segment=ElementarySegment(
    _id='UF.e',
    lec=uf_lec,
    value='e',
    relative_order=4
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<class>',
    value='slightly exposed to drought'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<description>',
    value='litt tørkeutsatt'
)

# f
f_elem_segment=ElementarySegment(
    _id='UF.f',
    lec=uf_lec,
    value='f',
    relative_order=5
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='en',
    key='<class>',
    value='fairly prone to drought'
)
ElementarySegmentInfo(
    elementarySegment=f_elem_segment,
    language_id='nb',
    key='<description>',
    value='temmelig tørkeutsatt'
)

# g
g_elem_segment=ElementarySegment(
    _id='UF.g',
    lec=uf_lec,
    value='g',
    relative_order=6
)
ElementarySegmentInfo(
    elementarySegment=g_elem_segment,
    language_id='en',
    key='<class>',
    value='very prone to drought'
)
ElementarySegmentInfo(
    elementarySegment=g_elem_segment,
    language_id='nb',
    key='<description>',
    value='svært tørkeutsatt'
)

# h
h_elem_segment=ElementarySegment(
    _id='UF.h',
    lec=uf_lec,
    value='h',
    relative_order=7
)
ElementarySegmentInfo(
    elementarySegment=h_elem_segment,
    language_id='en',
    key='<class>',
    value='extremely prone to drought'
)
ElementarySegmentInfo(
    elementarySegment=h_elem_segment,
    language_id='nb',
    key='<description>',
    value='ekstremt tørkeutsatt'
)