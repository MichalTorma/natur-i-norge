# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% KI
ki_lec = LEC(
    _id='KI',
    structuringProcess='S',
    patternOfVariation='g',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=5,
    spatialScale=1,
)
ki_lec_info_en = LECInfo(
    language=en_language,
    lec=ki_lec,
    name='Strength of spring-water influence',
    description='Variation in the degree to which the water supplied to terrestrial, wetland, limnic or marine systems have characteristics of spring water, i.e., constancy throughout the year of flow and chemical composition of water including high concentrations of dissolved O2, and temperature near the annual mean temperature of the area. In wetlands, spring-water influence increases from a level (topogeneous) to a sloping (soligenous) ground-water table.',
)
ki_lec_info_nb = LECInfo(
    language=nb_language,
    lec=ki_lec,
    name='Kildevannspåvirkning',
    description='''Uttrykker variasjon i ’kildestyrke’ langs en gradient som kan følges i våtmarkssystemer som fuktes av vann med horisontalt (topogent) grunnvannsspeil, via myr og fastmark som fuktes av (soligent) vann med hellende grunnvannsspeil, til fuktmark og kilder som tilføres vann med kildevannsegenskaper. Stabile (eustatiske) kilder (Bilde 7) utgjør endepunktet for økoklinen. Kildevannspåvirkning finner også sted i fastmarkssystemer, fra systemer uten regelmessig tilførsel av grunnvann til frodige lier med tydelig tilførsel av friskt grunnvann (KI∙c) med kildevannsegenskaper (wet flushing; Dahl 1957; se også Samuelsson 1917, Nordhagen 1943, Malmström 1949, R. Økland & Bendiksen 1985, R. Økland & Eilertsen 1993). Begrepet kildestyrke adresserer arealenhetenes totale ‘kildekarakter’, det vil si deres plassering langs en kompleks miljøvariabel som omfatter vanntilførselsstabilitet, ’friskhet’ (oksygeninnhold), temperaturstabilitet, stabilitet i kjemisk innhold og kanskje også konsentrasjoner av enkelte kjemiske stoffer. Det er fortsatt ikke klarlagt hvilken eller hvilke økologiske enkeltfaktorer som er viktigste årsak(er) til variasjon i artssammensetning langs kildevannspåvirkning (KI).
	Variasjonen langs kildevannspåvirkning (KI) finnes ikke bare mellom kildevannspåvirkete områder, men gir seg tydelig til kjenne også innen hvert enkelt område, f.eks. som vegetasjonssonering og variasjon i temperatur fra sentrum til periferi innenfor store kilder med eustatisk kildesentrum [se eksempler fra Rondane i Dahl (1957)], og variasjon fra kildesentrum nedstrøms via svak kilde til kildemyr og myr uten synlig kildevannspåvirkning der eustatiske kilder forekommer i overkanten av større bakkemyrer. Fransson (1972: 28) beskriver denne gradienten slik: 'Teoretiskt borde det (...) existera en gradient källvegetation – soligen kärrvegetation – topogen vegetation'. 
	Variasjon relatert til kildevannspåvirkning (KI) er en særlig viktig årsak til variasjon i artssammensetningen i områder med stor storskala-topografisk variasjon (på Vestlandet, i Nord-Norge og i fjellet), fordi grovt relieff fremmer forekomsten av kildehorisonter.
	Kildevannspåvirkning (KI) er en kompleks miljøvariabel med nulltrinn der det ikke er noen sporbar effekt av tilførsel av vann med ‘kildevannsegenskaper’ og naturlig endetrinn i stabile kilder med en kontinuerlig strøm av vann med nær konstant temperatur.
''',
)