# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% SS
ss_lec = LEC(
    _id='SS',
    structuringProcess_id='D',
    patternOfVariation_id='gs',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=2,
    spatialScale=3,
)
ss_lec_info_en = LECInfo(
    language_id='en',
    lec=ss_lec,
    name='Sand stabilisation',
    description='Variation in sand-dune stability, brought about by the tendency of sand to become more stable at increasing distances from the sand source (typically the coastline); LEC SS runs from naked sand-dominated littoral seabeds via active sand-dune systems to forests on stabilised sand and thus is a primary successional gradient starting with vascular plants colonising naked sand (this contrasts primary successions on rock substrates, which start with colonisation by mosses and lichens and continues with slow soil accumulation)',
)
ss_lec_info_nb = LECInfo(
    language_id='nb',
    lec=ss_lec,
    name='Sandstabilisering',
    description='''Strender som tilføres store mengder sand fra havsida, som transporteres videre innover land av sterke vinder, vil normalt utvikle seg til sanddynemark. Sandstabilisering (SS) er en kompleks miljøvariabel som gir uttrykk for den økende stabiliseringen av sanddynene med økende avstand fra strandlinja, som er resultatet av primær suksesjon (vegetasjonsetablering). Med økende avstand fra stranda øker tiden siden suksesjonen startet, samtidig som en rekke viktige miljøegenskaper endrer seg: sandtilførselen avtar, vindforstyrrelsen avtar, sanda stabiliseres og en gradvis jordsmonnutvikling finner sted som innebærer akkumulering av humus og økende evne til å holde på jordfuktigheten, men også utvasking av næringsstoffer og forsuring. Artstettheten øker et langt stykke ut i denne primære suksesjonen før det flater ut og etter hvert synker igjen.
	Begrepet ’stabilisering’ er valgt framfor alternative begreper som for eksempel ’etablering’ fordi sandbindingen (stabiliseringen av sanda) og etter hvert også oppbyggingen av et humuslag er de fundamentale prosessene i sanddynedynamikken..
	Sandstabilisering (SS) er beskrevet som en egen kompleks miljøvariabel fordi primærsuksesjonsforløpet ved stabilisering og kolonisering av flygesand skiller seg fra alle andre primærsuksesjonsforløp i en rekke henseender, både med hensyn til økologiske og geologiske prosesser. Dominerende geomorfologiske (landformdannende) prosess er vindvirkning (aeoliske prosesser; se NiN[1] Artikkel 17). I motsetning til suksesjoner på bergsubstrat, er karplanter (først og fremst sandbindende gras) de første innvandrerne mens moser og lav først kommer inn når sanda begynner å bli stabilisert. Primær suksesjon i andre fastmarkssystemer kjennetegnes ved oppbygging av et jordsmonn og akkumulering av mineralnæringsstoffer. Jordsmonnoppbygging finner også sted gjennom et sandstabiliseringsforløp; økende grad av stabilisering innebærer økende tjukkelse på humuslaget. Men i motsetning til langs andre primærsuksesjonsgradienter er den ’friske’ sanda som tilføres i tidlige suksesjonstrinn rikest på mineralnæring. 
	Sandstabilisering (SS) kommer til uttrykk som mer eller mindre distinkte soner fra strandlinja gjennom åpen sanddynemark til bakenforliggende skogsmark. Sonasjon og suksesjon følger hverandre derfor i stor grad langs denne komplekse miljøvariabelen. Endringen i artssammensetning er stor. De tidlige suksesjonstrinnene består av enkelt- eller få-artssamfunn eller vegetasjonsfrie sandflater som i henhold til retningslinjene for trinndeling skal oppfattes som separate basistrinn (SS∙a–c). Det foreligger ikke analyser som tallfester omfanget av endringer i artssammensetning i de mer etablerte delene av gradienten (SS∙dd–j); basistrinninndelingen for disse delene er derfor tentativ. 
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='SS.0',
    lec=ss_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='sand-dominated spring belt bottom'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='non-stabilized sandy bottom in the water beach belt (hydrolitoral belt)'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='sanddominert fjærebeltebunn'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='ikke-stabilisert sandbunn i vannstrandbeltet (hydrolitoral-beltet)'
)
# a
a_elem_segment=ElementarySegment(
    _id='SS.a',
    lec=ss_lec,
    value='a',
    order=1,
    relative_order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='sandy beach'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='non-stabilized sandy soil in the land beach belt (geolitoral belt); vegetation-free or with few species communities dominated by melde species (Atriplex spp.), beach radish (Cakile maritima) or beach heritage (Honckenya peploides)'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='sandforstrand'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='ikke-stabilisert sandmark i landstrandbeltet (geolitoralbeltet); vegetasjonsfritt eller med få-artssamfunn dominert av melde-arter (Atriplex spp.), strandreddik (Cakile maritima) eller strandarve (Honckenya peploides)'
)
# b
b_elem_segment=ElementarySegment(
    _id='SS.b',
    lec=ss_lec,
    value='b',
    order=2,
    relative_order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='pre-dune'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='non-stabilized sandfield in the supralitoral belt, with strong sand movement and precursors to dune formation; vegetation-free or with few species communities dominated by shore herb (Honckenya peploides), shore rye (Leymus arenarius) or shore quail (Elytrigia juncea); = embryonaldyne'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='fordyne'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='ikke-stabilisert sandmark i supralitoralbeltet, med sterk sandbevegelse og forstadier til dynedannelse; vegetasjonsfritt eller med få-artssamfunn dominert av strandarve (Honckenya peploides), strandrug (Leymus arenarius) eller strandkveke (Elytrigia juncea); = embryonaldyne'
)
# c
c_elem_segment=ElementarySegment(
    _id='SS.c',
    lec=ss_lec,
    value='c',
    order=3,
    relative_order=3
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<class>',
    value='primary dune'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='en',
    key='<description>',
    value='non-stabilized sand field in the epilitoral belt, with strong sand movement and strong dune formation, but the dunes are unstable and move; the outermost high dunes are primary dunes; bogs and lichen are missing, the sand dries out quickly and no humus formation takes place; typically with few species communities dominated by sand-binding grasses such as mare straw (Ammophila arenaria) and beach rye (Leymus arenarius)'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<class>',
    value='primærdyne'
)
ElementarySegmentInfo(
    elementarySegment=c_elem_segment,
    language_id='nb',
    key='<description>',
    value='ikke-stabilisert sandmark i epilitoralbeltet, med sterk sandbevegelse og sterk sanddynedannelse, men dynene er ustabile og flytter seg; de ytterste høye sanddynene er primærdyner; moser og lav mangler, sanda tørker raskt ut og ingen humusdannelse finner sted; typisk med få-artssamfunn dominert av sandbindende gras som marehalm (Ammophila arenaria) og strandrug (Leymus arenarius)'
)
# d
d_elem_segment=ElementarySegment(
    _id='SS.d',
    lec=ss_lec,
    value='d',
    order=4,
    relative_order=4
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<class>',
    value='white dune'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='en',
    key='<description>',
    value='incipient stabilization of the sand, but bare, non-stabilized sand dominates; fields colonized to a greater or lesser extent by large grass species that can withstand sanding and drought; bogs and lichen are missing; unstable dune'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<class>',
    value='kvit dyne'
)
ElementarySegmentInfo(
    elementarySegment=d_elem_segment,
    language_id='nb',
    key='<description>',
    value='begynnende stabilisering av sanda, men naken, ikke-stabilisert sand dominerer; marka i større eller mindre grad kolonisert av storvokste grasarter som tåler oversanding og tørke; moser og lav mangler; = ustabil dyne'
)
# ef
ef_elem_segment=ElementarySegment(
    _id='SS.ef',
    lec=ss_lec,
    value='ef',
    relative_order=5
)
ElementarySegment(
    _id='SS.e',
    lec=ss_lec,
    value='e',
    order=5,
    relative_order=0,
    parent=ef_elem_segment
)
ElementarySegment(
    _id='SS.f',
    lec=ss_lec,
    value='f',
    order=6,
    relative_order=1,
    parent=ef_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='<class>',
    value='gray dune'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='<description>',
    value='sand more or less stabilized, dominance of low-growing grasses and herbs; spotted overgrown with mosses and lichens; stabilized dune'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='<class>',
    value='grå dyne'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='<description>',
    value='sand mer eller mindre stabilisert, dominans av lavvokste grasarter og urter; flekkvis bevokst med moser og lav; = stabilisert dyne'
)
# gh
gh_elem_segment=ElementarySegment(
    _id='SS.gh',
    lec=ss_lec,
    value='gh',
    relative_order=6
)
ElementarySegment(
    _id='SS.g',
    lec=ss_lec,
    value='g',
    order=7,
    relative_order=0,
    parent=gh_elem_segment
)
ElementarySegment(
    _id='SS.h',
    lec=ss_lec,
    value='h',
    order=8,
    relative_order=1,
    parent=gh_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=gh_elem_segment,
    language_id='en',
    key='<class>',
    value='brown dune'
)
ElementarySegmentInfo(
    elementarySegment=gh_elem_segment,
    language_id='en',
    key='<description>',
    value='stabilized sand, incipient soil formation; closed, meadow-like vegetation that may have closed bottom layer dominated by mosses and lichens; = established dune'
)
ElementarySegmentInfo(
    elementarySegment=gh_elem_segment,
    language_id='nb',
    key='<class>',
    value='brun dyne'
)
ElementarySegmentInfo(
    elementarySegment=gh_elem_segment,
    language_id='nb',
    key='<description>',
    value='stabilisert sand, begynnende jordsmonndannelse; sluttet, engpreget vegetasjon som kan ha sluttet bunnsjikt dominert av moser og lav; = etablert dyne '
)
# i
i_elem_segment=ElementarySegment(
    _id='SS.i',
    lec=ss_lec,
    value='i',
    order=9,
    relative_order=7
)
ElementarySegmentInfo(
    elementarySegment=i_elem_segment,
    language_id='en',
    key='<class>',
    value='dune moor'
)
ElementarySegmentInfo(
    elementarySegment=i_elem_segment,
    language_id='en',
    key='<description>',
    value='stabilized moor, often with well-developed humus layer, dominated by heather species such as cress (Empetrum nigrum) and heather (Calluna vulgaris).'
)
ElementarySegmentInfo(
    elementarySegment=i_elem_segment,
    language_id='nb',
    key='<class>',
    value='dynehei'
)
ElementarySegmentInfo(
    elementarySegment=i_elem_segment,
    language_id='nb',
    key='<description>',
    value='stabilisert hei, ofte med velutviklet humuslag, dominert av lyngarter som krekling (Empetrum nigrum) og røsslyng (Calluna vulgaris).'
)
# j
j_elem_segment=ElementarySegment(
    _id='SS.j',
    lec=ss_lec,
    value='j',
    order=10,
    relative_order=8
)
ElementarySegmentInfo(
    elementarySegment=j_elem_segment,
    language_id='en',
    key='<class>',
    value='dune woodland'
)
ElementarySegmentInfo(
    elementarySegment=j_elem_segment,
    language_id='en',
    key='<description>',
    value='forest land above and within open dune land, with patches of bare sand and a species composition that still contains species typical of dune land'
)
ElementarySegmentInfo(
    elementarySegment=j_elem_segment,
    language_id='nb',
    key='<class>',
    value='dyneskogsmark'
)
ElementarySegmentInfo(
    elementarySegment=j_elem_segment,
    language_id='nb',
    key='<description>',
    value='skogsmark ovenfor og innenfor åpen sanddynemark, med flekker av naken sand og en artssammensetning som fortsatt inneholder arter typisk for sanddynemarka'
)
# k
k_elem_segment=ElementarySegment(
    _id='SS.k',
    lec=ss_lec,
    value='k',
    order=11,
    relative_order=9
)
ElementarySegmentInfo(
    elementarySegment=k_elem_segment,
    language_id='en',
    key='<class>',
    value='sandy woodland'
)
ElementarySegmentInfo(
    elementarySegment=k_elem_segment,
    language_id='en',
    key='<description>',
    value='woodland on sandy soils, without or with patches of bare sand, and a species composition that is observably different from the species composition in comparable solid woodland on unsorted substrates'
)
ElementarySegmentInfo(
    elementarySegment=k_elem_segment,
    language_id='nb',
    key='<class>',
    value='sandskogsmark'
)
ElementarySegmentInfo(
    elementarySegment=k_elem_segment,
    language_id='nb',
    key='<description>',
    value='skogsmark på sandgrunn, uten eller med flekker av naken sand, og en artssammensetning som er observerbart forskjellig fra artssammensetningen i sammenliknbar fastmarksskogsmark på usorterte substrater'
)
# plus
plus_elem_segment=ElementarySegment(
    _id='SS.+',
    lec=ss_lec,
    value='+',
    order=12,
    relative_order=10
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='<class>',
    value='normal solid-ground woodland'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='en',
    key='<description>',
    value='solid woodland with such a thick and stable humus layer that sand-dominated loose material cover does not have a visible effect in the species composition'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='<class>',
    value='normal fastmarks-skogsmark'
)
ElementarySegmentInfo(
    elementarySegment=plus_elem_segment,
    language_id='nb',
    key='<description>',
    value='fastmarksskogsmark med så tjukt og stabilt humuslag at sanddominert løsmassedekke ikke gir seg synlig utslag i artssammensetningen'
)
