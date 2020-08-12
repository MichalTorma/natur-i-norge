# %%
from model.model import MajorType, MajorTypeInfo

# %% T15
t15_major_type = MajorType(
    _id=15,
    majorTypeGroup_id='T',
)
t15_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t15_major_type,
    name='Waterfall-sprayed meadow',
    description='Waterfall-sprayed meadow includes naturally open (treeless), meadow-like sites in the spray zone of waterfalls and larger streams. The vegetation is lush and mostly characterised by moisture-demanding vascular plants and bryophytes. The almost constant spray of water creates a characteristic environmental regime with lower temperatures, higher humidity and stronger winds than the surroundings. The physical properties of the spray water changes from large drops via droplets to mist and fog with increasing distance from the waterfall. Waterfall-sprayed meadows remain treeless because woody plants do not tolerate coverage by massive ice in winter, resulting from deposition of freezing waterfall spray.',
)
t15_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t15_major_type,
    name='Fosse-eng',
    description='''Fosse-eng omfatter naturlig åpne, grunnlendte, men jorddekte, engpregete fastmarksarealer i fossesprutsonen langs elveløp med fosser og fossestryk. Fosse-eng finnes først og fremst i ytterkanten av fossesprutsonen, særlig rundt ’foten’ av en foss. Fosse-engene inneholder, på grunn av de lange periodene med konstant fuktig mikroklima, en frodig karplantevegetasjon. De fleste artene i fosse-enger tåler imidlertid også tørrere perioder. Vannspruten jevner ut temperaturvariasjonen gjennom året; om sommeren er det kjøligere på fosseberg enn i tilgrensende områder lengre fra fossen, om vinteren mildere inntil fossen eventuelt fryser til med is. Arter som skal klare seg i fosse-eng må tåle innfrysing i is om vinteren. Fuktigheten avtar langs en gradient vekk fra fossen fordi den totale vanntilførselen og dråpestørrelsen avtar (fra tunge dråper nær fossen til fint ’fossestøv’ lenger unna). Natursystem-hovedtypen fosse-eng kan også finnes på finere sedimenter i nedre deler av ur (eller skredmark) nær foss.
	Artssammensetningen i fosse-eng har likhetstrekk både med kildevannspåvirkete utforminger av T4 Fastmarksskogsmark og T3 Fjellhei, leside og tundra. Årsaken til at fosse-engene forblir åpne, også nedenfor skoggrensa, er at vedplanter tåler dårlig å fryse inn i is om vinteren. Innfrysing i is kan finne sted i perioder med kuldegrader i lufta samtidig som vannet i fossen ikke er frosset. Mot store fosser setter sterk vannsprutintensitet grensa for jordsmonnsdannelse, og dermed også for forekomst av fosse-eng.
'''
)