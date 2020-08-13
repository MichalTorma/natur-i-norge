# %%
from model.model import MajorType, MajorTypeInfo

# %% H4
h4_major_type = MajorType(
    _id='H4',
    majorTypeGroup_id='H',
)
h4_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=h4_major_type,
    name='Strongly altered or artificial marine waterbody',
    description='Strongly altered or artificial marine waterbodies comprise physically delimited marine water-bodies that are changed by human activity, such as pollution.',
)
h4_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=h4_major_type,
    name='Sterkt endrete marine vannmasser',
    description='''Sterkt endrete marine vannmasser omfatter vannmassene i fysisk avgrensete saltvannsforekomster (fjorder, poller og litoralbasseng) som har fått sin artssammensetning og økologiske funksjon sterkt og irreversibelt endret gjennom fysiske (regulering av terskelhøyde for poller etc.), kjemiske inngrep (irreversibel forurensning, eutrofiering etc.) eller biologiske inngrep (utsetting av fiskearter, rømming fra fiskeoppdrettsanlegg el.l. som gjennomgripende har endret den trofiske strukturen og dermed artssammensetningen, etc.), samt vannmassene i kunstige vannforekomster (saltvannsbasseng, saltverk, friluftsakvarier etc.). Sterkt endret bunn medfører ikke nødvendigvis at vannmassene skal karakteriseres som sterkt endret.'''
)