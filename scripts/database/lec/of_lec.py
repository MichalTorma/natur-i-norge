# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% OF
of_lec = LEC(
    _id='OF',
    structuringProcess_id='D',
    patternOfVariation_id='g',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=2,
)
of_lec_info_en = LECInfo(
    language=en_language,
    lec=of_lec,
    name='Cryoturbation',
    description='Variation in the intensity of disturbance by frost processes, from stable ground via sites slightly affected by frost heaving, to sites strongly disturbed by frost processes, on fine soil typically dominated by small bryophytes',
)
of_lec_info_nb = LECInfo(
    language=nb_language,
    lec=of_lec,
    name='Oppfrysing',
    description='''Oppfrysing (kryoturbasjon) er frostomrøring på ei ujevn markoverflate. Frostfordeling og iskjernedannelse i perioder med temperaturer omkring frysepunktet skjer på ulike vis i forsenkninger og på forhøyninger i terrenget, og jo grovere og mer steinete jorda er, desto lengre ned i bakken trenger frosten. Spenningsforskjeller som oppstår i jorda fører til at materialet sorteres; det groveste materialet skyves unna spenningsfeltet, og det fineste materialet fraktes mot overflata. De fysiske prosessene som er involvert er fortsatt ikke fullstendig forstått, men resultatet blir i typiske tilfeller en strukturmark med strukturer som varierer i formen fra ringer til polygoner, nett og striper. Den typiske polygonmarka består av et nettverk av mangekantete til sirkulære områder med finjord, inntil 6(–10) m i diameter, som omgis av en 0,5–2 m brei (eller breiere), ofte svakt hevet steinkant. Etter en tid (noen årtier eller århundrer) med kraftig frostaktivitet kan jorda stabilisere seg. Det finnes altså en gradient fra polygoner med sterk oppfrysingsaktivitet (og ustabil jord) til stabiliserte systemer. I områder med permafrost forsterkes kryoturbasjonsprosessene av at det aktive laget er tynt. Flekker med aktiv frostsprenging har liten eller ingen påvekst av skorpelav på steinene. Oppfrysing fremmes av regionale faktorer som lav nedbør og lav vintertemperatur, og lokale faktorer som flatt terreng med stein- og blokkrik mineraljord, manglende eller tynt isolerende snødekke (frostvirkningen øker mot rabber) og høy grunnvannstand. Hyppigheten av oppfrysingsfenomener øker derfor mot et mer kontinentalt klima og med økende høyde over havet. 
	Kryoturbasjon motvirker den nedadgående vannstrømmen i jorda og gir normalt opphav til et jordsmonn med større mineralnæringsinnhold og høyere pH enn typisk for området for øvrig (Dahl 1957, Jonasson & Sköld 1983). Dahl (1957) karakteriserer derfor kryoturbasjon som en form for ’dry flushing’.
	Oppfrysing er en blant flere frostprosesser (periglasiale prosesser). Frostprosesser er mest intense i områder med permafrost (tilstand der all jord under et visst djup er permanent frosset), men forekommer også på steder uten permafrost. Permafrost fører til intensivering av alle periglasiale prosesser, kanskje først og fremst oppfrysing (kryoturbasjon).
	Dahl (1957) bruker begrepet ’solifluksjon’ (som på norsk betyr jordbevegelse) i vid betydning, både om jordflyt i snever betydning (slik begrepet er definert i NiN 2) og om oppfrysing (‘amorphous solifluction’ og ‘structured solifluction’). I NiN er jordflyt (JF) behandlet som egen LKM da den er uttrykk for andre økologiske prosesser med til dels annen effekt på artssammensetningen.
''',
)