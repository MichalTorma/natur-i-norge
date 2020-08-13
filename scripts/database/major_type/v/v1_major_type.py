# %%
from model.model import MajorType, MajorTypeInfo

# %% V1
v1_major_type = MajorType(
    _id='V1',
    majorTypeGroup_id='V',
)
v1_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=v1_major_type,
    name='Open fen',
    description='Open fen comprises all open (treeless) mires that, in addition to rainwater, is supplied with minerogenous (geogenous) water, i.e. water that has been in contact with mineral soil. Peat-forming Sphagnum species dominate the ground layer in lime-poor or intermediately lime-rich fens while mosses other than Sphagnum (‘brown mosses’) dominate in lime-rich fens. Other important LECs are duration of period without inundation (inversely related to depth from the ground surface to the water-table), which expresses variation from carpets via lawns to hummocks, the variation from mire margin to mire expanse, and the variation in strength of springwater character of the supplied water, separating spring fens from other open fens.',
)
v1_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=v1_major_type,
    name='Åpen jordvannsmyr',
    description='''Åpen jordvannsmyr er den eneste åpne, normale hovedtypen innenfor våtmarkssystemer, og omfatter all åpen våtmark med jordvannstilførsel [vanntilførsel (VT) normalklasse VT∙0] der ingen sLKM har vesentlig effekt på artssammensetningen. Åpen jordvannsmyr tilfredsstiller myrdefinisjonen (torvmark der torvakkumulering pågår og mark med grunnere torv enn de 30 cm torvmarksdefinisjonen krever og der artssammensetningen er dominert av ’myrarter’; unntatt mark som faller inn under definisjonene av kilde eller mosetundra) og IO∙b¤ er derfor normaltrinn langs innhold av organisk materiale (IO) i våtmarkssystemer. Marka i åpen jordvannsmyr er bygd opp av ufullstendig nedbrutt plantemateriale som er produsert på stedet gjennom tusener av år, og er et svært særpreget natursystem. Også flytetorv langs innsjøer inngår i natursystem-hovedtypen åpen jordvannsmyr. Åpen jordvannsmyr kan dominere større områder eller inngå som større eller mindre deler av våtmarksmassiv, f.eks. som lagg langs kanten av høgmyrer.'''
)