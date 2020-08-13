# %%
from model.model import MajorType, MajorTypeInfo

# %% T38
t38_major_type = MajorType(
    _id='T38',
    majorTypeGroup_id='T',
)
t38_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t38_major_type,
    name='Tree plantation',
    description='Tree plantation includes land with tree monocultures intensively managed for production of wood, e.g. by soil scarification, application of fertiliser and/or pesticides and/or planting of exotic tree species or native species out of their natural range, typically in so dense stands that understorey vegetation cover is substantially reduced or the ground entirely covered with needles or leaves.',
)
t38_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t38_major_type,
    name='Treplantasje',
    description='''Treplantasje omfatter tresatte arealer med ‘plantasjeskogkarakter’, det vil si mark som er tilplantet (eller tilsådd) med trær av ett og samme treslag, systematisk på rekke og rad, gjerne etter markberedning. De plantete trærne skal utgjøre over 90 % av treantallet, død ved og overstandere fra tidligere (naturlig) trebestand skal mangle. Treplantasjer er alltid ensjiktet og tilnærmet ensaldret og tresjiktet kan være så tett at undervegetasjon mangler mer eller mindre fullstendig. Tiltak som gjødsling og sprøyting er vanlig, og bidrar til at artssammensetningen i treplantasjer i liten grad gjenspeiler naturgitt miljøvariasjon. Treplantasje er skogbruksparallellen til sterkt endret jordbruksmark, med biomasseproduksjon av trær som (eneste) formål. Treplantasjer karakteriseres ikke som skogsmark fordi de ikke utgjør helhetlige økosystemer.'''
)