# %%
from model.model import MajorType, MajorTypeInfo

# %% V11
v11_major_type = MajorType(
    _id='V11',
    majorTypeGroup_id='V',
)
v11_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v11_major_type,
    name='Peat quarry',
    description='Peat quarries are mires (fens or bogs) subjected to harvesting of the upper peat layer for use as fuel or soil improvement. The surface of peat quarries therefore consists of exposed, old peat. Peat extraction sites are often recognized as rectangular pits with more or less straight edges. Water-filled peat quarries belong to the excavated freshwater sediment major-type (L8).',
)
v11_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v11_major_type,
    name='Torvtak',
    description='''Torvtak er V1 Åpen jordvannsmyr eller V3 nedbørsmyr der de øvre torvlagene er høstet, f.eks. til torvstrøproduksjon eller til bruk som brenntorv, slik at naken torv blir eksponert. Torvtekt kan gjøres på mange ulike måter; en metode som tidligere var vanlig brukt var at torv ble skåret i lange, dype striper som ofte endte opp som dype vassfylte gjøler, som alternerte med striper med intakt myroverflate. Nå høstes vanligvis torv over større sammenhengende områder, lag for lag. Torv er et organisk materiale. Når naken torv eksponeres for suksesjon, finner en rask suksesjon (se NiN[2] Artikkel 1, kapittel B3j) sted. Tidlige suksesjonsfaser på torvtak karakteriseres av stor grad av tilfeldighet i immigrasjonsrekkefølgen.'''
)