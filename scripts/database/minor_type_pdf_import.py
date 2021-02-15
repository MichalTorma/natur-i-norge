# %%
from PyPDF4 import PdfFileReader
# %%
source_file = '/Users/amarok/src/natur-i-norge/scripts/data/Beskrivelser_av_kartleggingsenheter_m_lestokk_1_5000.pdf'

with open(source_file, 'rb') as f:
    pdf = PdfFileReader(f)
    information = pdf.getDocumentInfo()
    number_of_pages = pdf.getNumPages()
    txt = f"""
    Author: {information.author}
    Creator: {information.creator}
    Producer: {information.producer}
    Subject: {information.subject}
    Title: {information.title}
    Number of pages: {number_of_pages}
    """
    # Here the metadata of your pdf
    # print(txt)
    # numpage for the number page
    numpage=21
    page = pdf.getPage(numpage)
    page_content = page.extractText()
    # print the content in the page 20
    print(page_content)
# %%
