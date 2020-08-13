# %%
from model.model import MajorType, MajorTypeInfo

# %% T12
t12_major_type = MajorType(
    _id='T12',
    majorTypeGroup_id='T',
)
t12_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t12_major_type,
    name='Tidal meadow',
    description='The tidal meadow major type includes naturally open (treeless), sea salt-influenced graminoid- and herb-dominated meadows. Typically, a distinct zonation can be observed along the vertical gradient from the lower geolittoral to (and including) the supralittoral belt. This major type typically occurs in sheltered sites with fine sediments.',
)
t12_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t12_major_type,
    name='Strandeng',
    description='''Strandeng omfatter mark med sluttet, eng-preget vegetasjon (dominert av gras og urter) i fjærebeltet, som ikke er preget av saltanriking. Strandenger finnes først og fremst på steder der substratet ikke er altfor grovt (dominert av grus og/eller små stein) eller finmateriale (silt eller leire), og der bølgeeksponeringen ikke er sterkere enn at finmateriale over tid har kunnet akkumuleres mellom de grovere partiklene eller fine løsmasser har blitt forhindret fra å bli vasket bort. Fuktig finmateriale har en tendens til å konsolideres til et substrat som gir godt grunnlag for etablering av vegetasjon og stabile dyresamfunn.
	Strandenger finnes langs hele kysten, men betingelsene for at strandenger skal finnes og strandengenes opprinnelse er omdiskutert. Det er åpenbart at forekomsten av strandenger langs store deler av norskekysten helt eller delvis er betinget av varig menneskepåvirkning (først og fremst beiting). Mange steder har strandengene vært i bruk som beitemark fra arealene ble land gjennom landhevingen. Det betyr likevel ikke at strandengene oppsto som resultat av menneskepåvirkning. Mer sannsynlig, støttet av observasjoner av små strandengflekker i den ytre skjærgården også på Øst- og Sørlandet, er at strandenger oppstår naturlig etter hvert som nytt land blottlegges for kolonisering av landplanter gjennom landheving. Mot nord, i hvert fall fra og med Nordland, synes strandengene å kunne være stabile over lang tid, mens de lengre sør [der tidevannsamplituden er lav og konkurransesterke arter som takrør (Phragmites communis) raskt vandrer inn)] gjennomgår en (rask) suksesjon videre til andre fastmarkssystemer eller forsumpes og ender opp som M8 Helofytt-saltvannssump, dersom de ikke opprettholdes som eng-pregete systemer gjennom beiting (tidligere ble strandenger også slått). Slike strandenger skal typifiseres som T33 Semi-naturlig strandeng. Over tid utvikler alle strandenger seg til fastmarkssystemer på grunn av landheving. 
'''
)