# %%
from model.model import MajorType, MajorTypeInfo

# %% M7
m7_major_type = MajorType(
    _id='M7',
    majorTypeGroup_id='M',
)
m7_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m7_major_type,
    name='Seagrass bed',
    description='Seagrass bed includes soft marine sediments dominated by eelgras (Zostera marina) and other hydrophytic vascular halophytes in the hydrolittoral belt and in shallow waters of the sublittoral belts. Green and brown algae may co-occur with the vascular plants, forming a three-dimensional community rich in micro-niches and, hence, in associated species.',
)
m7_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m7_major_type,
    name='Marin undervannseng',
    description='''Marin undervannseng omfatter sammenhengende områder på grunt vann og i vannstrand-delen av fjærebeltet som er dominert av langskuddplanter (plante med lange stengler og med blader i de frie vannmassene, oftest festet på bunnen), først og fremst ålegras (Zostera marina), men en rekke andre karplantearter kan også dominere eller inngå. Forekomst av grønn- og brunalger (på blandete sedimenter) er ikke uvanlig. Karplantedominerte marine undervannsenger kan ha et stort mangfold av assosierte arter, både påvekstorganismer og fauna som finner næring og beskyttelse der, i tillegg til den typiske sedimentbunnsfaunaen av organismer som lever på (epifauna) og i sedimentet (infauna).'''
)