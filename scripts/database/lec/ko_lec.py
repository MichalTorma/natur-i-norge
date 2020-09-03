# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% KO
ko_lec = LEC(
    _id='KO',
    structuringProcess_id='S',
    patternOfVariation_id='f',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=5,
    spatialScale=9,
)
ko_lec_info_en = LECInfo(
    language_id='en',
    lec=ko_lec,
    name='Connectivity',
    description='Binary variable that separates isolated water bodies from water bodies that are part of more or less extensive watercourse networks; connectedness increases species richness of organisms with dispersal limitations such as fish, larger molluscs and crustaceans',
)
ko_lec_info_nb = LECInfo(
    language_id='nb',
    lec=ko_lec,
    name='Konnektivitet',
    description='En rekke ferskvannsorganismer (fisk, større bløtdyr, krepsdyr etc.) mangler i enkelte vannforekomster fordi de ikke har spredd seg dit; i mange tilfeller fordi vannforekomsten ligger isolert uten tilknytning til et større vassdrag gjennom en utløpsbekk eller -elv. Miljøfaktoren konnektivitet angir om en innsjø er forbundet med et større vassdrag gjennom en utløpsbekk eller -elv.',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='KO.0',
    lec=ko_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='isolated'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='water body that is not connected to a major watercourse through an outlet stream or river'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='isolert'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='vannforekomst som ikke er forbundet med et større vassdrag gjennom en utløpsbekk eller -elv'
)
# all
all_elem_segment=ElementarySegment(
    _id='KO.¤',
    lec=ko_lec,
    value='¤',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<class>',
    value='part of a larger water system'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='en',
    key='<description>',
    value='water body connected to a larger watercourse through an outlet stream or river'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<class>',
    value='del av større vannsystem'
)
ElementarySegmentInfo(
    elementarySegment=all_elem_segment,
    language_id='nb',
    key='<description>',
    value='vannforekomst som er forbundet med et større vassdrag gjennom en utløpsbekk eller -elv'
)
