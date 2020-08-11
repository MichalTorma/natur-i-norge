# %%
from model.model import MajorType, MajorTypeInfo

# %% M4
m4_major_type = MajorType(
    _id=4,
    majorTypeGroup_id='M',
)
m4_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m4_major_type,
    name='Euphotic marine sediment',
    description='Euphotic marine sediment comprises soft substrates in the marine hydrolittoral and euphotic sublittoral belts, extending down to the compensation point. Euphotic marine sediment is found on sites protected from the action of strong waves and currents, typically dominated by sand and silt or, on more exposed sites, by gravel and pebbles. The organic matter content varies a lot, from pure mineral to pure organic substrates. Special substrates such as dy, gyttja, shellbeds and maerlbeds belong here, as well as the large mudflats that can be seen many places along the coast of Norway, exposed at low tide.',
)
m4_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m4_major_type,
    name='Eufotisk marin sedimentbunn',
    description='''Eufotisk marin sedimentbunn omfatter natursystemer på ikke-stabiliserte sedimenter fra og med vannstranddelen av fjærebeltet (hydrolitoralbeltet; det vil si den delen av fjærebeltet der bunnen er dekket av vann mer enn halve tida) ned til kompensasjonsdypet, det vil si så langt ned som det er mulig for fotosyntetiserende fastsittende organismer å klare seg. Naturlig permanent oksygenfrie sedimenter er ikke inkludert i hovedtypen. Med ikke-stabilisert menes at sedimentene ikke er stabile nok til å ha stabile påvekstsamfunn av blad- og buskformete alger. Eufotisk marin sedimentbunn omfatter variasjonen fra relativt beskyttete steder dominert av silt og leire til nokså eksponerte steder dominert av grus og småstein. Innholdet av organisk materiale varierer fra nesten helt uten organisk materiale (rein sand, grus og/eller stein) til bunn som nesten er totaldominert av organiske sedimenter, og omfatter alle kornstørrelser fra den fineste leira til stein. Bunnfaunaen domineres av arter som lever nedgravd i sedimentet (infauna) og arter som lever på bunnen (epifauna). Mengden epifauna øker mot grovere og mer stabile sedimenter. Artsrikdommen avtar fra nedre fjæremål opp gjennom hydrolitoralbeltet. Store ‘mudderfjærer’ som tørrlegges ved lavvann, typisk dominert av fjæremark (Arenicola marina), muslinger og andre gravende dyr, hører til denne hovedtypen.'''
)


