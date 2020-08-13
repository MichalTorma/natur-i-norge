# %%
from model.model import MajorType, MajorTypeInfo

# %% V4
v4_major_type = MajorType(
    _id='V4',
    majorTypeGroup_id='V',
)
v4_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v4_major_type,
    name='Spring',
    description='Spring comprises wetlands characterized by strong spring-water influence (constancy throughout the year of flow and chemical composition of water with high concentration of dissolved O2 and temperature near the annual mean temperature of the area). In addition to the strength of spring-water influence, springs show variation related to lime richness. Springs can be divided into two categories; peaty springs and shallow springs without peat formation.',
)
v4_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v4_major_type,
    name='Kaldkilde',
    description='''Sterk kaldkilde omfatter våtmarkssystemer med klar kildevannspåvirkning (svake, ustabile og stabile kilder), med arter som har tyngdepunkt i kilder [’(egentlige) kildearter’] som et framtredende innslag. Kaldkilder kjennetegnes ved mer eller mindre stabilt framspring av kaldt grunnvann med egenskaper som ofte omtales som ‘kildevannsegenskaper’ eller ‘kildekarakter’, men som fortsatt ikke er godt klarlagt. De mest typiske kaldkildene er de stabile (eustatiske kildene; KI∙2), med stabil utstrømming av vann med gjennomsnittstemperatur nær årsmiddeltemperaturen for øvre jordlag i området. Sterk kaldkilde omfatter variasjonen fra grunnkilder uten torvdannelse (KT∙1) til djuptorvkilder (KT∙2), men forskjellen mellom grunn- og djupkilder kunne like gjerne vært beskrevet som kontrasten mellom IO∙b¤ [høyt nok innhold av organisk materiale (IO) til å tilfredsstille definisjonen av torvmark, i kontrast til IO∙0a]. Grunnkilder forekommer oftest som oppkommer omgitt av fastmark, mens djupkilder oftest forekommer i våtmarksmassiv, gjerne i overkanten av bakkemyrer mot fastmark. Framspring av kildevann kan være vanntilførselen som initierer myrdannelse. Kaldkilder forekommer først og fremst i skrånende terreng, gjerne like under vendepunktet i lisidene (der terrenget begynner å flate ut under lisidas bratteste parti), og er vanligst i deler av landet med stort relativt relieff opp mot og i fjellet.'''
)