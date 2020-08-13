# %%
from model.model import MajorType, MajorTypeInfo

# %% M12
m12_major_type = MajorType(
    _id='M12',
    majorTypeGroup_id='M',
)
m12_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m12_major_type,
    name='Hydrothermal vent',
    description='Hydrothermal vents are fissures in rocky seabed in volcanically active areas from which geothermally heated water, e.g., water that has been in contact with volcanic lava, emerges. When hot, mineral-rich water meets the cold ambient seawater, dissolved minerals may precipitate to form new hard-substrate structures. Hydrothermal vents are found in volcanically active areas, e.g., along the North Atlantic ridge north east of Jan Mayen. Hydrothermal vents are biologically productive ecosystems which, among others, host specialised communities of chemosynthetic bacteria.',
)
m12_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m12_major_type,
    name='Varm havkilde',
    description='''Varm havkildebunn omfatter områder på fast havbunn (eventuelt med flekker av sedimentbunn) som påvirkes av utstrømming av vann, gasser, andre væsker eller magma, med vesentlig høyere temperatur enn havvannet på stedet. Utstrømming av oppvarmet væske eller gass er resultatet av at havvann sirkulerer fra havbunnen ned til varme vulkanske masser opptil flere kilometer under havbunnen og opp igjen. Varm utstrømming finner først og fremst sted langs midthavsrygger med havbunnsspredning; i norske farvann spredt langs hele den atlantiske midthavsryggen. Avhengig av materialmengden, materialets kjemiske sammensetning og temperatur framviser varme havkilder stor og til dels sterkt områdespesifikk variasjon i artssammensetning, typisk med meget spesielle organismesamfunn der bakterier spiller en viktig rolle. Utstrømmingsmaterialet kan ha temperaturer opp til flere hundre °C, men ingen organismer kan leve sittende på substrater varmere enn 100 °C. Ved temperaturer over ca. 50 °C finnes stort sett bare bakterier.'''
)