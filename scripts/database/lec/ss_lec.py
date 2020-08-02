# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% SS
ss_lec = LEC(
    _id='SS',
    structuringProcess_id='D',
    patternOfVariation_id='gs',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=2,
    spatialScale=3,
)
ss_lec_info_en = LECInfo(
    language=en_language,
    lec=ss_lec,
    name='Sand stabilisation',
    description='Variation in sand-dune stability, brought about by the tendency of sand to become more stable at increasing distances from the sand source (typically the coastline); LEC SS runs from naked sand-dominated littoral seabeds via active sand-dune systems to forests on stabilised sand and thus is a primary successional gradient starting with vascular plants colonising naked sand (this contrasts primary successions on rock substrates, which start with colonisation by mosses and lichens and continues with slow soil accumulation)',
)
ss_lec_info_nb = LECInfo(
    language=nb_language,
    lec=ss_lec,
    name='Sandstabilisering',
    description='''Strender som tilføres store mengder sand fra havsida, som transporteres videre innover land av sterke vinder, vil normalt utvikle seg til sanddynemark. Sandstabilisering (SS) er en kompleks miljøvariabel som gir uttrykk for den økende stabiliseringen av sanddynene med økende avstand fra strandlinja, som er resultatet av primær suksesjon (vegetasjonsetablering). Med økende avstand fra stranda øker tiden siden suksesjonen startet, samtidig som en rekke viktige miljøegenskaper endrer seg: sandtilførselen avtar, vindforstyrrelsen avtar, sanda stabiliseres og en gradvis jordsmonnutvikling finner sted som innebærer akkumulering av humus og økende evne til å holde på jordfuktigheten, men også utvasking av næringsstoffer og forsuring. Artstettheten øker et langt stykke ut i denne primære suksesjonen før det flater ut og etter hvert synker igjen.
	Begrepet ’stabilisering’ er valgt framfor alternative begreper som for eksempel ’etablering’ fordi sandbindingen (stabiliseringen av sanda) og etter hvert også oppbyggingen av et humuslag er de fundamentale prosessene i sanddynedynamikken..
	Sandstabilisering (SS) er beskrevet som en egen kompleks miljøvariabel fordi primærsuksesjonsforløpet ved stabilisering og kolonisering av flygesand skiller seg fra alle andre primærsuksesjonsforløp i en rekke henseender, både med hensyn til økologiske og geologiske prosesser. Dominerende geomorfologiske (landformdannende) prosess er vindvirkning (aeoliske prosesser; se NiN[1] Artikkel 17). I motsetning til suksesjoner på bergsubstrat, er karplanter (først og fremst sandbindende gras) de første innvandrerne mens moser og lav først kommer inn når sanda begynner å bli stabilisert. Primær suksesjon i andre fastmarkssystemer kjennetegnes ved oppbygging av et jordsmonn og akkumulering av mineralnæringsstoffer. Jordsmonnoppbygging finner også sted gjennom et sandstabiliseringsforløp; økende grad av stabilisering innebærer økende tjukkelse på humuslaget. Men i motsetning til langs andre primærsuksesjonsgradienter er den ’friske’ sanda som tilføres i tidlige suksesjonstrinn rikest på mineralnæring. 
	Sandstabilisering (SS) kommer til uttrykk som mer eller mindre distinkte soner fra strandlinja gjennom åpen sanddynemark til bakenforliggende skogsmark. Sonasjon og suksesjon følger hverandre derfor i stor grad langs denne komplekse miljøvariabelen. Endringen i artssammensetning er stor. De tidlige suksesjonstrinnene består av enkelt- eller få-artssamfunn eller vegetasjonsfrie sandflater som i henhold til retningslinjene for trinndeling skal oppfattes som separate basistrinn (SS∙a–c). Det foreligger ikke analyser som tallfester omfanget av endringer i artssammensetning i de mer etablerte delene av gradienten (SS∙dd–j); basistrinninndelingen for disse delene er derfor tentativ. 
''',
)