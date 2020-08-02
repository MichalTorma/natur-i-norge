# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% VR
vr_lec = LEC(
    _id='VR',
    structuringProcess_id='D',
    patternOfVariation_id='f',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=7,
)
vr_lec_info_en = LECInfo(
    language=en_language,
    lec=vr_lec,
    name='Vannpåvirkningsregime',
    description='Det er grunn til å anta at vannets bevegelsesenergi har mer eller mindre samme effekt på artssammensetningen på fast saltvannsbunn ved lave energinivåer, uansett om ‘energikilden’ er bølgeenergi eller strømenergi. Når energinivået øker, er det grunn til å tro at dette endrer seg slik at det på svært eller ekstremt eksponerte steder [vannpåvirkningsintensitet (VF) basistrinn VF∙g eller høyere) er betydelig, kanskje vesentlig forskjell i artssammensetningen mellom steder påvirket av bølger og steder påvirket av sterk strøm. Mens bølger har en uforutsigbar forstyrrelseseffekt, er påvirkningen fra sterke tidevannsstrømmer mer forutsigbar og forekommer med høyere frekvens slik at den mer får karakter av miljøstress. Den lokale miljøfaktoren vannpåvirkningsregime (VR) uttrykker denne variasjon fra et forstyrrelsespreget påvirkningsregime med bølgeslag som viktigste påvirkning til et miljøstresspreget påvirkningsregime med tidevannsstrømmer som viktigste påvirkning.',
)
vr_lec_info_nb = LECInfo(
    language=nb_language,
    lec=vr_lec,
    name='Water-mediated disturbance regime',
    description='Binary variable that, for marine sites with high water-mediated disturbance intensity (high water energy), distinguishes between two disturbance regimes: the less predictable action of waves and the more predictable action of strong tidal currents',
)
