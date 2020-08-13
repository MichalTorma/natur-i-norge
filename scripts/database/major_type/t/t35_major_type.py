# %%
from model.model import MajorType, MajorTypeInfo

# %% T35
t35_major_type = MajorType(
    _id='T35',
    majorTypeGroup_id='T',
)
t35_major_type_en = MajorTypeInfo(
    language_id='en',
    majorType=t35_major_type,
    name='Wasteland, extracted or deposited surficial deposit',
    description='Wasteland, extracted or deposited surficial deposit includes ground that is strongly altered by human actions, dominated by relatively fine-grained material such as soil, gravel, sand, silt and clay. The fine substrate facilitates rapid succession, starting with pioneer vegetation dominated by ruderal species. This major type includes, e.g. sand pits and gravel pits, timber storage sites, deposits of gravel and unsorted fine materials.',
)
t35_major_type_nb = MajorTypeInfo(
    language_id='nb',
    majorType=t35_major_type,
    name='Sterkt endret fastmark med løsmassedekke',
    description='''Sterkt endret fastmark med løsmassedekke omfatter all fastmark som gjennom omfattende inngrep har fått et nytt løsmassedekke som legger til rette for rask suksesjon. Omfattende inngrep er definert som ‘inngrep som medfører umiddelbar og omfattende biomassereduksjon og som vanligvis blottlegger mark/bunn for primær suksesjon’. Typiske eksempler på sterkt endret fastmark med løsmassedekke er masseuttaksområder (sandtak og grustak) og massedeponier (sand- og grustipper) med topplag av overveiende uorganisk, ikke veldig grovt, materiale som koloniseres så raskt at en ettersuksesjonstilstand kan forventes nådd i løpet av (100–)150 år. Også deponier av jordmasser som ikke er tilrettelagt for hevd (planert og tilsådd) hører til denne hovedtypen.'''
)