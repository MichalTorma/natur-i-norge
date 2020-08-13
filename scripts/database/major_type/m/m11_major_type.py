# %%
from model.model import MajorType, MajorTypeInfo

# %% M11
m11_major_type = MajorType(
    _id='M11',
    majorTypeGroup_id='M',
)
m11_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m11_major_type,
    name='Marine cold seep',
    description='Marine cold seeps are soft seabeds influenced by seepage of water and/or gases, e.g., hydrogen sulphide or methane. The fluid has the same temperature or is only slightly warmer than the adjacent water. Marine cold seeps vary from temporal and unstable pockmarks to stable cold seeps and also includes mud volcanoes, formed by emergence of gas-filled mud.',
)
m11_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m11_major_type,
    name='Kaldt gassoppkomme',
    description='''Kald havkildebunn (cold seep) omfatter sedimentbunn nær et oppkomme av gasser og/eller væsker på havbunnen, hvor materialet som strømmer ut ikke har så en temperatur så mye høyere enn havvannets temperatur på stedet at artssammensetningen påvirkes i betydelig grad. Kald utstrømming finner sted som resultat av geofysiske og/eller geokjemiske prosesser i havbunnen, og forekommer med stor variasjon i intensitet og varighet; fra temporære og/eller ustabile utstrømmingsområder (pockmarks) som gjerne er synlige på havbunnen som større eller mindre groper, til stabile, varige havkilder (cold seeps). Utstrømmingsmaterialet består primært av porevann som trykkes opp når sedimentære bergarter presses sammen av sin egen vekt og gasser (CO2, CH4, H2, H2S etc.), men lite sedimentmateriale.  Når utstrømmingen av væske og/eller gass er sterk (cold seeps) kan bunnsedimentene omkring utstrømmingspunktet (som vanligvis består av løst mudder) være svært ustabile. Mikrobiologiske og kjemiske prosesser i oppkommene kan imidlertid føre til dannelse av kalsiumkarbonatskorper som kan fungere som substrat for hardbunnsorganismer. Karbonatskorpene variasjon i overflatemorfologi på fin skala gjør dem til et spesielt substrat for fastsittende organismer. I spesielle tilfeller, kanskje betinget av særlig sterk utstrømming, kan utstrømmingsmaterialet inneholde store mengder gassfylt leire. Sedimentbunnen blir da svært løs og resultatet blir en muddervulkan (KT∙B). Det 
‘klassiske’ eksemplet på en muddervulkan er Håkon Mosby muddervulkan på 1250 m dyp sør for Bjørnøya. Oppkommer med avvikende eller intermediær kjemisk sammensetning finnes også. Den kjemiske sammensetningen av utstrømmingsmaterialet påvirkes betydelig av innholdet av kjemisk løsbare stoffer i løsmassene og/eller sedimentbergartene som materialet passerer gjennom.
	Det er ikke påvist klart forskjellig fauna mellom små pockmarks og øvrig sedimentbunn, men cold seeps med karbonatskorper har en karakteristisk bakterieflora og en del arter som lever på og av bakteriene. På Håkon Mosby muddervulkan finnes foruten bakterier også spesialiserte evertebrater (som utnytter metan) og fiskearter som er i stand til å leve på slike steder, men som også finnes i andre miljøer (og kanskje egentlig har sin hovedforekomst der).
'''
)