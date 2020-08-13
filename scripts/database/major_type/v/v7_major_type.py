# %%
from model.model import MajorType, MajorTypeInfo

# %% V7
v7_major_type = MajorType(
    _id=7,
    majorTypeGroup_id='V',
)
v7_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v7_major_type,
    name='Arctic permafrost wetland',
    description='Arctic permafrost wetland is dependent on permafrost, occurring only in the middle arctic tundra zone on Svalbard. This major type is found on level ground and in shallow depressions that are filled with stagnant water during thawing of the active layer. The water-table is level with, or situated just above, the moss layer for most of the summer. The vegetation is dominated by mosses and a few, specialised vascular plants that tolerate the combination of low temperatures, occasional freezing in ice and standing water.',
)
v7_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v7_major_type,
    name='Arktisk permafrost-våtmark',
    description='''Arktisk permafrost-våtmark omfatter karakteristiske våtmarkssystemer i den mellomarktiske tundrasonen på Svalbard som er betinget av permafrost. Natursystem-hovedtypen finnes på flater og i forsenkninger i terrenget, der stagnerende vann samler seg og blir stående i eller like over mosesjiktet det meste av sommeren. Permafrostlaget ligger da som et betonggulv 30–40 cm under markoverflaten. Kombinasjonen av stående vann og iskald mark (temperaturen er omkring 0 °C hele sommeren) begrenser artsutvalget til noen få arter som tåler både vanndekning og tidvis innfrysing i is.'''
)