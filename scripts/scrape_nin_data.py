import requests
import sqlite3
import json
from bs4 import BeautifulSoup
from tqdm import tqdm
import time
import os
import hashlib
import zipfile
from io import BytesIO
from PIL import Image

BASE_URL = 'https://nin-kode-api.artsdatabanken.no/v3.0'
WEB_BASE_URL = 'https://artsdatabanken.no/naturtyper/natur-i-norge'
DB_PATH = 'assets/nin_database.sqlite'
IMAGE_DIR = 'temp_images'
ZIP_PATH = 'assets/images.zip'

OFFICIAL_ICONS = {
    'C-PE-NA': 'https://artsdatabanken.no/Media/F53505',
    'C-SE-NK': 'https://artsdatabanken.no/Media/F53504',
    'C-PE-LA': 'https://artsdatabanken.no/Media/F53500',
    'A-MV-0': 'https://artsdatabanken.no/Media/F53502',
    'C-LI-0': 'https://artsdatabanken.no/Media/F53501',
    'NA-I': 'https://artsdatabanken.no/Media/F53436',
    'NA-M': 'https://artsdatabanken.no/Media/F53735',
    'NA-S': 'https://artsdatabanken.no/Media/F16499',
    'NA-T': 'https://artsdatabanken.no/Media/F53715',
    'NA-V': 'https://artsdatabanken.no/Media/F53716',
    'NA-F': 'https://artsdatabanken.no/Media/F53749',
    'NA-L': 'https://artsdatabanken.no/Media/F53745',
    'NA-O': 'https://artsdatabanken.no/Media/F53450',
    'A-LV-FL': 'https://artsdatabanken.no/Media/F53498',
    'A-LV-EL': 'https://artsdatabanken.no/Media/F53492',
    'A-LV-IB': 'https://artsdatabanken.no/Media/F53497',
    'A-LV-TM': 'https://artsdatabanken.no/Media/F53508',
    'A-LV-BM': 'https://artsdatabanken.no/Media/F53491',
}

FOOTER_KEYWORDS = ['havnegata', 'trondheim', 'postboks', 'organisasjonsnummer', 'redaksjonen@artsdatabanken.no', 'postmottak@']

def setup_db():
    os.makedirs('assets', exist_ok=True)
    os.makedirs(IMAGE_DIR, exist_ok=True)
    if os.path.exists(DB_PATH):
        try: os.remove(DB_PATH)
        except: pass
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    cursor.execute('''CREATE TABLE nin_types (id TEXT PRIMARY KEY, navn TEXT, kategori TEXT, parent_id TEXT, ecosystnivaa_navn TEXT, typekategori_navn TEXT, langkode TEXT, definisjon TEXT, image_url TEXT, description TEXT, lkm_data TEXT)''')
    cursor.execute('''CREATE TABLE nin_variables (id TEXT PRIMARY KEY, navn TEXT, kategori TEXT, parent_id TEXT, ecosystnivaa_navn TEXT, variabelkategori_navn TEXT)''')
    conn.commit()
    conn.close()

def parse_lkm(item):
    """Deep parse LKM coordinates from NiN 3.0 structure."""
    lkm_list = []
    # Check all common NiN 3.0 locations for variables
    trinn_sources = item.get('variabeltrinn', [])
    if not trinn_sources and 'kodesammensetting' in item:
        trinn_sources = item['kodesammensetting'].get('variabeltrinn', [])
        
    for v in trinn_sources:
        # Extract trinn from the complex structure
        trinn_verdi = v.get('trinnVerdi')
        trinn_navn = v.get('trinnNavn')
        
        if not trinn_verdi and v.get('trinn'):
            if isinstance(v['trinn'], dict):
                trinn_verdi = v['trinn'].get('verdi')
                trinn_navn = v['trinn'].get('navn')
            elif isinstance(v['trinn'], list) and len(v['trinn']) > 0:
                trinn_verdi = v['trinn'][0].get('verdi')
                trinn_navn = v['trinn'][0].get('navn')

        lkm_list.append({
            'v_kode': v.get('kode'),
            'v_navn': v.get('navn'),
            'v_trinn': trinn_verdi,
            'v_trinn_navn': trinn_navn
        })
    return json.dumps(lkm_list) if lkm_list else None

def fetch_details_and_metadata(t):
    """Fetch both API details (LKM) and Web metadata (Desc/Image)."""
    try:
        # 1. API Fetch
        url = f"{BASE_URL}/typer/hentkode/{t['langkode']}"
        r = requests.get(url, timeout=10)
        if r.status_code == 200:
            detail = r.json()
            t['lkm_data'] = parse_lkm(detail)
        
        # 2. Web Fetch
        web_url = f"{WEB_BASE_URL}/{t['langkode']}"
        wr = requests.get(web_url, timeout=10)
        if wr.status_code == 200:
            soup = BeautifulSoup(wr.text, 'html.parser')
            # Extract description
            content = soup.find(class_='main-content') or soup.find(id='main-content') or soup.body
            paras = [p.get_text().strip() for p in content.find_all('p') if len(p.get_text().strip()) > 40 and not any(kw in p.get_text().lower() for kw in FOOTER_KEYWORDS)]
            if paras: t['description'] = "\n\n".join(paras[:2])
            # Image check (simplified)
            img = soup.find('img', src=lambda s: s and '/sites/default/files/' in s)
            if img:
                src = img.get('src')
                t['image_url'] = f"https://artsdatabanken.no{src}" if src.startswith('/') else src
    except Exception:
        pass

def main():
    setup_db()
    print("Fetching NiN 3.0 Hierarchy...")
    r = requests.get(f"{BASE_URL}/typer/allekoder")
    data = r.json()
    
    all_types = []
    def process_type(item, parent_id=None):
        kode = item['kode']
        all_types.append({
            'id': kode['id'], 'navn': item['navn'], 'kategori': item['kategori'], 'parent_id': parent_id,
            'ecosystnivaa_navn': item.get('ecosystnivaaNavn'), 'typekategori_navn': item.get('typekategoriNavn'),
            'langkode': kode.get('langkode'), 'definisjon': kode.get('definisjon'),
            'image_url': None, 'description': None, 'lkm_data': None
        })
        for key in ['hovedtypegrupper', 'hovedtyper', 'grunntyper']:
            if item.get(key):
                for sub in item[key]: process_type(sub, kode['id'])

    for root_type in data['typer']: process_type(root_type)
    
    print(f"Deep scraping {len(all_types)} types for Matrix and Descriptions...")
    # Filtering to only Hovedtype and Grunntype to save time/requests
    target_types = [t for t in all_types if t['kategori'] in ['Hovedtype', 'Grunntype']]
    
    for t in tqdm(target_types):
        fetch_details_and_metadata(t)
        time.sleep(0.01)

    print("Saving to database...")
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    for t in all_types:
        cursor.execute('INSERT INTO nin_types VALUES (?,?,?,?,?,?,?,?,?,?,?)', (t['id'], t['navn'], t['kategori'], t['parent_id'], t['ecosystnivaa_navn'], t['typekategori_navn'], t['langkode'], t['definisjon'], t['image_url'], t['description'], t['lkm_data']))
    conn.commit()
    
    cursor.execute("SELECT COUNT(*) FROM nin_types WHERE lkm_data IS NOT NULL")
    lkm_count = cursor.fetchone()[0]
    print(f"Success! Database finalized with {len(all_types)} records. {lkm_count} types have Matrix data.")
    conn.close()

if __name__ == "__main__":
    main()
