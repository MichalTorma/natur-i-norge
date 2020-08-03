# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% MB
mb_lec = LEC(
    _id='MB',
    structuringProcess_id='D',
    patternOfVariation_id='f',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=3,
    spatialScale=6,
)
mb_lec_info_en = LECInfo(
    language_id='en',
    lec=mb_lec,
    name='Topsoil tilling',
    description='Binary variable that separates intensively managed land into two categories; land that is not regularly ploughed (i.e., subjected to topsoil tilling) from land that is regularly ploughed (and, in addition to tilling, often also fertilised and/or treated with herbicides)',
)
mb_lec_info_nb = LECInfo(
    language_id='nb',
    lec=mb_lec,
    name='Markbearbeiding',
    description='Sterkt endret jordbruksmark som er i aktiv bruk i norsk landbruk i dag kan fordeles på to ‘hoveddriftsformer’ som, både med hensyn til miljøforholdene og artssammensetningen (av jordbruksvekster og ugras) er vesentlig forskjellige; åker og varig eng. En åker er en fulldyrket mark som er pløyd og tilsådd (oftest også gjødslet og/eller sprøytet), der det dyrkes mat- eller fôrvekster, gjerne i monokultur. Åkeren pløyes og sås oftest til på nytt hvert år. Ugrassamfunnene består derfor overveiende av ettårige arter og det utvikles ikke engang forstadier til helhetlige økosystemer. Varig eng, på den andre siden, pløyes opp og så til igjen mye sjeldnere, typisk med (5–)10–15 års mellomrom, og rekker på denne tida å utvikle samfunn av flerårige arter. Det er forskjellen mellom de to driftsregimene som beskrives av variabelen markbearbeiding (MB).',
)