# %%
from model.model import MajorType, MajorTypeInfo

# %% T37
t37_major_type = MajorType(
    _id=37,
    majorTypeGroup_id='T',
)
t37_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t37_major_type,
    name='Artificial soft substrate',
    description='Artificial soft substrate includes household waste deposits, spoil heaps and soft plastic and other synthetic substrates which facilitate rapid succession from pioneer vegetation dominated by ruderal species.',
)
t37_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t37_major_type,
    name='Ny fastmark på sterkt modifiserte og syntetiske substrater, i rask suksesjon',
    description='''Ny fastmark på sterkt modifiserte og syntetiske substrater, i rask suksesjon, omfatter all fastmark som gjennom omfattende inngrep har fått et nytt dekke av sterkt modifiserte eller syntetiske substrater (livsmedier), og som ligger til rette for rask suksesjon. Sterkt modifiserte livsmedier omfatter substrater som er så sterkt bearbeidet eller gjennom flytting til andre omgivelser får vesentlig endring i artssammensetningen, mens syntetiske livsmedier omfatter nye livsmedier som plast og asfalt. Sterkt modifiserte og nye livsmedier gjennomgår rask suksesjon, det vil si så rask kolonisering at ettersuksesjonstilstanden kan forventes nådd i løpet av (100–)150 år, når de er tilstrekkelig myke, raskt nedbrytbare eller raskt går i oppløsning.'''
)