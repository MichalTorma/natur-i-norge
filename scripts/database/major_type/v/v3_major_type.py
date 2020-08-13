# %%
from model.model import MajorType, MajorTypeInfo

# %% V3
v3_major_type = MajorType(
    _id='V3',
    majorTypeGroup_id='V',
)
v3_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v3_major_type,
    name='Bog',
    description='Bog comprises all mires in which the uppermost peat layer is exclusively supplied with ombrogenous water (rainwater). Bog peat is inherently nutrient-poor and the main gradient in species composition is related to duration of period without inundation (inversely related to depth from the ground surface to the water-table), which expresses variation from carpets via lawns to hummocks. Furthermore, a gradient from mire margin to mire expanse is recognised. The bog major type also includes sites with a tree layer that satisfies the definition of forest (more than 10 \% of the area within the vertical projection of tree crowns).',
)
v3_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v3_major_type,
    name='Nedbørsmyr',
    description='''Nedbørsmyr skiller seg fra jordvannsmyr ved at overflatetorva ikke har kontakt med jordvann, slik at artene bare før tilført vann og mineralnæring via nedbøren. Innholdet av mineralnæringsstoffer i nedbøren, og dermed mineralnæringsinnhold, pH etc., varierer regionalt med avstand til kysten, framherskende vindretninger og tilførsler av N m.m. gjennom lufttransporterte forurensninger. Ombrogen torv (nedbørsmyrtorv) er imidlertid alltid fattigere på mineralnæring og N enn de mest kalkfattige jordvannsmyrer i samme område. Nedbørsmyr kjennetegnes av en artsfattig flora og fauna, og er stort sett negativt karakterisert i forhold til kalkfattige jordvannsmyrer ved mangel på såkalte fastmarksvann-indikatorer, det vil si arter som bare finnes på steder som tilføres fastmarksvann (= jordvann). Nedbørsmyr dannes over lang tid ved at torvlagene bygger seg så mektige at vann fra fastmarka hindres i å spre seg utover myra (kompakt torv gir effektiv oppdemming mot vann fra sidene) og så høyt over omgivelsene at grunnvannsspeilet hever seg over omgivelsenes grunnvannsspeil. Nedbørsmyr har samme grunnleggende økosystemstruktur som jordvannsmyr, men mineralnæringsfattigdommen gjør at næringsstoff-sirkulasjonen er enda ‘tettere’. I stor grad resirkuleres næringsstoffene i torvmoselaget. Mange tilpasninger til et næringsfattig miljø finnes, eksemplifisert ved de kjøttetende soldogg-artene (Drosera spp.) som utnytter insekter som ekstra nitrogenkilde.'''
)