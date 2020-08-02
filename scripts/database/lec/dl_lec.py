# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% DL
dl_lec = LEC(
    _id='DL',
    structuringProcess_id='S',
    patternOfVariation='g',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=2,
    spatialScale=5,
)
dl_lec_info_en = LECInfo(
    language=en_language,
    lec=dl_lec,
    name='Depth-related light attenuation',
    description='Reduction of radiation intensity with water depth due to diffusion by light-absorbing particles and water molecule;. the rate of light attenuation depends on wavelength and the the compensation depth, below which respiration exceeds production and photosynthesising organisms cannot maintain stable populations, therefore varies strongly among water bodies',
)
dl_lec_info_nb = LECInfo(
    language=nb_language,
    lec=dl_lec,
    name='Dybderelatert lyssvekking',
    description='Dybderelatert lyssvekking er en av de viktigste LKM, både i saltvannssystemer og i ferskvannssystemer. Lyssvekking skyldes dels at vannet inneholder partikler (også organismer) som absorberer lys, dels at vannmolekylene og partikler i vannet sprer lyset. Den økologisk viktigste grenselinja langs dybderelatert lyssvekking i vann (DL) er kompensasjonsdypet (mellom trinn DL∙d og ∙e). Over kompensasjonsdypet er planteproduksjonen større enn nedbrytningen (respirasjonen) og fotosyntetiserende planter kan opprettholde rimelig stabile populasjoner over lang tid. Fordi lys av ulike bølgelengder svekkes med ulik hastighet mot dypet, gjenspeiler planteartenes dybdefordeling deres innhold av ulike pigmenter (og deres evne til å absorbere av lys med ulike bølgelengder).',
)