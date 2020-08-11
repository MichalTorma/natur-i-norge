# %%
from model.model import MajorType, MajorTypeInfo

# %% M9
m9_major_type = MajorType(
    _id=9,
    majorTypeGroup_id='M',
)
m9_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m9_major_type,
    name='Tidal rockpool seabed',
    description='Tidal rockpools are pools on rocky substrate in bedrock depressions the upper part of the tidal zone. Physically delimited from the sea, tidal rockpools typically receive sea-water supplies at high tide. Rock pools in the supralittoral belt, that are only supplied with salt water during spring tide, are considered tidal rockpools as long as the average salinity of their water is 0.5 ppt or higher. Tidal rockpools are marine exclaves in a terrestrial matrix, typically surrounded by the rocky shore (T6) major type. Temperature and salinity may vary considerably throughout the year, more in smaller than in larger rock pools and more in rock pools with infrequent sea-water supplies. Salinity decreases when freshwater is supplied by precipitation or melting snow, but increases after periodic seawater supply. Periodic hypersalinity may occur near the end of long, dry summer periods.',
)
m9_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m9_major_type,
    name='Litoralbasseng-bunn',
    description='''Litoralbasseng er vannforekomster på fast fjell i fjærebeltet som er fysisk avgrenset fra havet, som regelmessig, men ikke permanent, tilføres havvann, og som ikke har permanent utløp til (og innløp fra) havet. Litoralbasseng kjennetegnes ved stor miljøvariasjon, først og fremst i temperatur og salinitet, men også utsatthet for isskuring etc. Desto mindre vannvolum bassenget inneholder og sjeldnere bassenget tilføres nytt havvann, jo større blir miljøvariabiliteten. Saliniteten avtar når mye ferskvann tilføres (f.eks. ved snøsmelting eller etter mye nedbør) og øker ved langvarig sommertørke. Tendensen til islegging om vinteren er sterkere enn i havet utenfor, og i varmeperioder om sommeren kan vannet i små litoralbasseng bli sterkt oppvarmet. Artssammensetningen skiftes gradvis ut fra dominans av tangarter i store, dype litoralbasseng med vannutskifting ved hvert tidevannsskifte (SM∙1×TV∙1) via dominans av tarmgrønske (Ulva intestinalis) og grønndusk-arter (Cladophora-arter) i mindre litoralbasseng med sjeldnere utskifting av arter (SM∙2×TV∙2), til kraftig uttynning av artssammensetningen på bunnen i temporære litoralbasseng. Det kan være stor variasjon i artssammensetning mellom bunnsystemer i litoralbasseng med samme plassering langs antatt viktige miljøgradienter.'''
)