# %%
from model.model import MajorType, MajorTypeInfo

# %% V12
v12_major_type = MajorType(
    _id='V12',
    majorTypeGroup_id='V',
)
v12_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v12_major_type,
    name='Drained mire',
    description='Drained mire comprises fens and bogs drained (ditched) for agricultural or forestry purposes, but that have not (yet) been fully terrestrialised and therefore still belongs to the wetland major-type group.',
)
v12_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v12_major_type,
    name='Grøftet torvmark',
    description='''Grøftet torvmark (SX∙n) omfatter irreversibelt drenerte våtmarkssystemer på torvmark (først og fremst åpne myrer, men også kilder), der dreneringen har ført til vesentlig endring i artssammensetning og større likhet med en annen våtmarks-hovedtype enn den som fantes på stedet før inngrepet ble gjort. Dersom grøfting følges opp med grøfterensk og liknende vedlikeholdstiltak, går en grøftet torvmark inn i en irreversibel torvnedbrytningsfase. Etter lengre tid kan systemet gå inn i en tilstand der marka ikke lenger oversvømmes eller har et grunnvannsspeil tilstrekkelig nær markoverflaten til å betinge forekomst av organismer som er tilpasset liv under vannmettete forhold, det vil si en tilstand der det ikke lengre tilfredsstiller definisjonen av våtmark. Slike områder vil likevel i lang tid beholde et umiskjennelig preg av tidligere torvmark, både ved forekomsten av dyp, omdannet torvjord, grøfter og, til dels, ved at en del av våtmarkenes artssammensetning fortsatt overlever som restpopulasjoner.
Av disse grunnene, men også av hensyn til arealstatistikk, blir irreversibelt modifisert våtmark oppfattet som egen natursystem-hovedtype i NiN, innenfor våtmarkssystemer, inntil endringene har gått så langt at en ettersuksesjonstilstand av et funksjonelt fastmarkssystem eventuelt er utviklet.'''
)