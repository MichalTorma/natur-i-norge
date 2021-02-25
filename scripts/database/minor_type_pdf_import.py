# %%
from PyPDF4 import PdfFileReader
import re
import itertools
# %%
source_file = '/Users/amarok/src/natur-i-norge/scripts/data/Beskrivelser_av_kartleggingsenheter_m_lestokk_1_5000.pdf'


# %%
def get_page(numpage):
    with open(source_file, 'rb') as f:
        pdf = PdfFileReader(f)
        page = pdf.getPage(numpage)
        page_content = page.extractText()
        return page_content
# %%
page_content = get_page(30)
print(page_content)
# page_content.splitlines()

# %%
def get_list_of_types(source):
    mnt = source.split('-')[0]
    ints_str = source[(len(mnt)+1):]
    ints_str_lst = ints_str.split(',')
    print(ints_str_lst)
    tmp = list(map(lambda x: list(range(int(x.split('-')[0]),int(x.split('-')[-1])+1)),ints_str_lst))
    int_lst = list(itertools.chain.from_iterable(tmp))
    return [f'{mnt}-{x}' for x in int_lst]

get_list_of_types('T1-9-20,27-32,37-40,49-60,65-68,73-76,79-82,85')
# %%
def parse_page(page):


    mnt_id_re = re.search(r'([A-Z])([0-9])+-C-([0-9])+', page)
    mnt_id = mnt_id_re.group(0)
    mntg_id = mnt_id.split('-')[0]
    if mntg_id == 'T4':
        print('Skipping T4')
    nin_kar_re = re.search(r'N\s?i\s?N\s?-\s?k\s?a\s?r\s?a\s?k\s?t\s?e\s?r\s?i\s?s\s?t\s?i\s?k\s?k\n*:\n*\s*([\S\s]*?)\nFysiognomi\s?:', page)
    nin_kar = nin_kar_re.group(1)
    fysiognomi_re = re.search(r'Fysiognomi\n*:\n*\s*([\S\s]*?)\nØkologisk karakteristikk\s?:', page)
    fysiognomi = fysiognomi_re.group(1)
    ecologisk_char_reg = re.search(r'Økologisk karakteristikk\n*:\n*\s*([\S\s]*?)\nTerreng', page)
    ecologisk_char = ecologisk_char_reg.group(1)
    page = page.replace('*','')
    mnt_scaled_reg = re.search(r'\sKode\s([\S\s]*?)\sGrunntyper\s([\S\s]*?)[^0-9FHLMITV\-,\s]+', page)
    mnt_scaled = None

    if (mnt_scaled_reg == None):
        print('No mnt_scaled')
    else:
        scaled_kode_str = mnt_scaled_reg.group(1)
        # print(scaled_kode_str)
        scaled_kode_re = re.findall(r'([FHLMITV]+[^FHLMITV]*)', scaled_kode_str)
        scaled_kode = [x.replace(' ','').replace('\n','') for x in scaled_kode_re]
        scaled_gruntype_str = mnt_scaled_reg.group(2)
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
        print(mnt_id)
        print(scaled_kode)
        print(scaled_gruntype)

        # return scaled_gruntype

    # print(nin_kar)
    # print(fysiognomi)
scaled_gruntype = parse_page(page_content)

# %%
with open(source_file, 'rb') as f:
    pdf = PdfFileReader(f)
    for numpage in range(21,303):
        page = pdf.getPage(numpage)
        page_content = page.extractText()
        print(f'page num: {numpage}')
        parse_page(page_content)
# %%
