# %%
from model.model import LEC
from model.model import LECInfo
from language_data import en_language, nb_language

# %% IO
io_lec = LEC(
    _id='IO',
    structuringProcess_id='D',
    patternOfVariation_id='mf', #TODO supposed to be 'mf'
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=3,
)
io_lec_info_en = LECInfo(
    language_id='en',
    lec=io_lec,
    name='Organic matter content',
    description='Variation in the substrate’s content of organic matter ranging from predominantly inorganic (<10% organic matter) to predominantly organic substrates (<10% inorganic matter)',
)
io_lec_info_nb = LECInfo(
    language_id='nb',
    lec=io_lec,
    name='Innhold av organisk materiale',
    description='Akkumulering av organisk materiale finner sted i fastmarkssystemer, i våtmarkssystemer, i ferskvannssystemer og i saltvannssystemer. Det organiske materialet kan være produsert på stedet (autoktont, stedegent), det kan være tilført (alloktont; se NiN[1] Artikkel 12, kapittel A) eller det kan dels være stedegent, dels tilført. Akkumulering av stedegent organisk materiale er resultatet av at det over lengre tid (gjerne tusener av år) produseres mer organisk materiale enn det som brytes ned (dvs. at produksjonshastigheten er større enn nedbrytnings¬hastigheten, slik som f.eks. i torvmarker). Torv er stedegent akkumulert materiale, avsatt i fuktig/vannmettet miljø, hvis tørrvekt utgjøres av mer enn 30 % dødt organisk materiale. Tilført organisk materiale akkumuleres når tilførselen over lengre tid er større enn summen av bortførselen og nedbrytningen på stedet. Dy er akkumulert organisk materiale bestående av ukonsoliderte (løse) innsjøsedimenter som først og fremst inneholder utfelte humuspartikler og torvmosesrester, for det meste produsert alloktont. Gytje er innsjøsedimenter som hovedsakelig består av rester av planter og dyr som har levd i innsjøen, det vil si som er produsert autoktont. Mengden av organisk materiale har betydning for artssammensetning og økosystemfunksjon både i landsystemer og i vannsystemer. I landsystemer (fastmarks- og våtmarkssystemer) skiller torvmarker (IO∙b¤) seg fra mark dominert av uorganisk materiale med hensyn til mange viktige økosystemegenskaper [dynamikk, evne til vannlagring, artssammensetning dominert av moser, ofte torvmoser (Sphagnum spp.)]. I vannsystemer har sedimentenes innhold av organisk materiale betydning bl.a. fordi det organiske materialet fungerer som mat for detritusspisere og fordi det påvirker sedimentenes erosjonsutsatthet og dermed dets egnethet for organismer med ulike mekanismer for å holde seg fast i substratet.',
)