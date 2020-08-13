# %%
from model.model import MajorType, MajorTypeInfo

# %% M14
m14_major_type = MajorType(
    _id='M14',
    majorTypeGroup_id='M',
)
m14_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=m14_major_type,
    name='Strongly altered or artificial hard marine substrate',
    description='Strongly altered or artificial hard marine substrate includes a large variety of substrates that are altered by human intervention and new substrates, e.g., concrete, glass and steel. This major type includes permanent structures such as constructed port facilities and temporary installations such as oil rigs, pipelines and offshore wind-power farms.',
)
m14_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=m14_major_type,
    name='Sterkt endret eller ny fast saltvannsbunn',
    description='''Sterkt endret eller ny fast saltvannsbunn omfatter saltvannsbunn som er vesentlig endret ved irreversibelt inngrep, f.eks. havneutbygging, installasjoner (oljerigger, offshore vindmølleanlegg). Sterkt endret eller ny fast saltvannsbunn dekker vanligvis små arealer, og gjennomgår rask suksesjon mot en artssammensetning typisk for sammenliknbar naturlig fast saltvannsbunn dersom ikke helt spesielle forhold er til hinder for suksesjonen (glatt overflate, vedlikehold, etc.).'''
)