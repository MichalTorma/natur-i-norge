# %%
from model.model import MajorType, MajorTypeInfo

# %% T24
t24_major_type = MajorType(
    _id='T24',
    majorTypeGroup_id='T',
)
t24_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t24_major_type,
    name='Coastal driftline',
    description='Coastal driftline comprises accumulated organic matter, mostly sea weed and kelp, in the upper geolittoral and supralittoral belts on exposed shores. Coastal driftlines may support a vegetation of annual or perennial plants. Soil layers may be shallow or thick, consisting mainly of organic matter with high nitrogen and phosphorus contents.',
)
t24_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t24_major_type,
    name='Driftvoll',
    description='''Driftvoller (tangvoller) er natursystemer som finnes i øvre del av fjærebeltet (øvre geolitoral- og supralitoralbeltet). Driftvoller opprettholdes permanent eller tilstrekkelig lenge til at de tilfredsstiller kravet til et natursystem (varighet i minst 6 år) på steder der tilførselen av organisk materiale (først og fremst tang og tare) fra havet er stor og relativt forutsigbar. Mengden tilført materiale må være stor nok til at materiale samler seg opp, det vil si at det må tilføres mer enn det som brytes ned, eller vaskes vekk igjen (av brenningene) eller blåser bort.
	 En driftvoll kjennetegnes ved svært høy tilgjengelighet på nitrogen og fosfor. Substratet er mer eller mindre ustabilt på grunn av stadige tilførsler av nytt driftmateriale og fordi driftmaterialet er utsatt for bølge- og vinderosjon. Høyt organisk innhold, oftest mørk farge og rask kjemisk nedbrytning, gjør at det driftmaterialet på varme sommerdager kan bli varmet opp til svært høye temperaturer. Driftvollene har gjennomgående høyere substrattemperatur enn omgivelsene omkring, på grunn av varmeproduksjon ved den kjemiske nedbrytningen. Dette er sannsynligvis en av de viktigste årsakene til driftvollenes spesielle artssammensetning. 
	Både mengden av tilført driftmateriale og forstyrrelsesintensiteten (faren for sedimentasjon og erosjon) varierer mye, både mellom ulike driftvoller og innen den enkelte driftvoll). Derfor er det stor variasjon innenfor natursystem-hovedtypen driftvoll, både i egenskaper, arealenhetenes utstrekning og deres artssammensetning. Langs deler av kysten med stor tidevannsamplitude (Midt- og Nord-Norge) kan driftvollene være permanente i en lengde av flere kilometer langs kystlinja og ha en betydelig bredde. Den andre ytterligheten med hensyn til størrelse og varighet utgjøres av driftvoll-fragmenter (for eksempel en tang- eller tarevase som er skylt opp på ei steinstrand), som utgjør små naturkomponenter innenfor andre hovedtyper av natursystemer i fjærebeltet. 
	Artssammensetningen i driftvoller gjenspeiler den høye forstyrrelsesintensiteten; arter med kort livssyklus og høy reproduksjon dominerer oftest, men innslaget av flerårige arter øker langs en gradient i forstyrrelsesintensitet. Mange varmekrevende organismer har relativt ’stabile’ populasjoner mye lengre mot nord på/i driftvoller enn i andre natursystem-hovedtyper. Eksempler på dette er karplante-artene åkerdylle (Sonchus arvensis), smånesle (Urtica urens) og kveke (Elytrigia repens). Driftvoller har ofte også en fauna med rik forekomst av varmeelskende insektarter.
'''
)