# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% DM
dm_lec = LEC(
    _id='DM',
    structuringProcess_id='S',
    patternOfVariation='g',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=9,
)
dm_lec_info_en = LECInfo(
    language=en_language,
    lec=dm_lec,
    name='Depth-related environmental stabilisation',
    description='Gradual stabilisation of marine environments with increasing depth, reflected in reduced amplitudes of temperature, salinity and kinetic energy; depths > 2000 m are characterised by constant temperature < –0.5°C, food shortage and high hydrostatic pressure',
)
dm_lec_info_nb = LECInfo(
    language=nb_language,
    lec=dm_lec,
    name='Dybderelatert miljøstabilisering',
    description='I den afotiske t finner det sted en betydelig artsutskifting mot dypet. Mange enkeltvariabler er korrelert med dyp (trykk, temperatur, mattilgang etc.). Det er til dels uklart hvilke av disse som er utslagsgivende for den vertikale fordelingen av arter innen ulike artsgrupper eller om det er den økte stabiliteten i en lang rekke viktige miljøvariabler med økende dyp som er utslagsgivende. Med økende dyp avtar variasjonen i temperatur gjennom året, variasjonen i salinitet og i bevegelsesenergi. I tillegg avtar temperaturen. Graden av dybderelatert miljøstabilisering øker med skiftende vannmassetyper fra kystvann via atlantisk vann og intermediært vann til dyphavsvann (‘minusvann’). Vannmassetilhørighet er hovedkriterium for tilordning til DM-trinn; dybdeangivelsene i tabellen er omtrentlige og avvik forekommer. Dybdegrenser for de ulike stabilitetsnivåene varierer regionalt og med strømforholdene, f.eks. ligger grensene på mye større dyp i dype fjorder enn på åpent hav, og de ligger noe dypere i sør enn i nord. Sognefjorden, Tysfjord og andre dype terskelfjorder har atlantisk vann til de største dyp, med temperaturer som vanligvis ikke faller under 4 °C, og tilhører derfor i sin helhet DM∙b. Dybderelatert variasjon i dype terskelfjorder beskrives ved bruk av LKM dybderelatert variasjon i dype terskelfjorder (DD).',
)