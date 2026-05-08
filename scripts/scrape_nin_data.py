import requests
import sqlite3
import json
from bs4 import BeautifulSoup
from tqdm import tqdm
import time
import os
import hashlib
import zipfile
from PIL import Image
from io import BytesIO
from concurrent.futures import ThreadPoolExecutor, as_completed

BASE_URL = 'https://nin-kode-api.artsdatabanken.no/v3.0'
WEB_BASE_URL = 'https://artsdatabanken.no/naturtyper/natur-i-norge'
DB_PATH = 'assets/nin_database.sqlite'
FOOTER_KEYWORDS = ['havnegata', 'trondheim', 'postboks', 'organisasjonsnummer', 'redaksjonen@artsdatabanken.no', 'postmottak', 'torgarden']

# Official icons for top-level categories that lack natural photos
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

def setup_db():
    if os.path.exists(DB_PATH): os.remove(DB_PATH) # ALWAYS clean run
    # Also wipe temp_images for a 100% clean run
    import shutil
    if os.path.exists('temp_images'): shutil.rmtree('temp_images')
    os.makedirs('temp_images', exist_ok=True)
    os.makedirs('assets', exist_ok=True)
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    cursor.execute('''CREATE TABLE nin_types (
        id TEXT PRIMARY KEY, 
        navn TEXT, 
        kategori TEXT, 
        parent_id TEXT, 
        ecosystnivaa_navn TEXT, 
        typekategori_navn TEXT, 
        langkode TEXT, 
        definisjon TEXT, 
        image_url TEXT, 
        description TEXT, 
        lkm_data TEXT,
        scale TEXT,
        contains_types TEXT
    )''')
    conn.commit()
    return conn

def fetch_metadata(langkode):
    """Scrape ALL available descriptions and merge them."""
    if not langkode: return None, None
    headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'}
    
    short_desc = ""
    long_desc = ""
    img_url = None
    
    # 1. Main Page (Short Ingress + Image)
    try:
        url = f"{WEB_BASE_URL}/{langkode}"
        r = requests.get(url, headers=headers, timeout=10)
        if r.status_code == 200:
            soup = BeautifulSoup(r.text, 'html.parser')
            ingress = soup.find(class_='ingress')
            if ingress: short_desc = ingress.get_text().strip()
            
            # Harvesting Image
            content = soup.find(class_='main-content') or soup.find(id='main-content') or soup.body
            img_containers = [soup.find(class_='image'), soup.find(class_='image-and-caption__picture'), content]
            for container in img_containers:
                if not container: continue
                for img in container.find_all('img'):
                    src = img.get('src', '')
                    if '/public/' in src and not any(x in src.lower() for x in ['icon', 'logo', 'social', 'user', 'theme']):
                        img_url = src if src.startswith('http') else f"https://artsdatabanken.no{src}"
                        break
                if img_url: break
    except: pass

    # 2. Description Page (Deep Biological Detail)
    try:
        desc_url = f"{WEB_BASE_URL}/{langkode}/beskrivelse"
        r = requests.get(desc_url, headers=headers, timeout=10)
        if r.status_code == 200:
            soup = BeautifulSoup(r.text, 'html.parser')
            content = soup.find(class_='main-content') or soup.find(id='main-content') or soup.body
            paras = [p.get_text().strip() for p in content.find_all('p') 
                     if len(p.get_text().strip()) > 30 and not any(kw in p.get_text().lower() for kw in FOOTER_KEYWORDS)]
            if paras: long_desc = "\n\n".join(paras)
    except: pass

    # Merge them intelligently
    full_text = ""
    if short_desc: full_text = short_desc
    if long_desc:
        # Avoid duplicate starting text if long_desc repeats short_desc
        if full_text and long_desc.startswith(full_text[:50]):
            full_text = long_desc
        else:
            full_text = f"{full_text}\n\n{long_desc}".strip()
            
    return full_text if full_text else None, img_url

def download_and_optimize_image(url, type_id):
    if not url: return None
    try:
        filename = f"{hashlib.md5(type_id.encode()).hexdigest()}.webp"
        filepath = os.path.join('temp_images', filename)
        if os.path.exists(filepath): return filename
        
        r = requests.get(url, headers={'User-Agent': 'Mozilla/5.0'}, timeout=15)
        if r.status_code == 200:
            img = Image.open(BytesIO(r.content))
            if img.mode in ('RGBA', 'P'): img = img.convert('RGB')
            img.save(filepath, 'WEBP', quality=85)
            return filename
    except: pass
    return None

def process_single_type(t):
    # 1. Matrix Data (Grunntyper only)
    if t['kategori'] == 'Grunntype':
        try:
            dr = requests.get(f"{BASE_URL}/typer/kodeforGrunntype/{t['id']}", timeout=10)
            if dr.status_code == 200:
                import json
                def parse_lkm(obj):
                    l_list = []
                    def w(o):
                        if isinstance(o, dict):
                            if o.get('registert') == True and o.get('kode'):
                                k = o['kode']
                                ki = k['id'] if isinstance(k, dict) else str(k)
                                vi = ki.split('_')[0] if '_' in ki else ki
                                if any(p in vi for p in ['LM-', 'KM-', 'KA-', 'UF-', 'HI-', 'VM-']):
                                    l_list.append({'v_kode': vi, 'v_navn': o.get('navn'), 'v_trinn': o.get('verdi'), 'v_trinn_navn': o.get('beskrivelse')})
                            for v in o.values(): w(v)
                        elif isinstance(o, list):
                            for i in o: w(i)
                    w(obj)
                    return json.dumps(l_list) if l_list else None
                t['lkm_data'] = parse_lkm(dr.json())
        except: pass

    # 2. Metadata (Strict match)
    img_url = OFFICIAL_ICONS.get(t['id'])
    desc, web_img = fetch_metadata(t['langkode'])
    if not img_url: img_url = web_img
    
    t['description'] = desc
    if img_url:
        t['image_url'] = download_and_optimize_image(img_url, t['id'])
    return t

def main():
    conn = setup_db()
    cursor = conn.cursor()
    os.makedirs('temp_images', exist_ok=True)

    print("Step 1: Building Hierarchy...")
    r = requests.get(f"{BASE_URL}/typer/allekoder")
    data = r.json()
    all_types = []

    def walk_types(item, parent_id=None):
        kode = item['kode']
        contains = None
        if item.get('grunntyper') and item['kategori'] == 'Kartleggingsenhet':
            contains = json.dumps([g['kode']['id'] for g in item['grunntyper']])
        all_types.append({
            'id': kode['id'], 'navn': item['navn'], 'kategori': item['kategori'], 'parent_id': parent_id,
            'ecosystnivaa_navn': item.get('ecosystnivaaNavn'), 'typekategori_navn': item.get('typekategoriNavn'),
            'langkode': kode.get('langkode'), 'definisjon': kode.get('definisjon'),
            'image_url': None, 'description': None, 'lkm_data': None,
            'scale': item.get('maalestokkEnum'), 'contains_types': contains
        })
        for key in ['hovedtypegrupper', 'hovedtyper', 'grunntyper', 'kartleggingsenheter']:
            if item.get(key):
                for sub in item[key]: walk_types(sub, kode['id'])

    for root in data['typer']: walk_types(root)
    
    print(f"Step 2: Gold Run Deep Scrape ({len(all_types)} types) using 10 threads...")
    with ThreadPoolExecutor(max_workers=10) as executor:
        future_to_type = {executor.submit(process_single_type, t): t for t in all_types}
        for i, future in enumerate(tqdm(as_completed(future_to_type), total=len(all_types))):
            t = future.result()
            cursor.execute('''INSERT OR REPLACE INTO nin_types VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)''', (
                t['id'], t['navn'], t['kategori'], t['parent_id'], t['ecosystnivaa_navn'], 
                t['typekategori_navn'], t['langkode'], t['definisjon'], t['image_url'], 
                t['description'], t['lkm_data'], t['scale'], t['contains_types']
            ))
            if i % 100 == 0: conn.commit()
    conn.commit()

    print("Step 3: Bundling images.zip...")
    if os.path.exists('assets/images.zip'): os.remove('assets/images.zip')
    with zipfile.ZipFile('assets/images.zip', 'w', zipfile.ZIP_DEFLATED) as img_zip:
        for img_file in os.listdir('temp_images'):
            img_zip.write(os.path.join('temp_images', img_file), img_file)

    print(f"Done! Final Database: {DB_PATH}")
    conn.close()

if __name__ == "__main__":
    main()

if __name__ == "__main__":
    main()
