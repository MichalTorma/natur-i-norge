# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% HU
hu_lec = LEC(
    _id='HU',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=3,
    knowledgeBaseDivision=2,
    spatialScale=10,
)
hu_lec_info_en = LECInfo(
    language_id='en',
    lec=hu_lec,
    name='Freshwater humus content',
    description='Variation in the concentration of particulate and dissolved organic matter in water, from oligohumous and transparent (<2 mg TOC/L; TOC = total organic carbon) via mesohumous to polyhumous, dark-coloured (> 15 mg TOC/L)',
)
hu_lec_info_nb = LECInfo(
    language_id='nb',
    lec=hu_lec,
    name='Humusinnhold',
    description='''Humusinnholdet, eller vannfargen, er et uttrykk for mengden partikulært og løst organisk materiale i ferskvann – økende innhold av organisk materiale gir vannet en mørkere farge. Det organiske materialet kan være produsert i vannsystemet (autoktont, stedegent) eller, oftere, er det tilført (alloktont) fra omgivelsene. De viktigste kildene til høyt humusinnhold i ferskvann er tilførsler fra myrer og skogsmark i nedbørfeltet. Turbiditet (TU) er et uttrykk for mengden suspendert uorganisk materiale i ferskvann.
	Av de 929 sjøene i NIVAs vannegenskapsdatabase som inkluderer målinger av pH, Ca og vannfarge (se NiN[1] Artikkel 18), hører 57,8 % til trinn HU∙a oligohumøs (definert som < 15 mg Pt/l), 17,0 % til trinn HU∙b (15–30 mg Pt/l), 6,5 % til trinn HU∙c (30–45 mg Pt/l), 12,7 % til trinn HU∙d (45–90 mg Pt/l) og 4,7 % til trinn HU∙e (> 90 mg Pt/l).
''',
)