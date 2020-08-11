# %%
from model.model import MajorType, MajorTypeInfo

# %% M1
m1_major_type = MajorType(
    _id=1,
    majorTypeGroup_id='M',
)
m1_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m1_major_type,
    name='Euphotic marine rock',
    description='Euphotic marine rock includes marine rockwalls, outcrops and stable boulder- and stone-beds in the euphotic belt, which consists of three sub-belts: the sublittoral fringe, the infralittoral belt and the upper circalittoral belt (the latter extends downwards to the compensation point). Green algae and sessile animals dominate in the sublittoral fringe, kelp communities in the infralittoral zone while red algae dominate in the upper circalittoral zone. This major type comprises variation from sheltered via moderately to strongly exposed hard substrates.',
)
m1_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m1_major_type,
    name='Eufotisk fast saltvannsbunn',
    description='''Eufotisk fast saltvannsbunn omfatter fast fjell og stabile blokker med permanente samfunn av flerårige alge- og dyrearter, i beltet mellom normalt fjæremål, det vil si nivået som vanligvis konstant fuktes av havvann (upper infralitoral zone), gjennom tareskogsbeltet (lower infralitoral zone) og rødalgebeltet (upper circalitoral zone) ned til kompensasjonsdypet, der lysinnstrålingen er så lav [< 0.3–1(–10) % av lysinnstrålingen på ei åpen havoverflate] at planteproduksjonen er mindre nedbrytningen og alger ikke lenger forekommer regelmessig (netto primærproduksjon går fra å være positiv til å bli negativ). 
	Hovedtypen inneholder både skrånende fast fjell (‘knaus’) og loddrette vegger. Knausene domineres av algesamfunn; på steder med optimale forhold (moderat bølge- og strømpåvirkning, ikke utsatt for direkte bølgeslag eller tørrlegging, gode lysforhold og normal salinitet) finner vi langs hele kysten velutviklete tareskoger [dominert av stortare (Laminaria hyperborea) og sukkertare (Saccharina latissima)]. Mot mindre gunstige kombinasjoner av leveforhold overtar andre arter eller artsgrupper; grønnalger på steder med redusert saltholdighet og/eller liten vannbevegelse og rødalger i dybdebeltet under tareskogsbeltet.  Bergvegger og knauser som er svært sterkt eksponert for bølger eller tidevannsstrømmer har spesielle organismesamfunn som er dominert av heterotrofe organismer som dødningehånd (Alcyonium digitatum) og ulike sekkdyr-arter (Tunicata: Ascidiacea).
'''
)
