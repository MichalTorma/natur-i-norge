# %%
from model.model import MajorType, MajorTypeInfo

# %% M6
m6_major_type = MajorType(
    _id=6,
    majorTypeGroup_id='M',
)
m6_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m6_major_type,
    name='Coral reef seabed',
    description='Coral reef seabed is built by the activity of reef-building stone corals over hundreds and thousands of years. The stone coral Lophelia pertusa is quantitatively most important, another common species is the zigzagcoral Madrepora oculata. The coral reefs of Norway are cold-water reefs which lack the symbiotic algae of tropical coral reefs and, accordingly, occurs in the aphotic belt on the Norwegian continental shelf at depths from 40 to ca. 600 m, associated with Atlantic watermasses.',
)
m6_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m6_major_type,
    name='Korallrev',
    description='''Korallrev er særpregete natursystemer som er bygd opp av samfunnsdannende steinkorallers kalkskjelett. Steinkorallen Lophelia pertusa er den absolutt dominerende revdannende korallen i norske farvann, men også siksakkorall (Madrepora oculata) kan danne større bestander. Norske korallrev er, i motsetning til tropiske korallrev, kaldtvannskorallrev som ikke er avhengig av lys. Den komplekse romlige strukturen korallrevene har, og deres langlevethet (de eldste delene av norske korallrev er datert til rundt 9 000 år) gjør dem til svært artsrike økosystemer. Imidlertid er det ingen av artene som er funnet på norske Lophelia-rev som ikke også er kjent fra andre natursystemer. I norske farvann er korallrev kjent fra Ytre Oslofjord, utenfor kysten av Hordaland og fra Sunnmøre til Vest-Finnmark. Korallrev forekommer i det afotiske beltet, på dyp fra 40 m (i Trondheimsfjorden) til om lag 600 m, begrenset nedad av de kalde dyphavsvannmassene.'''
)