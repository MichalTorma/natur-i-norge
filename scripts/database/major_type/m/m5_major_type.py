# %%
from model.model import MajorType, MajorTypeInfo

# %% M5
m5_major_type = MajorType(
    _id=5,
    majorTypeGroup_id='M',
)
m5_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m5_major_type,
    name='Aphotic marine sediment',
    description='Aphotic marine sediment comprises all soft substrates below the compensation point, where the light intensity is too low to support photosynthesis. Algae are absent; various animal communities dominate. Species richness generally decreases towards larger depths. Aphotic marine sediment is typically found on sites protected from the action of strong waves and currents, dominated by sand and silt, but special substrates such as dy, gyttja, shellbeds, sponge spicule beds and coral gravel beds also belong to this major type.',
)
m5_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m5_major_type,
    name='Afotisk marin sedimentbunn',
    description='''Afotisk marin sedimentbunn omfatter natursystemer på ikke-stabiliserte sedimenter nedenfor kompensasjonsdypet, som ikke har naturlig permanent oksygenfrihet. Med ikke-stabilisert menes at sedimentene ikke er stabile nok til å ha stabile påvekstsamfunn. Afotisk marin sedimentbunn omfatter variasjonen fra relativt beskyttete steder dominert av silt og leire til nokså eksponerte steder dominert av grus og småstein. Innholdet av organisk materiale varierer fra nesten helt uten organisk materiale (rein sand, grus og/eller stein) til nesten totaldominans av organiske sedimenter, og omfatter alle kornstørrelser fra den fineste leira til stein. Bunnfaunaen domineres av arter som lever nedgravd i sedimentet (infauna) og arter som lever på bunnen (epifauna). Mengden epifauna øker mot grovere og mer stabile sedimenter.
	Stedvis kan faunaen domineres av større, bestandsdannende arter, f.eks. store hornkoraller (som først og fremst finnes i M2 Afotisk fast saltvannsbunn og på M6 Korallrev), eller, mer karakteristisk for sedimentbunn, av sjøfjær-arter eller svamper.
	Mot større dyp finner det sted en gradvis utskifting av faunaen og en gradvis reduksjon i artsantallet for de fleste dyregrupper. Et viktig økologisk skille, som også viser seg i artssammensetningen, går omkring 700 meters dyp mellom atlantisk vann med temperaturer som varierer, men er over 0 °C, og dyphavsvann med stabile temperaturer under frysepunktet.
'''
)


