# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% TE
te_lec = LEC(
    _id='TE',
    structuringProcess_id='R',
    patternOfVariation_id='g',
    knowledgeBaseRelations=5,
    knowledgeBaseDivision=5,
    spatialScale=-1,
)
te_lec_info_en = LECInfo(
    language_id='en',
    lec=te_lec,
    name='Peat-producing ability',
    description='Fine-scaled variation in the rate of peat production (and peat accumulation), from low (‘regressive’ mire sites dominated by liverworts, lichens and weakly peat-producing mosses) to high (‘progressive’ mire sites dominated by rapidly growing Sphagnum spp.)',
)
te_lec_info_nb = LECInfo(
    language_id='nb',
    lec=te_lec,
    name='Torvproduserende evne',
    description='Akkumulering av torv finner sted når produksjonen av organisk materiale er større enn nedbrytningen. Et stort og komplekst sett av miljøvariabler bestemmer hvorvidt torvakkumulering finner sted i en torvmark, og i så fall med hvilken hastighet. Eksempler på viktige variabler er forstyrrelser (isskuring, metanutslipp, etc.) og temperatur og fuktighetsforhold i vekstsesongen. På nedbørsmyr, til dels også på jordvannsmyr, er det stor variasjon i torvakkumuleringsarter på fin skala (få m; Ohlson & R. Økland 1998). Den viktigste umiddelbare grunnen til dette er stor fin-skala variasjon i hvilke arter (av torvmoser, levermoser og lav) som dominerer i bunnsjiktet, også mellom steder med samme plassering langs alle de viktigste miljøvariablene. De bakenforliggende årsakene til denne fin-skalavariasjonen er ikke helt klarlagt, men det er vel dokumentert at dominansforholdene på myr endrer seg over tid og dermed sannsynlig at det finnes en fin balanse mellom de ulike artsgruppene [dette er drøftet i detalj av R. Økland (1989a)]. På en åpen myr er det først og fremst graden av torvmosedominans (og om høy- eller lavproduktive arter dominerer) som bestemmer mengden organisk materiale som akkumuleres på hvert sted. Gradienten i torvproduserende evne er dermed også en gradient i artssammensetning fra steder med normal torvproduserende evne til steder der ingen torvakkumulering finner sted. Denne artssammensetningsgradienten er vel dokumentert (Malmer 1962, R. Økland 1989a, 1990b), og analyser av artslistedatasett B11E viser at den representerer en gradientlengde i overgang av 1 ØAE (NiN[2] Artikkel 2, kapittel B11). Begrepet ‘torvproduserende evne’ er uttrykk for en egenskap ved vegetasjonen (dens produktivitet) og ikke egentlig for en underliggende kompleks miljøvariabel. Til tross for at torvproduserende evne (TE) ikke har sin årsak i en veldefinert underliggende kompleks miljøgradient, er den inkludert som en LKM i NiN 2 for å gi mulighet for å beskrive en veldokumentert og lett observerbar gradient i artssammensetning. Gradienter som denne utvider dermed LKM-begrepet på samme vis som reine suksesjonsgradienter som langsom primær suksesjon (LA).',
)