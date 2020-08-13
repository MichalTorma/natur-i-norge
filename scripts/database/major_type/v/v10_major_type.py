# %%
from model.model import MajorType, MajorTypeInfo

# %% V10
v10_major_type = MajorType(
    _id='V10',
    majorTypeGroup_id='V',
)
v10_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v10_major_type,
    name='Semi-natural wet meadow',
    description='Semi-natural wet meadow comprises graminoid-dominated land more or less without peat formation, shaped by livestock grazing and/or haymaking. Semi-natural wet meadows are most often found on periodically flooded river or stream banks or along lakes. While formerly used for hay-making and/or grazing, semi-natural wet meadows are now, with few exceptions, either abandoned or used as pastures. The vegetation is dominated by graminoids and herbs and the bottom layer is poorly developed.',
)
v10_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v10_major_type,
    name='Semi-naturlig våteng',
    description='''Semi-naturlig våteng omfatter semi-naturlig mark (HI∙bcde) med grunnvannsspeil som det meste av året står høyt nok til at definisjonen av våtmark er tilfredsstilt, og som mangler torvproduksjon (IO∙0a). Semi-naturlige våtenger er først og fremst knyttet til flomsonen langs bekker og elver (samt innsjøer); mark som kan ha vært T30 Flomskogsmark, V2 Myrskogsmark eller kanskje aller helst, V8 Strandsumpskogsmark, for eksempel dominert av svartor (Alnus glutinosa) eller vier-arter (Salix spp.), før hevden tok til. Semi-naturlig våteng som ikke tilføres kildevann betinges i de fleste tilfeller av tilførsel av innsjøvann (VT∙a), men kan også være betinget av jordvannstilførsel (VT∙0) eller elvevannstilførsel (VT∙b). Feltsjiktet varierer fra relativt artsfattig til artsrikt, er relativt tett, lavvokst til middels høyt og dominert av urter og grasvekster. Bunnsjikt mangler eller er svært sparsomt utviklet, til forskjell fra semi-naturlig myr. Semi-naturlige våtenger har vært i bruk som slåttemark og som beitemark, men i likhet med V9 Semi-naturlig myr opphørte bruken som slåttemark før 1950. De gode fuktighetsforholdene gjør at gjengroingen går rask og semi-naturlige slåtte-våtenger er derfor, i den grad de fortsatt kan identifiseres på grunnlag av observerbare egenskaper, nær ettersuksesjonsstadiet av skogsmark. V10 Semi-naturlig våteng i bruk finnes derfor nå først og fremst i form av beitemark. Høyt beitetrykk kan gi marka i beitevåtenger et sterkt preg av tråkk, slik at disse i våte perioder blir svært ‘gjørmete’ og ‘tuete’.'''
)