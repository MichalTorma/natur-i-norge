# %%
from model.model import MajorType, MajorTypeInfo

# %% M8
m8_major_type = MajorType(
    _id=8,
    majorTypeGroup_id='M',
)
m8_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m8_major_type,
    name='Tidal swamp',
    description='Tidal swamp comprises dense, macrohelophyte-dominated stands in the hydrolittoral tidal belt, also including extensions of the helophyte belt downwards into the sublittoral belt and upwards into the geolittoral belt. Communities dominated by one single species, e.g., Phragmites australis, S. tabernaemontani and Bolboschoenus maritimus, are common. Tidal swamps are typically found on fine sediments in sheltered sites, such as estuaries and narrow bays. Freshwater supplies from the land-side are common.',
)
m8_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m8_major_type,
    name='Helofytt-saltvannssump',
    description='''Helofytt-saltvannssump omfatter tette bestander av makrohelofytter, det vil si storvokste sumpplanter [helofytt defineres som ‘plante som er tilpasset et liv i eller i nær tilknytning til vann (ferskvannsbunn, saltvannsbunn og/eller fjærebeltemark/bunn og/eller våtmark) gjennom forekomst av luftekanaler i rot, stengel og/eller blad; rota eller rotstokken kan mer eller mindre permanent stå i vann mens blader og blomster rager opp i lufta’] med røttene i sublitoral bunn (som ikke tørrlegges ved lavvann), i vannstrandbeltet eller noe opp i landstrandbeltet. Makrohelofyttene skaper et spesielt livsmiljø både for påvekstorganismer og bunndyr, slik at helofyttbeltet totalt sett har en artssammensetning som er vesentlig forskjellig fra samfunn uten karplanter eller med mer spredtvoksende karplanter eller karplanter tilhørende andre livs- og vekstformer. Enartsbestander er vanlig. Helofytt-saltvannssump forekommer på svært beskyttete steder med brakt vann, innerst i viker, kiler etc., typisk med tilsig av ferskvann fra landsida (ofte ved elve- eller bekkeutløp). Helofytt-saltvannssump er knyttet til finmaterialrike steder.'''
)