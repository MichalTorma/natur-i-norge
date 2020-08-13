# %%
from model.model import MajorType, MajorTypeInfo

# %% L5
l5_major_type = MajorType(
    _id='L5',
    majorTypeGroup_id='L',
)
l5_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=l5_major_type,
    name='Freshwater spring',
    description='Freshwater spring includes bottoms of springs, streams, rivers and lakes that are clearly influenced by supply of oxygen-rich (rheogenous) water, i.e. water with nearly constant temperature, chemical composition and flow rates throughout the day and the year, housing distinctive communities.',
)
l5_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=l5_major_type,
    name='Ferskvannskildebunn',
    description='''Ferskvannskildebunn omfatter bunn i grunnkilder, torvmarkskilder, bekker, elver og innsjøer som tydelig influeres av konsentrerte grunnvannsframspring (kildevann). Fordi grunnvannet i sterke kilder har nær konstant temperatur gjennom døgnet og året, skiller leveforholdene i og nær ferskvannskildebunn seg markert fra leveforholdene på annen ferskvannsbunn. På det norske fastlandet er kildevannet vanligvis kjøligere enn vann for øvrig. Artsmangfoldet i og ved ferskvannskildebunn er derfor lavere enn i tilstøtende områder uten kildevannspåvirkning, og kuldetilpassete arter dominerer. Innsjø- og elvekildebunn skiller seg fra grunnkilde- og torvmarkskildebunn ved å være del av større vannsystemer, som har betydning for artstilfanget.'''
)