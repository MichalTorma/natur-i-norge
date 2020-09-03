# %%
from model.model import LEC
from model.model import LECInfo, ElementarySegment, ElementarySegmentInfo

# %% MF
mf_lec = LEC(
    _id='MF',
    structuringProcess_id='S',
    patternOfVariation_id='g',
    knowledgeBaseRelations=2,
    knowledgeBaseDivision=3,
    spatialScale=5,
)
mf_lec_info_en = LECInfo(
    language_id='en',
    lec=mf_lec,
    name='Mire expanse character',
    description='Gradient in the species composition of mires, from sites close to adjacent non-wetland ground or with shallow peat typically dominated by generalist and forest species, to sites with deep peet in the interior parts of wetland massifs typically dominated by mire specialist species; the environmental basis of LEC MF is insufficiently understood, variables such as annual range of ground water fluctuations, drainage, peat aeration, nutrient turnover and light have been mentioned as potentially important',
)
mf_lec_info_nb = LECInfo(
    language_id='nb',
    lec=mf_lec,
    name='Myrflatepreg',
    description='''Det er lang tradisjon i Fennoskandia for å betrakte gradienten fra myrflate til myrkant som en av tre (fire) hovedgradienter i myrvegetasjonen. Dette er imidlertid først og fremst en lett gjenkjennbar artssammensetningsgradient som fortsatt står uten sikker økologisk forklaring. Den omfatter variasjonen fra områder på myr som ligger langt fra fastmark, med djup torv, der ei gruppe av typiske ‘myrflatearter’ forekommer rikelig, til fastmarksnære områder eller myr med tynnere torv, der myrkantarter dominerer. Artssammensetningsgradienten fortsetter via skogsmark på torv til fastmark. Myrflateartene er eksklusive myrplanter; de typiske mykmatteartene tilhører denne gruppa. Mange av myrkantartene, for eksempel treslagene og vier (Salix spp.), forekommer også på fastmarksskogsmark og/eller i engpregete økosystemer. Mulige økologiske forklaringer på variasjonen fra myrflate til myrkant er reduksjon i torvdybde, bedre drenering og bedre gjennomlufting av torva nær myrkanten på grunn av større årlige grunnvannsstandsvekslinger med et lavere minimumsnivå, større næringsomsetning og mineralnæringstilførsel, og økende skygge- og strøvirkning fra et tresjikt som ofte finnes.
	Ifølge tradisjonen etter Sjörs (1948, 1950) har nedbørsmyr (ombrogen myr) i sin helhet myrflatevegetasjon, selv om trebevokst nedbørsmyr har en god del skogsarter felles med fastmark. Malmer (1962: 74) påpeker imidlertid at arter som var begrenset til ’wooded bog areas’ (tresatt ombrogen myr), også hovedsakelig var begrenset til (minerogen) myrkant. Malmer påviser også at variasjonen fra åpen til tresatt ombrogen myr hadde sterke fellestrekk med (’similar to’) variasjonen fra myrflate til myrkant på minerogene myrdeler, om enn forskjellene i artssammensetning ikke var like sterke. Malmer (1962: 139) konkluderte derfor at det var naturlig å betrakte ’den ombrogene myrskogsmarka’ som myrkant. R. Økland (1989a, 1990b) trakk samme konklusjon i sine undersøkelser av myra Nordre Kisselbergmosen (Rødenes, Marker, Østfold). Denne oppfatningen blir derfor fulgt her. 
	Myrflatetrinnet er begrenset til åpen myr, mens myrkant kan være åpen mark eller skogsmark. Fremstad (1997) skiller myrflate fra myrkant og myrkant fra ‘sumpskog’ langs en (forlenget) gradient fra myrflate til myrkant, mens R. Økland et al. (2001b) mener at myrkant og ‘sumpskog’ verken kan skilles entydig på grunnlag av miljøegenskaper eller på grunnlag av artssammensetningen. Analysene av generalisert artslistedatasett B12 viser imidlertid at artssammensetningen i typiske utforminger av myr- og sumpskogsmark utgjør en forlengelse av artssammensetningsgradienten fra åpen myrflate til typisk åpen myrkant (NiN[2] Artikkel 2, kapittel B12). Sjøl om mosaikker mellom åpne, gjerne fuktigere partier og tresatte partier ofte forekommer i ‘sumpskoger’ og det ikke synes å være en entydig kobling mellom artssammensetningen i felt- og bunnsjikt på den ene siden og forekomsten at et tresjikt på den andre, er myr- og sumpskogsmark inkludert som trinn langs myrflatepreg (MF) i NiN 2.
	Det er ikke mulig å karakterisere myrflate og myrkant på annen måte enn ved hjelp av arters forekomst; en stor del av artene som forekommer i myr har preferanser for trinn langs denne økoklinen (se Moen 1990, Fremstad 1997). Typiske myrflatearter er mykmatteartene samt arter som dvergtettegras (Pinguicula villosa), brunskjene (Schoenus ferrugineus) og moseartene navargulmose (Pseudocalliergon trifarium), svelttorvmose (Sphagnum balticum) og lapptorvmose (S. subfulvum). Typiske myrkantarter er skogsmarksarter som for eksempel oreartene (Alnus spp.), bjørk, gran, de fleste vierarter (Salix spp.) og mjødurt (Filipendula ulmaria).
En grundig drøfting av økologiske årsaker til variasjon langs myrflatepreg (MF) [under betegnelsen ‘myrflate-myrkant’ (MM)] finnes hos R. Økland (1989a), som ikke fant grunnlag i litteraturen (eller egne data) for at det finnes viktige torvkjemiske forskjeller mellom myrflate og myrkant. Han mente i stedet at bedre gjennomlufting av torva i myrkanten kan være utslagsgivende for karplanter (inkludert trær), mens lys- og strøforhold kan være utslagsgivende for moser og lav. Moen (1990) sine studier på Sølendet (Brekken, Røros, STr) gir støtte til denne forklaringen. Han viser at myrkantsamfunn finnes på steder med mye lavere grunnvannsspeil (bedre gjennomlufting av torva) i tørre perioder (og større veksling i grunnvannsnivået gjennom vekstsesongen) enn myrflatesamfunnene. Dersom grundige økologiske undersøkelser bekrefter denne hypotesen, er det grunner for å betrakte flytematter som et ekstremtrinn langs gradienten. I sin beskrivelse av torvmoseartenes autøkologi, inkluderer Flatberg (2013) flytematter som egen kategori. Fordi det kan vise seg nødvendig å inkludere flytematter som eget trinn, er det hensiktsmessig å reversere retningen på gradienten i forhold til arbeidsdokumenter fram mot NiN 2 og tidligere versjoner av NiN[2] Artikkel 2 fra ‘myrkantpreg’ til myrflatepreg (MF) der flytematter kan hektes på som et siste trinn (eventuelt som en tolkning av MF∙f).
	Anerkjennelse av myrflatepreg (MF) som en viktig gradient i myrvegetasjonen har sterk rot i Fennoskandisk (og særlig skandinavisk) myrvitenskap, mens Wheeler & Proctor (2000) i sin oversikt over gradienter i nordvesteuropeiske våtmarker ikke anerkjenner dette som en viktig gradient. Argumenter for det skandinaviske synet er oppsummert og drøftet i større bredde av R. Økland et al. (2001b)
''',
)

# nul
nul_elem_segment=ElementarySegment(
    _id='MF.0',
    lec=mf_lec,
    value='0',
    order=0,
    relative_order=0
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<class>',
    value='solid ground'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='en',
    key='<description>',
    value='areas which by definition belong to mainland systems'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<class>',
    value='fastmark'
)
ElementarySegmentInfo(
    elementarySegment=nul_elem_segment,
    language_id='nb',
    key='<description>',
    value='områder som etter definisjonen tilhører fastmarkssystemer'
)
# ab
ab_elem_segment=ElementarySegment(
    _id='MF.ab',
    lec=mf_lec,
    value='ab',
    relative_order=1
)
ElementarySegment(
    _id='MF.a',
    lec=mf_lec,
    value='a',
    order=1,
    relative_order=0,
    parent=ab_elem_segment
)
ElementarySegment(
    _id='MF.b',
    lec=mf_lec,
    value='b',
    order=2,
    relative_order=1,
    parent=ab_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='en',
    key='<class>',
    value='bog and swamp forest land'
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='en',
    key='<description>',
    value='woodland on peatland'
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='nb',
    key='<class>',
    value='myr- og sumpskogsmark'
)
ElementarySegmentInfo(
    elementarySegment=ab_elem_segment,
    language_id='nb',
    key='<description>',
    value='skogsmark på torvmark'
)
# cd
cd_elem_segment=ElementarySegment(
    _id='MF.cd',
    lec=mf_lec,
    value='cd',
    relative_order=2
)
ElementarySegment(
    _id='MF.c',
    lec=mf_lec,
    value='c',
    order=3,
    relative_order=0,
    parent=cd_elem_segment
)
ElementarySegment(
    _id='MF.d',
    lec=mf_lec,
    value='d',
    order=4,
    relative_order=1,
    parent=cd_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='<class>',
    value='open mire edge'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='en',
    key='<description>',
    value='open peatland (bog) with dominance of species that are also found on solid ground or that are often associated with parts of the bog close to the mainland (so-called ‘mire edge species’)'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='<class>',
    value='åpen myrkant'
)
ElementarySegmentInfo(
    elementarySegment=cd_elem_segment,
    language_id='nb',
    key='<description>',
    value='åpen torvmark (myr) med dominans av arter som også finnes på fastmark eller som ofte er knyttet til fastmarksnære deler av myra (såkalte ‘myrkantarter’)'
)
# ef
ef_elem_segment=ElementarySegment(
    _id='MF.ef',
    lec=mf_lec,
    value='ef',
    relative_order=3
)
ElementarySegment(
    _id='MF.e',
    lec=mf_lec,
    value='e',
    order=5,
    relative_order=0,
    parent=ef_elem_segment
)
ElementarySegment(
    _id='MF.f',
    lec=mf_lec,
    value='f',
    order=6,
    relative_order=1,
    parent=ef_elem_segment
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='<class>',
    value='open mire expanse'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='en',
    key='<description>',
    value='open peatland (bog) with dominance of species that are not found on solid ground and that shepherd near the mainland cover of the bog (so-called ‘bog expanse species’)'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='<class>',
    value='åpen myrflate'
)
ElementarySegmentInfo(
    elementarySegment=ef_elem_segment,
    language_id='nb',
    key='<description>',
    value='åpen torvmark (myr) med dominans av arter som ikke finnes på fastmark og som skyr fastmarksnære deker av myra (såkalte ‘myrflatearter’)'
)
