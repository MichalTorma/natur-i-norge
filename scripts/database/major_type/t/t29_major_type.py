# %%
from model.model import MajorType, MajorTypeInfo

# %% T29
t29_major_type = MajorType(
    _id=29,
    majorTypeGroup_id='T',
)
t29_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t29_major_type,
    name='Coastal shingle beach',
    description='Coastal shingle beach comprises naturally open (treeless) land along the coast, dominated by gravel, stones, boulders or shell deposits. This major type occurs in the geolittoral and supralittoral tidal belts but also includes open historical shorelines further inland that have not yet reached a successional end-point. The vegetation varies from barren mineral material via scattered plants to shrub-dominated patches in late-successional stages.',
)
t29_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t29_major_type,
    name='Grus- og steindominert strand og strandlinje',
    description='''Grus- og steindominert strand og strandlinje omfatter åpne områder, fortrinnsvis nær kysten, med mark dominert av grus, stein eller skjellsand. Hovedtypen inkluderer de vegetasjonsfrie grus- og steinstrendene (inkludert ‘rullesteinstrender’) i supralitoralbeltet og områdene på tilsvarende substrat innenfor stranda, så lenge disse ikke har nådd ettersuksesjonsstadiet etter langvarig suksesjon mot skogsmark eller hei. Hovedtypen grus- og steindominert strand og strandlinje kan ha stor vertikal og/eller horisontal utstrekning innenfor dagens strandlinje, og inkludere fossile strandlinjer flere kilometer innenfor kysten som ennå ikke har fullført den primære suksesjonen. Suksesjonen i grus- og steindominert strand og strandlinje drives primært av landhevingen, men graden av vegetasjonsetablering og vegetasjonsutvikling på et gitt sted avhenger ikke bare av tiden siden stedet steg av havet, men i minst like stor grad av vindeksponeringen og den dominerende kornstørrelsen i marka.'''
)