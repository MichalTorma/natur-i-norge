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

# Official icons for top-level categories
OFFICIAL_ICONS = {
    'C-PE-NA': 'https://artsdatabanken.no/Media/F53505', # Natursystem
    'C-SE-NK': 'https://artsdatabanken.no/Media/F53504', # Naturkompleks
    'C-PE-LA': 'https://artsdatabanken.no/Media/F53500', # Landskapstype
    'A-MV-0': 'https://artsdatabanken.no/Media/F53502',  # Marine vannmasser
    'C-LI-0': 'https://artsdatabanken.no/Media/F53501',  # Livsmedium
    'NA-I': 'https://artsdatabanken.no/Media/F53436',    # Snø- og issystemer
    'NA-M': 'https://artsdatabanken.no/Media/F53735',    # Marine bunnsystemer
    'NA-S': 'https://artsdatabanken.no/Media/F16499',    # Marine vannmassesystemer
    'NA-T': 'https://artsdatabanken.no/Media/F53715',    # Fastmarkssystemer
    'NA-V': 'https://artsdatabanken.no/Media/F53716',    # Våtmarkssystemer
    'NA-F': 'https://artsdatabanken.no/Media/F53749',    # Limniske vannmassesystemer
    'NA-L': 'https://artsdatabanken.no/Media/F53745',    # Innsjøbunnsystemer
    'NA-O': 'https://artsdatabanken.no/Media/F53450',    # Elvebunnsystemer
    'A-LV-FL': 'https://artsdatabanken.no/Media/F53498', # Landformer i fast fjell og løsmasser
    'A-LV-EL': 'https://artsdatabanken.no/Media/F53492', # Elveløp
    'A-LV-IB': 'https://artsdatabanken.no/Media/F53497', # Innsjøbasseng
    'A-LV-TM': 'https://artsdatabanken.no/Media/F53508', # Torvmarksmassiv
    'A-LV-BM': 'https://artsdatabanken.no/Media/F53491', # Bremassiv
}

DIAGRAM_KEYWORDS = ['figur', 'diagram', 'skjema', 'graf', 'kart', 'outline', 'presentation', 'slide', 'sketch']
FOOTER_KEYWORDS = ['havnegata', 'trondheim', 'postboks', 'organisasjonsnummer', 'redaksjonen@artsdatabanken.no', 'postmottak@']

def setup_env():
    os.makedirs('assets', exist_ok=True)
    os.makedirs(IMAGE_DIR, exist_ok=True)
    if os.path.exists(DB_PATH):
        os.remove(DB_PATH)
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    cursor.execute('''
    CREATE TABLE nin_types (
        id TEXT NOT NULL PRIMARY KEY,
        navn TEXT NOT NULL,
        kategori TEXT NOT NULL,
        parent_id TEXT,
        ecosystnivaa_navn TEXT,
        typekategori_navn TEXT,
        langkode TEXT,
        definisjon TEXT,
        image_url TEXT,
        description TEXT,
        lkm_data TEXT
    )''')
    cursor.execute('''
    CREATE TABLE nin_variables (
        id TEXT NOT NULL PRIMARY KEY,
        navn TEXT NOT NULL,
        kategori TEXT NOT NULL,
        parent_id TEXT,
        ecosystnivaa_navn TEXT,
        variabelkategori_navn TEXT
    )''')
    conn.commit()
    return conn

def fetch_type_detail(langkode):
    """Fetch the full detail for a type to get variabeltrinn (LKMs)."""
    if not langkode: return []
    try:
        # V3.0 detailed endpoint
        url = f"{BASE_URL}/typer/hentkode/{langkode}"
        r = requests.get(url, timeout=10)
        if r.status_code == 200:
            item = r.json()
            lkm_list = []
            if 'variabeltrinn' in item and item['variabeltrinn']:
                for v in item['variabeltrinn']:
                    # Extract trinn from the complex maaleskala structure
                    trinn_verdi = None
                    trinn_navn = None
                    if v.get('trinn'):
                        trinn_verdi = v['trinn'].get('verdi')
                        trinn_navn = v['trinn'].get('navn')
                    
                    lkm_list.append({
                        'v_kode': v.get('kode'),
                        'v_navn': v.get('navn'),
                        'v_trinn': trinn_verdi,
                        'v_trinn_navn': trinn_navn
                    })
            return lkm_list
    except Exception as e:
        print(f"Error fetching detail for {langkode}: {e}")
    return []

def download_image(url, langkode, force=False):
    if not url: return None
    try:
        filename = f"{hashlib.md5(langkode.encode()).hexdigest()}.webp"
        filepath = os.path.join(IMAGE_DIR, filename)
        if os.path.exists(filepath) and not force: return filename
        r = requests.get(url, timeout=15)
        if r.status_code == 200:
            img = Image.open(BytesIO(r.content))
            if img.mode in ('RGBA', 'P'): img = img.convert('RGB')
            img.save(filepath, 'WEBP', quality=85)
            return filename
    except Exception as e:
        print(f"Error downloading {url}: {e}")
    return None

def scrape_web_metadata(langkode):
    if not langkode: return None, None
    try:
        url = f"{WEB_BASE_URL}/{langkode}"
        response = requests.get(url, timeout=10)
        if response.status_code == 200:
            soup = BeautifulSoup(response.text, 'html.parser')
            if soup.footer: soup.footer.decompose()
            for script in soup(["script", "style"]): script.decompose()
            content = soup.find(class_='main-content') or soup.find(id='main-content') or soup.body
            paragraphs = content.find_all('p')
            description = None
            if paragraphs:
                valid_p = []
                for p in paragraphs:
                    text = p.get_text().strip()
                    if len(text) < 40: continue
                    if any(kw in text.lower() for kw in FOOTER_KEYWORDS): continue
                    valid_p.append(text)
                if valid_p: description = "\n\n".join(valid_p[:2])
            image_url = None
            img_tags = soup.find_all('img', src=lambda s: s and '/sites/default/files/' in s)
            for img in img_tags:
                src = img.get('src', '').lower()
                alt = img.get('alt', '').lower()
                if any(kw in src or kw in alt for kw in DIAGRAM_KEYWORDS): continue
                if 'public' in src:
                    image_url = f"https://artsdatabanken.no{img.get('src')}" if img.get('src').startswith('/') else img.get('src')
                    break
            return description, image_url
    except Exception as e:
        pass
    return None, None

def main():
    conn = setup_env()
    cursor = conn.cursor()
    
    print("Fetching types from API (Summary)...")
    r = requests.get(f"{BASE_URL}/typer/allekoder")
    data = r.json()
    
    all_types = []
    def process_type(item, parent_id=None):
        kode = item['kode']
        all_types.append({
            'id': kode['id'],
            'navn': item['navn'],
            'kategori': item['kategori'],
            'parent_id': parent_id,
            'ecosystnivaa_navn': item.get('ecosystnivaaNavn'),
            'typekategori_navn': item.get('typekategoriNavn'),
            'langkode': kode.get('langkode'),
            'definisjon': kode.get('definisjon'),
            'image_url': None,
            'description': None,
            'lkm_data': None
        })
        for key in ['hovedtypegrupper', 'hovedtyper', 'grunntyper', 'kartleggingsenheter']:
            if item.get(key):
                for sub in item[key]:
                    process_type(sub, kode['id'])

    for root_type in data['typer']:
        process_type(root_type)
    
    print(f"Deep scraping {len(all_types)} types for LKM Matrix data...")
    
    # We only need LKM data for Grunntype and Hovedtype levels
    for t in tqdm(all_types):
        # Fetch LKM coordinates for Matrix
        if t['kategori'] in ['Hovedtype', 'Grunntype']:
            lkm = fetch_type_detail(t['langkode'])
            if lkm:
                t['lkm_data'] = json.dumps(lkm)

        # Scrape web metadata
        if t['id'] in OFFICIAL_ICONS:
            t['image_url'] = download_image(OFFICIAL_ICONS[t['id']], t['langkode'], force=True)
            desc, _ = scrape_web_metadata(t['langkode'])
            t['description'] = desc
        elif t['kategori'] != 'Kartleggingsenhet':
            desc, img_url = scrape_web_metadata(t['langkode'])
            t['description'] = desc
            if img_url:
                t['image_url'] = download_image(img_url, t['langkode'])
            time.sleep(0.01)

    print("Second pass: Inheritance fix...")
    by_parent = {}
    for t in all_types:
        p_id = t['parent_id']
        if p_id not in by_parent: by_parent[p_id] = []
        by_parent[p_id].append(t)

    for t in all_types:
        if t['image_url'] is None:
            children = by_parent.get(t['id'], [])
            for child in children:
                if child['image_url']:
                    t['image_url'] = child['image_url']
                    break

    print("Writing to database...")
    for t in all_types:
        cursor.execute('''
            INSERT INTO nin_types (id, navn, kategori, parent_id, ecosystnivaa_navn, typekategori_navn, langkode, definisjon, image_url, description, lkm_data)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', (t['id'], t['navn'], t['kategori'], t['parent_id'], t['ecosystnivaa_navn'], t['typekategori_navn'], t['langkode'], t['definisjon'], t['image_url'], t['description'], t['lkm_data']))

    print("Zipping images...")
    with zipfile.ZipFile(ZIP_PATH, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(IMAGE_DIR):
            for file in files: zipf.write(os.path.join(root, file), file)

    conn.commit()
    conn.close()
    print("Matrix data sync complete.")

if __name__ == "__main__":
    main()
