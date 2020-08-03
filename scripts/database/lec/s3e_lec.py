# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% S3E
s3e_lec = LEC(
    _id='S3E',
    parentLec_id='S3',
    structuringProcess_id='S',
    patternOfVariation_id='mf',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
s3e_lec_info_en = LECInfo(
    language_id='en',
    lec=s3e_lec,
    name='Erosion resistance',
    description='Running from suspended material with no resistance to erosion, to bedrock',
)
s3e_lec_info_nb = LECInfo(
    language_id='nb',
    lec=s3e_lec,
    name='Erosjonsmotstand',
    description='''Erosjonsmotstand (S3E) er første ‘dimensjon’ i S3-skjemaet fordi erosjonsmotstanden, eller eroderbarheten, anses som viktigste LKMg for å forklare variasjon i artssammensetning relatert til sedimentsammensetning. En presis definisjon av erosjonsmotstand er ‘et sediments evne til å motstå vannerosjon; målt som kritisk skjærstyrke, samt sedimentets evne til å motstå andre ytre påvirkninger slik det kommer til uttrykk gjennom sedimentets kornstørrelsesfordeling’. Begrepet kritisk skjærstyrke (critical shear strength) defineres i NiN med utgangspunkt i Bjerkeng & Molvær (2002) som ’kraften som må utøves for å gi begynnende oppvirvling, enten for enkeltkorn for grovere sedimenter (sand og grovere) eller for sedimentet som helhet for såkalt kohesive sedimenter som har betydelig innslag av silt og leire’. Kritisk skjærstyrke (og erosjonsmotstand) følger en J-formet kurve, den såkalte ‘Hjulström-figuren’, som funksjon av dominerende kornstørrelse (se NiN[2] Artikkel 1, Fig. B3–7; se også NiN[1] Artikkel 14, Hjulström 1935, Shields 1936, Bjerkeng & Molvær 2002 og Sulebak 2007). Kurvens form gjør at det innenfor hvert eroderbarhetsnivå finnes sedimenter med svært ulike dominerende kornstørrelser; stor erosjonsmotstand finner vi både i faste leirsedimenter og steindominerte sedimenter mens fin sand er det lettest eroderbare sedimentet. Innenfor silt- og leirdominerte sedimenter øker erosjonsmotstanden med økende ’pakking’ av sedimentene; det er en gradvis overgang mellom leirsedimenter og leirstein (forsteinet leire). Istidsavsetninger av fast blåleire (’moreneleire’) kan være nesten like faste som (løse) bergarter som f.eks. sandsteiner. Leirrike sedimenters erosjonsmotstand er også avhengig av sedimentenes vanninnhold, og vanninnholdet er indirekte og direkte viktig for sedimentenes funksjon som livsmedium, både for planter og for dyr.
	I sublitorale sedimentbunnsystemer er sedimentene i stor grad vasket ut og sortert av eroderende krefter (bølge- og strømvirkning) slik at kornstørrelsesfordelingen gjenspeiler sedimentenes (iboende) motstand mot erosjon. Erosjonsmotstand er derfor et godt begrep for den første dimensjonen innenfor S3 i disse systemene.
''',
)