# %%
from model.model import MajorType, MajorTypeInfo

# %% T6
t6_major_type = MajorType(
    _id='T6',
    majorTypeGroup_id='T',
)
t6_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t6_major_type,
    name='Rocky shore',
    description='The rocky shore major type comprises bare rock in the geolittoral belt and supralittoral belts of the tidal belt, distinctly influenced by sea salt. The lower limit of T6 is the limit between the marine seabed (M) and terrestrial (T) major-type groups, indicated by the shift from dominance by saltwater-adapted organisms (e.g. the barnacle Semibalanus balanoides and the winkle Littorina littorea) to dominance by terrestrial organisms, typically the lichen Verrucaria maura. Upwards, the rocky shore major type (T6) extends as far as the vegetation retains a prominent signal from salt-tolerant or salt-preferring species and lacks species with low tolerance for sea-salt spray (e.g. ericaceous species). Salt-tolerant mosses and lichens may occur. Patches of salt-tolerant vascular plants, which may occupy crevices, represent mosaic elements of tidal salt meadow (T12) in a rocky shore matrix.',
)
t6_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t6_major_type,
    name='Strandberg',
    description='''Strandberg omfatter fast bunn (bunn som er stabil også ved sterkt bølgeslag og sterk strøm, det vil si blokkdominert bunn og fast fjell) ovenfor grensa mellom saltvannssystemer og fastmarkssystemer, som på fast mark/bunn trekkes ved øvre grense for dominans av fjærerur (Semibalanus balanoides) og vanlig strandsnegl (Littorina littorea) på den siden og nedre grense for den svarte laven marebek (Verrucaria maura) på den andre siden. Denne biologiske grensa mellom saltvannstilknyttete arter og landtilknyttete arter ligger nær øvre flomål (Du Rietz 1947, Sjörs 1967, Rueness 1998, Fredriksen & Throndsen 2001), altså nær grensa mellom øvre landstrand og bølgeslagsbeltet [nedre og midtre supralitoralbeltet; dvs. mellom trinnene TV∙h og TV∙i langs tørrleggingsvarighet (TV)]. Oppover strekker strandberg seg så langt som det er distinkt innslag av salttolerante eller saltpreferende arter i artssammensetningen, ei grense som markerer overgangen mellom bølgesprutbeltet og ‘saltstøvbeltet’ (Køie & Kristiansen 2000). Strandberg kan flekkvis huse karplanter, men berg uten sprekker eller andre steder hvor planter kan få fotfeste, kan mangle karplantevegetasjon over større områder. Strandberg dekker oftest små arealer, men kan på svært værutsatte steder ha betydelig lineær og vertikal utstrekning (og strekke seg flere titalls meter innover land.'''
)