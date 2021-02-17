# %%
from PyPDF4 import PdfFileReader
import re
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
page_content = get_page(100)
print(page_content)
# page_content.splitlines()
# %%
def parse_page(page):

    mnt_id_re = re.search(r'([A-Z])([0-9])+-C-([0-9])+', page)
    mnt_id = mnt_id_re.group(0)
    print(mnt_id)
    nin_kar_re = re.search(r'N\s?i\s?N\s?-\s?k\s?a\s?r\s?a\s?k\s?t\s?e\s?r\s?i\s?s\s?t\s?i\s?k\s?k\n*:\n*\s*([\S\s]*?)\nFysiognomi\s?:', page)
    nin_kar = nin_kar_re.group(1)
    fysiognomi_re = re.search(r'Fysiognomi\n*:\n*\s*([\S\s]*?)\nØkologisk karakteristikk\s?:', page)
    fysiognomi = fysiognomi_re.group(1)
    ecologisk_char_reg = re.search(r'Økologisk karakteristikk\n*:\n*\s*([\S\s]*?)\nTerreng', page)
    ecologisk_char = ecologisk_char_reg.group(1)
    mnt_scaled_reg = re.search(r'\sKode\s([\S\s]*?)\sGrunntyper\s', page)
    mnt_scaled = None
    if (mnt_scaled_reg == None):
        print('No mnt_scaled')
    else:
        mnt_scaled = mnt_scaled_reg.group(1)

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
