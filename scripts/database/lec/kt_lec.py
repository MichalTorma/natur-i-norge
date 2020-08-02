# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% KT
kt_lec = LEC(
    _id='KT',
    structuringProcess='S',
    patternOfVariation='f',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=7,
)
kt_lec_info_en = LECInfo(
    language=en_language,
    lec=kt_lec,
    name='Spring category',
    description='Complex environmental factor by which springs are sorted by ecological context into six categories: peaty spring, spring without peat formation; spring in river or lake, cold marine water and gas spring, cold marine mud spring, and marine magma spring',
)
kt_lec_info_nb = LECInfo(
    language=nb_language,
    lec=kt_lec,
    name='Kildetype',
    description='Konsentrerte framspring av grunnvann, kilder, forekommer i mange ulike økologiske sammenhenger (deres økologiske kontekst eller ‘setting’). Kildenes økologisk sammenheng er gitt av det eller de natursystemene som dominerer omkring kildeframspringet. Her videreføres begrepet ‘kildetype’ om kildenes økologiske sammenheng jf. J. Økland & K. Økland 1996: 258–259). Inndelingen i kildetyper tar utgangspunkt i tredelingen hos J. Økland & K. Økland (1996), men modifiserer og utvider denne, og kobler den tydeligere til den økologiske sammenhengen kilden forekommer i, gitt av det omkringliggende natursystemet. Kildetype (KT) inkluderer også differensiering mellom ulike kategorier av havbunnskilder på basis av utstrømmingsmaterialets egenskaper; hva som strømmer ut er også et uttrykk for de geologiske prosessene som forårsaker utstrømming. ',
)