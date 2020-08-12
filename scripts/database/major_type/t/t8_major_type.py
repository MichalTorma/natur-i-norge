# %%
from model.model import MajorType, MajorTypeInfo

# %% T8
t8_major_type = MajorType(
    _id=8,
    majorTypeGroup_id='T',
)
t8_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t8_major_type,
    name='Bird-cliff meadow',
    description='Bird-cliff meadow comprises naturally open (treeless), graminoid- or herb-dominated sites manured by birds, typically found on slopes underneath or adjacent to bird cliffs along the western and northern coast of Norway. Bird-cliff meadows receive high nitrogen and phosphorus supplies and are typically dominated by nitrophilous species. At intermediate levels of natural manuring, bird-cliff meadows are highly productive, while productivity as well as species richness decreases towards supraoptimal nutrient concentrations. This major type also includes bird-perching tops, which are found in open, elevated sites in the landscape where birds rest, sit watching and leave excrements behind.',
)
t8_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t8_major_type,
    name='Fuglefjell-eng og fugletopp',
    description='''Naturtypebegrepet fuglefjell-eng inkluderer åpne engpregete områder (det vil si områder med jordsmonn) med en artssammensetning som er preget av regelmessig fuglegjødsling. Fuglefjell-enger har få eller ingen eksklusive plantearter, og floraen er vanligvis fattig både på karplante- og mosearter. Dette skyldes at mange engarter ikke tåler de høye nitrogen- og/eller fosforkonsentrasjonene som fuglegjødslingen medfører (jf. Grønlie 1948). Fuglefjell-engene er likevel ofte særdeles frodige fordi de få artene som tåler dette spesielle miljøet evner å utnytte den høye tilgangen på nitrogennæring til høy produksjon. Normalt akkumuleres ikke organisk materiale i fuglefjell-eng fordi nedbrytningen er rask. 
	Mest typisk finnes fuglefjell-eng i skråninger mellom, under eller i mosaikk med fugleberg. Innenfor områder med fuglefjell-eng finnes også gjerne en mosaikk av ulike utforminger, som resultat av romlig variasjon i mengden gjødsel som blir tilført og lokal forekomst av mer eller mindre konsentrerte kildevannsframspring. 
	Fuglefjelleng-liknende natur forekommer også som større eller mindre flekker (fra noen hundre m2 ned til under 1 m2) utenfor fuglefjell, i arealenheter av andre natursystem-hovedtyper, f.eks. i kystlynghei i nærheten av fuglefjell. Ofte forekommer sånne flekker på toppunkter i terrenget (‘fugletopper’) der fugler ofte slår seg ned. Mens fuglefjell-engene er engpregete systemer i skråninger, er fugletoppene ofte omgitt av hei. Fuglefjell-engene og fugletoppene har imidlertid mange arter felles, og er betinget av samme dLKM, naturlig gjødsling. De er derfor samlet i én natursystem-hovedtype.
Polarskjørbuksurt (Cochlearia groenlandica) og fjellsyre (Oxyria digyna) er arter som danne énartsbestander i de sterkest gjødslete delene av arktiske fuglefjell-enger. Rødsvingel (Festuca rubra) er trolig den viktigste arten i fuglefjell-eng på fastlandet (Bilde 3, 4, 7). På Svalbard er fuglefjellene viktige for polarrevens mattilgang. En god del insektarter, blant andre noen sommerfuglarter, forekommer på Svalbard bare under fuglefjell, som der utgjør varme og høyproduktive eksklaver (utposter) av miljøforhold som ellers bare finner lenger sør. 
	De typiske fuglefjell-engene er fattige på moser, som generelt disfavoriseres i forhold til karplanter når næringstilgangen blir svært stor (eller grasvegetasjonen svært tett; se Bilde 4). Men ved svært lave temperaturer endrer dette seg, slik at det kan utvikles en mosetundra til erstatning for fuglefjell-eng under fuglebergene (se avgrensningskommentar mellom fuglefjell-eng og mosetundra).
'''
)