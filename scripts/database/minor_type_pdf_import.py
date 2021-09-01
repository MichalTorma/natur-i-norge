# %%
from PyPDF4 import PdfFileReader
import re
import itertools

source_file = '/Users/amarok/src/natur-i-norge/scripts/data/Beskrivelser_av_kartleggingsenheter_m_lestokk_1_5000.pdf'
# %%
from sqlalchemy import create_engine
import model.model as model
from sqlalchemy.orm import sessionmaker
database_file = '/Users/amarok/src/natur-i-norge/naturinorge_guide/assets/nin_database.db'
engine = create_engine(f'sqlite:///{database_file}')
Session = sessionmaker(bind=engine)
session = Session()

# %%
def get_page(numpage):
    with open(source_file, 'rb') as f:
        pdf = PdfFileReader(f)
        page = pdf.getPage(numpage)
        page_content = page.extractText()
        return page_content

# %%
def get_list_of_types(source):
    mnt = source.split('-')[0]
    ints_str = source[(len(mnt)+1):]
    ints_str_lst = ints_str.split(',')
    # print(ints_str_lst)
    tmp = list(map(lambda x: list(range(int(x.split('-')[0]),int(x.split('-')[-1])+1)),ints_str_lst))
    int_lst = list(itertools.chain.from_iterable(tmp))
    return [f'{mnt}-{x}' for x in int_lst]

# get_list_of_types('T1-9-20,27-32,37-40,49-60,65-68,73-76,79-82,85')
# %%
def get_list_of_codes(source):
    mnt = source.split('-')[:2]
    mnt = '-'.join(mnt)
    # print(mnt)
    ints_str = source[(len(mnt)+1):]
    ints_str_lst = ints_str.split(',')
    # print(ints_str_lst)
    tmp = list(map(lambda x: list(range(int(x.split('-')[0]),int(x.split('-')[-1])+1)),ints_str_lst))
    int_lst = list(itertools.chain.from_iterable(tmp))
    return [f'{mnt}-{x}' for x in int_lst]

# get_list_of_codes('T1-B-7,12,16')

# %%
page_content = get_page(81)
print(page_content)
# page_content.splitlines()

# %%
def parse_page(page):


    mnt_id_re = re.search(r'([A-Z])([0-9])+-C\s?-([0-9])+', page)
    mnt_id = mnt_id_re.group(0).replace('\n','')
    mt_id = mnt_id.split('-')[0]

    if mt_id == 'T4':
        print('Skipping T4')
        return
    name_re = re.search(r'[0-9FHLMITV,\-\s]*[BCD]?\s?\-?[0-9]*\s*([\S\s]*)N\s?i\s?N\s?-\s?k\s?a\s?r\s?a\s?k\s?t\s?e\s?r\s?i\s?', page)
    name = name_re.group(1).replace('\n','')
    # print(name)
    nin_kar_re = re.search(r'N\s?i\s?N\s?-\s?k\s?a\s?r\s?a\s?k\s?t\s?e\s?r\s?i\s?s\s?t\s?i\s?k\s?k\n*:\n*\s*([\S\s]*?)\nFysiognomi\s?:', page)
    nin_kar = nin_kar_re.group(1)
    fysiognomi_re = re.search(r'Fysiognomi\n*:\n*\s*([\S\s]*?)\nØkologisk karakteristikk\s?:', page)
    fysiognomi = fysiognomi_re.group(1)
    ecologisk_char_reg = re.search(r'Økologisk karakteristikk\n*:\n*\s*([\S\s]*?)\nTerreng', page)
    ecologisk_char = ecologisk_char_reg.group(1)
    page = page.replace('*','')
    if mnt_id == 'T2-C-5':
        page = '''
            Målestokk
1:500
1:2.500
1:5.000
1:10.000
1:20.000
Kode
T2-5
T2-B-5
T2-C-5
T2-D-3
T2-E-3
Grunntyper
T2-5
T2-5
T2-5,6
T2-5,6
Diagnostiske arter
        '''
    if mnt_id == 'T2-C-6':
        page = '''
Målestokk
1:500
1:2.500
1:5.000
1:10.000
1:20.000
Kode
T2-6
T2-B-6
T2-C-6
T2-D-3
T2-E-3
Grunntyper
T2-6
T2-6
T2-5,6
T2-5,6
Diagnostiske arter
        '''
    if mnt_id == 'T5-C-1':
        page = '''
Målestokk
1:500
1:2.500
1:5.000
1:10.000
1:20.000
Kode
T5-1,2,4
T5-B-1,2,4
T5-C-1
T5-D-1
T5-E-1
Grunntyper
T5-1,2,4
T5-1,2,4
T5-1,2,4
T5-1,2,4,8,9
Diagnostiske arter
        '''
    if mnt_id == 'T5-C-2':
        page = '''
Målestokk
1:500
1:2.500
1:5.000
1:10.000
1:20.000
Kode
T5-3,5
T5-B-3,5
T5-C-2
T5-D-2
T5-E-2
Grunntyper
T5-3,5
T5-3,5
T5-3,5
T5-3,5,10
Diagnostiske arter
        '''

    mnt_scaled_reg = re.search(r'\sKode\s([\S\s]*?)\sGrunntyper\s([\S\s]*?)[^0-9FHLMITV\-,\s]+', page)
    mnt_scaled = None


    if (mnt_scaled_reg == None):
        print('No mnt_scaled')
    else:
        scaled_kode_str = mnt_scaled_reg.group(1)
        scaled_gruntype_str = mnt_scaled_reg.group(2)
        if mnt_id == 'T1-C-7':
            scaled_kode_str = scaled_kode_str.replace('C1', 'T1')
        if mnt_id == 'T7-C-1':
            scaled_kode_str = scaled_kode_str.replace('T7-D1-', 'T7-D-1')
        if mnt_id == 'T30-C-4':
            scaled_kode_str = scaled_kode_str.replace('T30-E1', 'T30-E-1')
        if mnt_id == 'T32-C-4':
            scaled_gruntype_str = scaled_gruntype_str.replace('T32-3,4,5,', 'T32-3,4,5,16')

        # print(scaled_kode_str)
        scaled_kode_re = re.findall(r'([FHLMITV]+[^FHLMITV]*)', scaled_kode_str)
        scaled_kode = [x.replace(' ','').replace('\n','').replace('Oppløs','') for x in scaled_kode_re]

        # print(scaled_gruntype_str)
        scaled_gruntype_re = re.findall(r'([FHLMITV]+[^FHLMITV]*)', scaled_gruntype_str)
        scaled_gruntype_last = [x.replace(' ','').replace('\n','') for x in scaled_gruntype_re]
        if len(scaled_kode) == 5:
            scaled_gruntype = [scaled_kode[0]]
            scaled_kode = scaled_kode[1:]
        else:
            scaled_gruntype = []
        scaled_gruntype.extend(scaled_gruntype_last)
        if scaled_gruntype[-1] == 'M':
            scaled_gruntype = scaled_gruntype[:-1]
        scaled_gruntype = scaled_gruntype[1:]
        if mnt_id == 'T7-C-11':
            scaled_kode = ['T7-B-11', 'T7-C-11']
            scaled_gruntype = ['T7-11', 'T7-11']
        if mnt_id == 'T32-C-8':
            scaled_kode = [None, 'T32-C-8', 'T32-D-6', 'T32-E-3']
            scaled_gruntype = [None, 'T32-10', 'T32-10,12,18,20,21', 'T32-6-12,17-21']
        if mnt_id == 'V1-C-1':
            scaled_kode = ['V1-B-1,2', 'V1-C-1', 'V1-D-1', 'V1-E-1']
            scaled_gruntype = ['V1-1-5', 'V1-1-5', 'V1-1-9,21-24', 'V1-1-9,21-24']
        if mnt_id == 'V2-C-1':
            scaled_kode = ['V2-B-1,2', 'V2-C-1', 'V2-D-1', 'V2-E-1']
            scaled_gruntype = ['V2-1,2', 'V2-1-2', 'V2-1-2', 'V2-1-2']
        print(mnt_id)
        print(scaled_kode)
        print(scaled_gruntype)
        # assert len(scaled_kode) == 4
        assert len(scaled_kode) == len(scaled_gruntype)

        # create detail for mnts
        detail_id = f'minor_type_scaled_{mnt_id}'
        session.merge(model.Detail(
            _id = detail_id,
            language_id = 'nb',
            key = '__name__',
            value = name
        ))
        session.merge(model.Detail(
            _id = detail_id,
            language_id = 'nb',
            key = '__physiognomy__',
            value = fysiognomi
        ))
        session.merge(model.Detail(
            _id = detail_id,
            language_id = 'nb',
            key = '__ecological_characteristics__',
            value = ecologisk_char
        ))
        # delete unused enteries in minor
        # q = session.query(model.MinorTypeScaled)\
        #     .filter(model.MinorTypeScaled.mappingScale_id != 500)\
        #     .filter(model.MinorTypeScaled.minorType_id.like(f'{mt_id}-%'))
        # q.delete(synchronize_session = False)
        # session.commit()
        #
        guide = [2500, 5000, 10000, 20000]
        for (i, mapping_scale_id) in enumerate(guide):
            try:
                mts_id_str = scaled_kode[i]
            except:
                mts_id_str = None
            if mts_id_str == None:
                continue
            mts_id_lst = get_list_of_codes(mts_id_str)
            for _id in mts_id_lst:
                minorType_id_str = scaled_gruntype[i]
                list_of_mnt = get_list_of_types(minorType_id_str)
                for mnt_id in list_of_mnt:
                    session.merge(
                        model.MinorTypeScaled(
                            _id = _id,
                            minorType_id = mnt_id,
                            mappingScale_id = mapping_scale_id,
                            detail_id = detail_id,
                            is_implemented = 1
                        )
                    )
                    session.commit()
        # return scaled_gruntype

    # print(nin_kar)
    # print(fysiognomi)
parse_page(page_content)

# %%
with open(source_file, 'rb') as f:
    pdf = PdfFileReader(f)
    for numpage in range(21,303):
        page = pdf.getPage(numpage)
        page_content = page.extractText()
        print(f'page num: {numpage}')
        parse_page(page_content)
# %%
