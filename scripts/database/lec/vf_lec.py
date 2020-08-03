# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% VF
vf_lec = LEC(
    _id='VF',
    structuringProcess_id='D',
    patternOfVariation_id='ga',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=3,
)
vf_lec_info_en = LECInfo(
    language_id='en',
    lec=vf_lec,
    name='Water-mediated disturbance intensity',
    description='Variation in the intensity of water-mediated distur-bance in marine, freshwater and adjacent littoral and flooded-ground systems; from protected sites (still waters, slow-flowing rivers) to strongly exposed sites (large, fast-flowing rivers and strong tidal currents) where not even stone-dominated substrates are stable',
)
vf_lec_info_nb = LECInfo(
    language_id='nb',
    lec=vf_lec,
    name='Vannpåvirkningsintensitet',
    description='''Vann som forstyrrelsesagens er viktig både på fast bunn og på sedimentbunn. På marin sedimentbunn råder gjerne en likevekt mellom ytre påvirkning fra strøm, bølger etc. og sedimentenes dominerende kornstørrelse. I NiN 2 kommer variasjonen relatert til vannforårsaket forstyrrelse til uttrykk gjennom miljøvariabelen erosjonsmotstand (S3E), en av de tre enkeltvariablene som utgjør den flervariable komplekse miljøvariabelen sedimentsortering (S3). På fast bunn og i flomsonen langs elver med stor transportkapasitet, der det er store skiftninger mellom perioder med avsetning (sedimentasjon) og perioder med bortvasking (erosjon) av masser, og følgelig også stor variasjon i toppsedimentenes sammensetning, må vannets maksimale bevegelsesenergi brukes mer direkte til å beskrive vannforstyrrelsesintensiteten. To sett begreper og to uttrykk for vannets bevegelsesenergi blir brukt i NiN; for bølge- og strømenergi langs kysten og på fast bunn i innsjøer og i havet brukes Isæus’ ESWM-indeks og det tilhørende begrepsapparatet for grader av beskyttelse/eksponering, for rennende vann (inkludert flommarker langs elver) brukes begrepsapparatet for bevegelsesenergi i NiN 1, med vannhastighet og størrelse på partikler elva er i stand til å flytte som nøkkelegenskaper. Disse to seriene av begreper kobles sammen ved bruk av vannets evne til å transportere materiale, gitt av ‘Hjulström-figuren’ (NiN[2] Artikkel 2, kapittel B3k).
	Katastrofeflommene levner ingen tvil om at ekstremsituasjonene (de aller største flommene) har avgjørende betydning for artssammensetningen i flommarker. I havet er det mer usikkert hvordan bølger og strøm regulerer artssammensetningen. De studiene som er gjort (E. Oug, pers. medd.) finner bare svake sammenhenger mellom måleresultater for normalsituasjonen og biologisk respons. Det indikerer at det også i saltvannssystemer det er forstyrrelse forårsaket av sjeldnere forekommende ekstremsituasjoner som er utslagsgivende for gradienten i artssammensetning.
	Flommarker blir unngåelig utsatt for vann i en viss grad av bevegelse, slik at nulltrinnet ikke vil være det samme i stillestående vann og i elver. Plasseringen av flommarksskogsmark langs vannpåvirkningsintensitet (VF) i trinn VF∙b–e er tentativ, og litt skjematisk, men konsistent med resultatene av analyser av generalisert artslistedatasett B09F, som indikerer at det er grunnlag for å skille ut 2 hovedtypespesifikke standardtrinn med 4 basistrinn innenfor flommarksskogsmark. Den øvrige trinndelingen av gradienten er tentativ, og trenger å testes ved bruk av generaliserte artslistedata. Dette gjelder både i saltvanns- og i ferskvannssystemer. I flommark ender vannpåvirkningsintensitet (VF) i et artsuttynningsintervall. Til grunn for basistrinninndelingen av steder med høy vannpåvirkningsintensitet (VF) er lagt at artsuttynningsintervallets nedre endetrinn er VF∙f, og at gradientens naturlige øvre endetrinn VF∙¤ er realisert på steder der disruptivt miljøstress forhindrer en stabil artssammensetning. I henhold til retningslinjene for basistrinndeling av artsuttynningsgradienter (se NiN[2] Artikkel 2, kapittel B2i), skal vannpåvirkningsintensitet (VF) deles i fire basistrinn i artsuttynningsintervallet, slik at det totale antallet basistrinn blir 10. Sannsynligvis blir ikke det disruptive forstyrrelsestrinnet realisert på saltvannsbunn (med mulig unntak for særlig utsatte kyststrekninger). På dyp der vannpåvirkning bare skjer som følge av strøm er, i hvert fall i norske farvann, når vannhastigheten bare unntaksvis opp i 0,5 m/s (dvs. basistrinn VF∙c).
''',
)
