# %%
from model.model import MajorType, MajorTypeInfo

# %% T13
t13_major_type = MajorType(
    _id='T13',
    majorTypeGroup_id='T',
)
t13_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t13_major_type,
    name='Bare talus slope',
    description='Bare talus slope comprises sparsely vegetated or barren ground dominated by rock fragments and/or finer material resulting from physical and chemical weathering and erosion of rock faces above. During downward transport, the material is sorted with the largest fragments at the base of the talus slope and finer material near the top. The inclination of talus slopes increases from ca. 25° near the base when dominated by large boulders to ca. 37° in middle parts and more than 40° at the top. Grain size and lime richness are important LECs in this major type.',
)
t13_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t13_major_type,
    name='Rasmark',
    description='''Hovedtypen rasmark omfatter ikke jorddekte deler av talusskråninger, oppstått som resultat av massebevegelse i skråninger. Talusskråninger består av materiale som har samlet seg opp gjennom årtuseners tilførsel av forvitringsmateriale fra ovenforliggende berg gjennom fjellskred, steinskred, steinsprang og jordskred, samt flomskred og snøskred (flomvann eller snø som fører med seg mineralmateriale). Forvitringsmaterialet består for det meste av blokker og steiner (ur), men kan stedvis også domineres av finere materiale, oftest grus eller sand (grus- eller sanddominert rasmark). Massebevegelse i skråninger en geomorfologisk prosess som strengt følger fysiske lover [se NiN[1] Artikkel 11 og Sulebak (2007)]. Materialet fordeles vertikalt på grunn av styrtgradering, det vil si sortering slik at materialet med størst bevegelsesenergi, det vil si de største blokkene, transporteres lengst ned og samler seg i bunnen av talus. Den dominerende kornstørrelsen øker derfor fra øverst til nederst i talusskråningen. Friksjon mellom mineralpartiklene og underlaget gjør at øvre deler av talus typisk har en helning mellom 35 og 40 °. Helningen avtar mot de nederste delene av talus, og kan komme ned i 20–25 °, som følge av styrtgraderingen. Forekomster av renner med dominans av finere materiale er vanlig. I øvre deler av talus, på steder med god tilførsel av finmateriale som er skjermet mot sterk forstyrrelse, kan det utvikle seg en rasmark-hei eller rasmark-eng (hovedtype T16 Rasmarkhei og -eng).'''
)