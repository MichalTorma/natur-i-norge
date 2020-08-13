# %%
from model.model import MajorType, MajorTypeInfo

# %% V9
v9_major_type = MajorType(
    _id=9,
    majorTypeGroup_id='V',
)
v9_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v9_major_type,
    name='Semi-natural fen',
    description='Semi-natural fen comprises open (treeless) peat-forming mires that are characterised by livestock grazing and/or haymaking, sometimes also clearance of shrubs and trees. The species composition resembles that of fens with similar lime richness and depth to the water-table. Hay-making fens tend to be more productive than comparable unmanaged fens, with higher cover of graminoids and herbs. Grazing fens tend to contain a distinct element of nitrophilous species. Traditional use of semi-natural fens for hay-making (cutting by scythe) required removal of tussocks, either by controlled flooding or physical destruction. Accordingly, extensive, almost plane lawns are a distinctive feature of intact hay-making fens. Use of fens for fodder collection decreased in the first half of the 20th century and ceased almost entirely after World War II. Few decades after abandonment, a hay-making fen will have lost its semi-natural character. The successional end-point (V1 or V2) has been reached when an uneven surface has been re-established and shrub and tree encroachment has taken place.',
)
v9_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v9_major_type,
    name='Semi-naturlig myr',
    description='''Semi-naturlig myr omfatter torvdannende, åpen myr (karakterisert ved myrtorv, IO∙b¤) med klart preg av ekstensiv hevd (HI∙b–e), enten beiting eller slått (‘beitemyr’ og ‘slåttemyr’). Det som først og fremst kjennetegner artssammensetningen i V9 Semi-naturlig myr er økt grasdominans, ofte på bekostning av bunnsjiktsutviklingen. Slått fremmer gras og urter, mens beiting fremmer gras og arter som begunstiges av moderat tråkkforstyrrelse og svak nitrogengjødsling. En forutsetning for å kunne utnytte en myr som slåttemyr var at trær og busker ble ryddet og at myroverflata ble jevnet ut så myra kunne slås med ljå. Slåttemyrer i bruk er derfor åpne, har minimal variasjon langs LKM tørrleggingsvarighet (TV), og er dominert av fastmatter. I Norge opphørte myrslått de aller fleste steder i første halvdel av det 20. århundre, og myrslått drives nå bare som ‘museal hevd’. Når slåtten opphører gror slåttemyrene oftest igjen med kratt og trær, og overflata blir igjen mer ujevn som følge av tuedannende gras- og halvgrasarters dominans [f.eks. blåtopp (Molinia caerulea) og taglstarr (Carex appropinquata)]. Beitedyras tråkking medfører fysisk destruksjon av tuer og av strukturen i matter; men tråkk skaper også ny mikrotopografisk variasjon. Beitemyr inneholder derfor betydelig mer mikrotopografisk variasjon enn slåttemyr i bruk. Flekker med naken torv er vanlig i beitemyr. Etter opphør av bruk gror beotemyr raskere igjen enn slåttemyr fordi tråkksporene fasiliterer etablering av mange arter, busker inkludert (A. Moen, pers. medd.).'''
)