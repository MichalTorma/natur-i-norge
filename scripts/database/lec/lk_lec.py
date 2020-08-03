# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% LK
lk_lec = LEC(
    _id='LK',
    structuringProcess_id='L',
    patternOfVariation_id='f',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=1,
    spatialScale=5,
)
lk_lec_info_en = LECInfo(
    language_id='en',
    lec=lk_lec,
    name='Slow secondary succession on coral reefs',
    description='Binary variable that separates two distinct stages in the development of coral reefs: young reefs dominated by living corals and aging reefs dominated by dead corals',
)
lk_lec_info_nb = LECInfo(
    language_id='nb',
    lec=lk_lec,
    name='Langsom sekundær suksesjon på korallrev',
    description='Korallrev (eller deler av korallrev) gjennomgår en naturlig aldringsprosess med to distinkte stadier: ‘unge’, levende rev med (dominans av) levende steinkoraller, og ‘aldrende rev’ med (dominans av) døde steinkoraller. Fordi tidsskalaer fra hundreår til tusenår er involvert og variasjonen gir seg utslag på romlige skalaer som opplagt er innenfor det skalaintervallet som adresseres på natursystemnivået i NiN 2, blir denne variasjonen beskrevet som en LKM.',
)