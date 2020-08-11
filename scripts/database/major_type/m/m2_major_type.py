# %%
from model.model import MajorType, MajorTypeInfo

# %% M2
m2_major_type = MajorType(
    _id=2,
    majorTypeGroup_id='M',
)
m2_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m2_major_type,
    name='Aphotic marine rock',
    description='Aphotic marine rock comprises hard substrates below the compensation point, i.e., where light intensities are too low for positive net assimilation by photosynthesis. Algae are absent; various animal communities dominate. Sponges (Porifera) are common. The species composition varies with depth, temperature and nutrient supply. The major type comprises variation from sheltered via moderately to strongly exposed hard substrates, while strongly exposed substrates are rarely found.',
)
m2_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m2_major_type,
    name='Afotisk fast saltvannsbunn',
    description='''Afotisk fast saltvannsbunn omfatter fast fjell og grove sedimenter som er stabile nok til å ha permanente samfunn, på større dyp enn kompensasjonsdypet (der planteproduksjonen er mindre enn nedbrytningen og alger ikke lenger forekommer regelmessig). Hovedtypen inneholder både skrånende fast fjell (‘knaus’) og loddrette vegger; begge deler forekommer ned til de største dyp. Med økende dyp endrer artssammensetningen seg, med økende tilpasning til et stabilt kaldt miljø med begrenset næringstilgang. Også på store dyp finnes betydelig variasjon i strømforhold, som gir seg utslag i variasjon i artssammensetningen. Med økende strøm erstattes sedimentspiserne av detritusspisere, som i sin tur erstattes av særlig strømtolerante arter. Dype kløfter med sterk strøm er f.eks. observert på den midtatlantiske ryggen ned til ca. 2500 m.
	Stedvis kan faunaen domineres av større, bestandsdannende arter, først og fremst store hornkoraller som sjøtre (Paragorgia arborea), men også sjøbusk (Paramuricea placomus) og risengrynkorall (Primnoa resedaeformis), og svamper.
'''
)

