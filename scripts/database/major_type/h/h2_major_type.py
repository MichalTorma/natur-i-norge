# %%
from model.model import MajorType, MajorTypeInfo

# %% H2
h2_major_type = MajorType(
    _id=2,
    majorTypeGroup_id='H',
)
h2_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=h2_major_type,
    name='Circulating fjord, estuary, lagoon and rock pool waterbody',
    description='This major type includes waterbodies of fjords, estuaries, lagoons and rock pools, i.e. waters that are physically separated from oceanic marine waterbodies by a threshold and have a circulation system resembling that of lakes.',
)
h2_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=h2_major_type,
    name='Sirkulerende vannmasser i fysisk avgrensete saltvannsforekomster',
    description='''Sirkulerende vannmasser i fysisk avgrensete saltvannsforekomster omfatter økosystemer som hele tida eller periodisk tilføres havvann og som derfor tilfredsstiller definisjonen av brakkvann eller saltvann (SA∙a+). Graden av fysisk avgrensning fra H1 Havvannmasser varierer fra fjord (lang og smal havinnbukting som er overfordypet innenfor en markert terskel nær munningen) via poll [saltvannforekomst som er fysisk avgrenset fra havet, som regelmessig, men ikke permanent, tilføres havvann, som er skilt fra havet av en terskel ovenfor laveste fjærenivå, og som har permanent utløp til (og innløp fra) havet] til litoralbasseng [vannforekomster på fast fjell i fjærebeltet som er fysisk avgrenset fra havet, som regelmessig, men ikke permanent, tilføres havvann, og som ikke har permanent utløp til (og innløp fra) havet]. Som økosystem er disse vannmassene et delvis lukket system. Tilførsler av ferskvann med løst og partikulært organisk materiale fra land medfører redusert saltholdighet som ofte varierer sterkt gjennom året. I sterkt avsnørte fjordarmer og poller der store elver renner ut, kan vannet deler av året bli svært brakt. Med unntak for dype fjorder, som kan ha bunnvann av atlantisk havvann (som skal typifiseres som H1 Havvannmasser), kjennetegnes fysisk avgrensete saltvannsforekomster av at vannet sirkulerer, enten to ganger i året, vår- og høstsirkulasjon, som i innsjøer, eller (i dypere fjorder) i sommersesongen. Med økende grad av avsnøring fra havet og avtakende størrelse byttes artene som er typisk for havvannmassene gradvis ut og erstattes dels med ferskvannstilpassete arter, dels med arter med stor toleranse overfor variasjon i temperatur og salinitet som man finner i litoralbasseng.'''
)