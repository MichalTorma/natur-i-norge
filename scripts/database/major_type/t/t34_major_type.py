# %%
from model.model import MajorType, MajorTypeInfo

# %% T34
t34_major_type = MajorType(
    _id='T34',
    majorTypeGroup_id='T',
)
t34_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t34_major_type,
    name='Coastal heath',
    description='Coastal heath includes open coastal land, mostly dominated by Calluna vulgaris but occasionally dominated by other ericaceous species such as Empetrum nigrum and Erica tetralix. Coastal heath is conditioned on a long-term management regime that includes prescribed burning, often in combination with all-year livestock grazing and in former times also haymaking. Coastal heaths are confined to areas with a mild winter climate. Since the middle of the 20th century, traditional use of coastal heaths has decreased and extensive areas have been abandoned or replanted with trees.',
)
t34_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t34_major_type,
    name='Kystlynghei',
    description='''Kystlynghei omfatter åpne heipregete økosystemer som er betinget av lyngbrenning, gjerne i kombinasjon med beiting store deler av året og/eller slått. Dominans av dvergbusker, først og fremst nøkkelarten røsslyng (Calluna vulgaris), er typisk. Røsslyng har utviklet tilpasninger til det spesielle hevdregimet som har opprettholdt kystlynghei. Det er f.eks. dokumentert gjennom eksperimentelle undersøkelser at røsslyngfrøenes spiring begunstiges av brann (røyk) i, men ikke utenfor, kystlyngheibeltet (Måren et al. 2010). Kystlyngheier kan imidlertid ha sterkt innslag også av andre lyngarter, som f.eks. krekling (Empetrum nigrum), klokkelyng (Erica tetralix) og blokkebær (Vaccinium uliginosum) og/eller av lite kalkkrevende graminider, som blåtopp (Molinia caerulea) og bjørneskjegg (Trichophorum cespitosum). Kystlyngheier i bruk mangler eller har svært sparsom forekomst av moser og lav. Kystlyngheiene er formet gjennom rydding av kratt og trær og flere tusen års hevd, der nøkkelfaktoren i hevdregimet er lyngbrenning, og hvor typisk også beiting gjennom store deler av, eller hele, vekstsesongen er viktig (se Måren & Vandvik 2009, Måren et al. 2010, og NiN[2] Artikkel 1, kapittel B3h og Fig. B3–5). Et vintermildt (oseanisk) klima er en forutsetning for en lang beitesesong, og kystlynghei er derfor først og fremst knyttet til kystnære lavlandsområder. Kystlynghei finnes i et breit belte langs kysten fra Kragerø i Telemark til Lofoten i Nordland, kanskje også på Hvaler i Østfold som en nordlig utløper av det vestsvenske lyngheiområdet. Heier betinget av lyngbrenning, som skal tilordnes kystlyngheiene, forekommer imidlertid også i høyereliggende områder litt innenfor kysten, i Dalane (Rogaland) opp til ca. 400 m o.h. (Steinnes 1988). Størstedelen av kystlynghei-arealet gror nå igjen som følge av at bruken har opphørt.'''
)