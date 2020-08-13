# %%
from model.model import MajorType, MajorTypeInfo

# %% L4
l4_major_type = MajorType(
    _id='L4',
    majorTypeGroup_id='L',
)
l4_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=l4_major_type,
    name='Freshwater swamp',
    description='Freshwater swamp comprises dense, macrohelophyte-dominated stands in shallow lakes and slow-flowing rivers, also including extensions of the helophyte belt upwards into the adjacent geolittoral belt. Communities dominated by one single species, e.g. Phragmites australis, Schoenoplectus lacustris, Typha spp. and Carex spp., are common.',
)
l4_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=l4_major_type,
    name='Helofytt-ferskvannssump',
    description='''Helofytt-ferskvannssump omfatter tette bestander av makrohelofytter, det vil si storvokste sumpplanter [helofytt defineres som ‘plante som er tilpasset et liv i eller i nær tilknytning til vann (ferskvannsbunn, saltvannsbunn og/eller fjærebeltemark/bunn og/eller våtmark) gjennom forekomst av luftekanaler i rot, stengel og/eller blad; rota eller rotstokken kan mer eller mindre permanent stå i vann mens blader og blomster rager opp i lufta’], omkring eller under grensa mellom ferskvannssystem og fastmarks- eller våtmarkssystem. Makrohelofyttene skaper et spesielt livsmiljø både for påvekstorganismer og bunndyr, slik at helofyttbeltet totalt sett har en artssammensetning som er vesentlig forskjellig fra samfunn uten karplanter eller med mer spredtvoksende karplanter eller karplanter tilhørende andre livs- og vekstformer. Helofytt-ferskvannssump kan forekomme i kombinasjon med et relativt vidt spekter av sedimentegenskaper, og kan ikke entydig predikeres ut fra miljøforholdene. Det er sannsynlig at tilfeldigheter i spredning og etablering har betydning for hvor det finnes helofytt-ferskvannssump.'''
)