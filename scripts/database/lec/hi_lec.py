# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo
from language_data import en_language, nb_language

# %% HI
hi_lec = LEC(
    _id='HI',
    structuringProcess_id='D',
    patternOfVariation_id='g',
    knowledgeBaseRelations=4,
    knowledgeBaseDivision=5,
    spatialScale=6,
)
hi_lec_info_en = LECInfo(
    language_id='en',
    lec=hi_lec,
    name='Land management intensity',
    description='Variation in the intensity of agricultural land management activities, including related anthropogeneous impacts not intended to increase production; running from natural sites with no traces of management, via extensively managed (e.g.,  by grazing, haymaking or prescribed burning), semi-natural sites to intensively managed sites (managed by ploughing, fertilisation, treatment with herbicides and sowing of crops)',
)
hi_lec_info_nb = LECInfo(
    language_id='nb',
    lec=hi_lec,
    name='Hevdintensitet',
    description='''Hevd, i motsetning til annen menneskebetinget forstyrrelse, defineres som ’regelmessig menneskebetinget aktivitet som opprettholder spesifikke naturtyper gjennom forstyrrelse, eventuelt i kombinasjon med tiltak for å fremme landbruksproduksjon; aktiviteter og påvirkninger som inkluderes i hevdbegrepet er slått, beiting og husdyrtråkk, brenning, jordbearbeiding, rydding, sprøyting, gjødsling, høsting av tresjiktet, såing og vanning; bestemte hevdbetingete naturtyper forutsetter bestemte hevdregimer’. Sammenhenger mellom ulike hevdrelaterte påvirkninger og hevdintensiteten er sammenstilt i NiN[2] Artikkel 1; Tabell B3–2 og Fig. B3–3. Hevd impliserer forstyrrelse i henhold til definisjonen av dette begrepet fordi hevden medfører fjerning av biomasse. Hevd-intensitet defineres som ’hevdens omfang, vurdert på grunnlag av grad [severity] og frekvens [recurrence]’. Definisjonen av hevd omfatter også andre menneskebetingete aktiviteter enn de som har som formål å fremme produksjon, f.eks. er slått og sprøyting av vegkanter, plenslått etc., etter definisjonen hevd. Fordi systemer tilrettelagt for jordbruksproduksjon, det vil si ’produksjon av mat, dyrefor, pryd- og nytteplanter og enkelte råvarer og tjenester for energi-, industri- eller andre formål’, skiller seg vesentlig fra andre hevdpregete systemer, blant annet med hensyn til artssammensetningen, skilles i NiN 2 mellom jordbruksmark (’mark preget av hevd med sikte på jordbruksproduksjon’) og annen hevdpreget mark. 
	Begrepene semi-naturlig hevdpreget mark og sterkt endret hevdpreget mark brukes til å karakterisere to hoveddeler av hevdintensitetsgradienten. Innenfor hver av disse kategoriene skilles mellom semi-naturlig jord-bruksmark, definert som ’jordbruksmark preget av hevd med en intensitet som resulterer i, eller opprettholder, et system som tilfredsstiller definisjonen av semi-naturlig mark’, og oppdyrka mark (= jordbruksmark preget av intensiv hevd), definert som ‘jordbruksmark som preges av hevd med en intensitet som resulterer i, eller opprettholder, et system som tilfredsstiller definisjonen av sterkt endret mark’, på hevdpreget mark med jordbruksproduksjon som hovedformål, og fra hevdpreget mark uten jordbruksproduksjon som hovedformål. 
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='HI.0',
    lec=hi_lec,
    value='0',
    order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='without management'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='natural soil without grazing'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='uten hevdpreg'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='naturlig mark uten hevdpreg'
)
# a
a_elem_segment=ElementarySegment(
    _id='HI.a',
    lec=hi_lec,
    value='a',
    order=1
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<class>',
    value='clearly managed'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='en',
    key='<description>',
    value='natural land with clear traces of grazing, but which is not normally cleared¸ grazing forest in forest land'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<class>',
    value='tydelig beitepreget'
)
ElementarySegmentInfo(
    elementarySegment=a_elem_segment,
    language_id='nb',
    key='<description>',
    value='naturlig mark med tydelig spor etter beiting, men som normalt ikke ryddes¸ beiteskog i skogsmark'
)
# b
b_elem_segment=ElementarySegment(
    _id='HI.b',
    lec=hi_lec,
    value='b',
    order=2
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<class>',
    value='very extensive management'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='en',
    key='<description>',
    value='semi-natural land which is cleared relatively regularly, at least in part, and which bears the mark of long-term grazing, mowing and / or burning, but with moderate intensity'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<class>',
    value='svært ekstensivt hevdpreg'
)
ElementarySegmentInfo(
    elementarySegment=b_elem_segment,
    language_id='nb',
    key='<description>',
    value='semi-naturlig mark som relativt regelmessig ryddes, i hvert fall delvis, og som bærer preg av lang tids beiting, slått og/eller brenning, men med moderat intensitet'
)
# cd
cd_elem_segment=ElementarySegment(
    _id='HI.cd',
    lec=hi_lec,
    value='cd',
    order=3
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='<class>',
    value='typically extensive management'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='<description>',
    value='semi-natural soil without traces of fertilization, which bears the mark of long-term grazing, mowing and / or burning [c = slightly typical extensive claim; d = strongly typical extensive character]'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='<class>',
    value='typisk ekstensivt hevdpreg'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='<description>',
    value='semi-naturlig mark uten spor etter gjødsling, som bærer preg av lang tids beiting, slått og/eller brenning [c = svakt typisk ekstensivt hevdpreg; d = sterkt typisk ekstensivt hevdpreg]'
)
# e
e_elem_segment=ElementarySegment(
    _id='HI.e',
    lec=hi_lec,
    value='e',
    order=4
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<class>',
    value='extensive character with a weak touch of fertilization'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='en',
    key='<description>',
    value='semi-natural soil with traces of fertilization, but which nevertheless has a strong element of species with little or moderate tolerance to fertilization'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<class>',
    value='ekstensivt hevdpreg med svakt preg av gjødsling'
)
ElementarySegmentInfo(
    elementarySegment=e_elem_segment,
    language_id='nb',
    key='<description>',
    value='semi-naturlig mark med spor etter gjødsling, men som likevel har et sterkt innslag av arter med liten eller moderat toleranse overfor gjødsling'
)
# fg
fg_elem_segment=ElementarySegment(
    _id='HI.fg',
    lec=hi_lec,
    value='fg',
    order=5
)
ElementarySegmentInfo(
    elementarySegment=fg_elem_segment,
    language_id='en',
    key='<class>',
    value='slightly intense management'
)
ElementarySegmentInfo(
    elementarySegment=fg_elem_segment,
    language_id='en',
    key='<description>',
    value='heavily altered land which is often fertilized regularly, which may have sown agricultural crops, which may be sprayed and which may have traces of plowing'
)
ElementarySegmentInfo(
    elementarySegment=fg_elem_segment,
    language_id='nb',
    key='<class>',
    value='litt intensivt hevdpreg'
)
ElementarySegmentInfo(
    elementarySegment=fg_elem_segment,
    language_id='nb',
    key='<description>',
    value='sterkt endret mark som gjerne blir gjødslet regelmessig, som kan ha innsådde jordbruksvekster, som kan bli sprøytet og som kan ha spor etter pløying'
)
# hi
hi_elem_segment=ElementarySegment(
    _id='HI.hi',
    lec=hi_lec,
    value='hi',
    order=6
)
ElementarySegmentInfo(
    elementarySegment=hi_elem_segment,
    language_id='en',
    key='<class>',
    value='rather intense management'
)
ElementarySegmentInfo(
    elementarySegment=hi_elem_segment,
    language_id='en',
    key='<description>',
    value='heavily altered land that has been cleared, plowed and adapted for mechanical harvesting'
)
ElementarySegmentInfo(
    elementarySegment=hi_elem_segment,
    language_id='nb',
    key='<class>',
    value='temmelig intensivt hevdpreg'
)
ElementarySegmentInfo(
    elementarySegment=hi_elem_segment,
    language_id='nb',
    key='<description>',
    value='sterkt endret mark som er ryddet, pløyd og tilrettelagt for maskinell høsting'
)
# j
j_elem_segment=ElementarySegment(
    _id='HI.j',
    lec=hi_lec,
    value='j',
    order=6
)
ElementarySegmentInfo(
    elementarySegment=j_elem_segment,
    language_id='en',
    key='<class>',
    value='very intense management'
)
ElementarySegmentInfo(
    elementarySegment=j_elem_segment,
    language_id='en',
    key='<description>',
    value='heavily altered, fully cultivated land'
)
ElementarySegmentInfo(
    elementarySegment=j_elem_segment,
    language_id='nb',
    key='<class>',
    value='svært intensivt hevdpreg'
)
ElementarySegmentInfo(
    elementarySegment=j_elem_segment,
    language_id='nb',
    key='<description>',
    value='sterkt endret, fulldyrket mark'
)
