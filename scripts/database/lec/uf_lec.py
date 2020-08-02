# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

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
    language=en_language,
    lec=uf_lec,
    name='Risk of drought',
    description='Variation in the risk of damage during periods with exceptionally low soil moisture content, i.e., the most severe drought spells in 50–100 years; variation along LEC UF is affected by topographic position and soil depth; at low drought risk, herbs, grasses, deciduous dwarf shrubs and mosses dominate while at high drought risk evergreen dwarf shrubs and lichens dominate',
)
uf_lec_info_nb = LECInfo(
    language=nb_language,
    lec=uf_lec,
    name='Uttørkingsfare',
    description='''Uttørkingsfare (UF) beskriver, sammen med vannmetning (VM), variasjon relatert til jordfuktighet på jorddekt fastmark. Miljøvariabelen uttørkingsfare (UF) adresserer faren for ekstrem uttørking, kanskje 50- eller 100-årstørken, og er korrelert med topografi, jorddybde og jordsmonnutvikling, mens vannmetning (VM) adresserer fuktighetsforholdene slik de stort sett er (‘median jordfuktighet’; R. Økland & Eilertsen 1993). Variasjonen langs UF og VM er i stor grad er frikoblet i rom, i tid og med hensyn til artenes responser; i fastmarksskogsmark er f.eks. alle kombinasjoner av UF (variasjonen fra frisk blåbærskog til tørkeutsatt lavskog) og VM [forekomsten av større eller mindre flekker, gjerne i små forsenkninger, av vegetasjon dominert av torvmoser (Sphagnum spp.) og andre arter som foretrekker fuktige voksesteder, men som også tåler langvarig uttørking)] realisert.
	Uttørkingsfare (UF) omfatter variasjonen fra blåbær- og lågurtskog på frisk mark med djupere jordsmonn, gjerne i lisider, til lavskog på koller med grunt jordsmonn eller svært veldrenerte morener. Uttørkingsfare (UF) er også relevant for semi-naturlig mark (semi-naturlig eng og kystlynghei) oppstått fra fastmarksskogsmark gjennom langvarig ekstensiv hevd, samt for fjellhei, leside og tundra.
	Det finnes ikke empirisk eller eksperimentelt basert kunnskap som entydig klargjør hvilke miljøfaktorer som er utslagsgivende for variasjonen i artssammensetning langs denne komplekse miljøvariabelen, men ‘uttørkingsfare-hypotesen’ (R. Økland & Eilertsen 1993; se NiN[1] Artikkel 22) postulerer at hovedforklaringen på variasjonen i artssammensetning langs uttørkingsfare (UF) er variasjon i faren for ekstrem uttørking, som i sin tur er bestemt av en rekke forhold som virker sammen, blant annet topografi, jorddybde og jordstruktur. Hypotesen støttes av at mange flekker i skogbunnen (og andre steder), også på grunn mark, tilføres sigevann som bidrar til en høy normal fuktighet, men at disse flekkene i ekstreme tørkeperioder (kanskje hvert10. eller 100. år) blir like sterkt tørkeutsatt som andre flekker i skogbunnsmosaikken når sigevannstilførselen stopper opp. ‘Uttørkingsfare-hypotesen’ forklarer variasjonen i artssammensetning langs gradienten med at artene i fuktige år vil spre seg i retning den tørkeutsatte gradientenden, men at de elimineres utenfor sitt egentlige toleranseområde i svært tørre år. Observasjoner i Finland (Erkamo 1958) og Norge (R. Økland & Eilertsen 1993) støtter denne forklaringen.
	I en serie av sammenliknbare naturtyper som fordeler seg langs uttørkingsfare (UF) fra liten til stor uttørkingsfare, avtar produktiviteten betydelig. Dette gir seg f.eks. utslag i variasjon i trærnes tilvekstrate (f.eks. uttrykt som H40-bonitet).
	R. Økland & Bendiksen (1985) viser at det omkring skoggrensa finner sted en ’forskyvning’ av artssammensetningen i karplantesjiktet (feltsjiktet) i forhold til i bunnsjiktet (moser og lav) idet en gitt karplanteartssammensetning er assosiert med et bunnsjikt med langt sterkere lavdominans enn under skoggrensa. Dette forklares med at vinden s uttørrende effekt over skoggrensa, og er grunnen til at trinn UF∙a ikke anses å være til stede i særlig grad der; god markfukting innebærer gjerne kildevannspåvirkning. I den motsatte enden av gradienten innebærer sterk tørkeutsatthet også så sterk vindvirkning at vindutsatthet (VI) overtar for uttørkingsfare (UF) som viktig miljøvariabel. Lavheia blir da et overgangstrinn langs UF, mens lesida blir et overgangstrinn mot snøleiene der snødekkebetinget vekstsesongreduksjon overtar som viktigste komplekse miljøvariabel langs ‘rabbe-snøleiegradienten’ (se NiN[2] Artikkel 2, kapittel B11).
''',
)