# %%
from model import LEC
from model import LECInfo
from language_data import en_language, nb_language

# %% S3F
s3f_lec = LEC(
    _id='S3F',
    parentLec_id='S3',
    structuringProcess_id='S',
    patternOfVariation_id='mf',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=2,
    spatialScale=6,
)
s3f_lec_info_en = LECInfo(
    language=en_language,
    lec=s3f_lec,
    name='Fine-matter content',
    description='The fraction of substrate made up by silt and clay',
)
s3f_lec_info_nb = LECInfo(
    language=nb_language,
    lec=s3f_lec,
    name='Finmaterialinnhold',
    description='''Finmaterialinnhold (S3F) er viktig for å beskrive variasjon i artssammensetningen fordi det på hvert trinn langs eroderbarhetsgradienten finnes finere og grovere sedimenter. Forskjellen mellom disse er avgjørende for sedimentenes innhold av gravende fauna (infauna) og påvekstorganismer (epifauna). Fra artssammensetningssynspunkt er ’mellomklasser’ med hensyn til finmaterialinnhold, som f.eks. finmaterialrik steinbunn, viktige fordi finmaterialet skaper levevilkår for arter som er knyttet til finere sedimenter (sedimenter med lavere erosjonsmotstand). Årsaken til at slike blandete sedimenter forekommer, er at partikler som stikker opp fra bunnen får redusert erosjonsmotstand, mens partikler som gjemmer seg mellom større partikler får økt erosjonsmotstand i forhold til et homogent sediment (Shvidchenko et al. 2001). Med finmateriale menes i denne sammenhengen organisk og uorganisk materiale med kornstørrelse < 1/16 mm (silt og leire). Finamterialinnhold angis som vektprosentandel i sedimentet.
	Finmaterialinnholdet på sublitoral sedimentbunn er resultatet av en dynamisk balanse mellom erosjon av det opprinnelige sedimentet og tilførsler av finmateriale. Sedimentene inneholder det materialet som under de rådende forholdene, fram til i dag, ikke har blitt vasket vekk. Finmaterialinnhold er derfor valgt som betegnelse for den andre dimensjonen innenfor S3 uten at man går inn på hvilke prosesser som er involvert i å bestemme sedimentenes finmaterialinnhold (mange ulike prosesser, historiske og aktive, er sikkert involvert).
''',
)