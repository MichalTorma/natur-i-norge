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
    if os.path.exists(DB_PATH): os.remove(DB_PATH)
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

def parse_lkm_deep(detail_json):
    lkm_list = []
    def walk(obj):
        if isinstance(obj, dict):
            if obj.get('registert') == True and obj.get('kode'):
                kode = obj['kode']
                k_id = kode['id'] if isinstance(kode, dict) else str(kode)
                # Split 'LM-KA_a' into 'LM-KA' and 'a'
                var_id = k_id.split('_')[0] if '_' in k_id else k_id
                trinn_val = obj.get('verdi') or (k_id.split('_')[1] if '_' in k_id else None)
                
                if any(prefix in var_id for prefix in ['LM-', 'KM-', 'KA-', 'UF-', 'HI-', 'VM-']):
                    lkm_list.append({
                        'v_kode': var_id,
                        'v_navn': obj.get('navn'),
                        'v_trinn': trinn_val,
                        'v_trinn_navn': obj.get('beskrivelse') or obj.get('navn')
                    })
            for v in obj.values(): walk(v)
        elif isinstance(obj, list):
            for item in obj: walk(item)
    walk(detail_json)
    return json.dumps(lkm_list) if lkm_list else None

def fetch_metadata(langkode, type_id):
    """Scrape description and image from the web portal."""
    headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'}
    try:
        url = f"{WEB_BASE_URL}/{langkode}"
        r = requests.get(url, headers=headers, timeout=10)
        if r.status_code != 200:
            url = f"{WEB_BASE_URL}/{langkode.upper()}"
            r = requests.get(url, headers=headers, timeout=10)
            
        if r.status_code == 200:
            soup = BeautifulSoup(r.text, 'html.parser')
            
            # 1. Extract Description (Ingress is best, then Body)
            ingress = soup.find(class_='ingress')
            body = soup.find(class_='body')
            content = soup.find(class_='main-content') or soup.find(id='main-content') or soup.body
            
            desc_text = ""
            if ingress:
                desc_text = ingress.get_text().strip()
            
            # If ingress is short, append first bit of body
            if body and len(desc_text) < 100:
                paras = [p.get_text().strip() for p in body.find_all('p') if len(p.get_text().strip()) > 30 and not any(kw in p.get_text().lower() for kw in FOOTER_KEYWORDS)]
                if paras:
                    desc_text += "\n\n" + paras[0]
            
            if not desc_text and content:
                paras = [p.get_text().strip() for p in content.find_all('p') if len(p.get_text().strip()) > 40 and not any(kw in p.get_text().lower() for kw in FOOTER_KEYWORDS)]
                desc_text = "\n\n".join(paras[:2])
                
            # 2. Find the best image (look in .image class first)
            img_url = None
            img_container = soup.find(class_='image') or content
            if img_container:
                for img in img_container.find_all('img'):
                    src = img.get('src', '')
                    if '/public/' in src and not any(x in src.lower() for x in ['icon', 'logo', 'social']):
                        img_url = src if src.startswith('http') else f"https://artsdatabanken.no{src}"
                        break
            
            return desc_text if desc_text else None, img_url
    except Exception as e:
        print(f"  Error scraping {langkode}: {e}")
    return None, None

def download_and_optimize_image(url, type_id):
    if not url: return None
    try:
        headers = {'User-Agent': 'Mozilla/5.0'}
        r = requests.get(url, headers=headers, timeout=15)
        if r.status_code == 200:
            img = Image.open(BytesIO(r.content))
            if img.mode in ('RGBA', 'P'): img = img.convert('RGB')
            filename = f"{hashlib.md5(type_id.encode()).hexdigest()}.webp"
            filepath = os.path.join('temp_images', filename)
            img.save(filepath, 'WEBP', quality=85)
            return filename
    except Exception as e:
        print(f"  Error downloading image for {type_id}: {e}")
    return None

def main():
    conn = setup_db()
    cursor = conn.cursor()
    
    print("Step 1: Building Hierarchy...")
    r = requests.get(f"{BASE_URL}/typer/allekoder")
    data = r.json()
    
    all_types = []
    def process_type(item, parent_id=None):
        kode = item['kode']
        contains = None
        if item.get('grunntyper') and item['kategori'] == 'Kartleggingsenhet':
            contains = json.dumps([g['kode']['id'] for g in item['grunntyper']])
            
        t_data = {
            'id': kode['id'], 'navn': item['navn'], 'kategori': item['kategori'], 'parent_id': parent_id,
            'ecosystnivaa_navn': item.get('ecosystnivaaNavn'), 'typekategori_navn': item.get('typekategoriNavn'),
            'langkode': kode.get('langkode'), 'definisjon': kode.get('definisjon'),
            'image_url': None, 'description': None, 'lkm_data': None,
            'scale': item.get('maalestokkEnum'),
            'contains_types': contains
        }
        all_types.append(t_data)
        for key in ['hovedtypegrupper', 'hovedtyper', 'grunntyper', 'kartleggingsenheter']:
            if item.get(key):
                for sub in item[key]: process_type(sub, kode['id'])

    for root in data['typer']: process_type(root)
    
    print(f"Step 2: Deep Scraping {len(all_types)} types (Matrix, Descriptions, Images)...")
    os.makedirs('temp_images', exist_ok=True)
    
    # Scrape descriptions/images for EVERY type that has a web link
    targets = [t for t in all_types if t['langkode'] or t['id'] in OFFICIAL_ICONS]
    
    for t in tqdm(targets):
        # Matrix Data (Only for Grunntyper)
        if t['kategori'] == 'Grunntype':
            try:
                url = f"{BASE_URL}/typer/kodeforGrunntype/{t['id']}"
                dr = requests.get(url, timeout=10)
                if dr.status_code == 200: t['lkm_data'] = parse_lkm_deep(dr.json())
            except: pass

        # 1. Start with Official Icons if they exist
        img_url = OFFICIAL_ICONS.get(t['id'])
        desc = None
        
        # 2. Fetch/Fallback to Web Metadata
        if t['langkode']:
            web_desc, web_img = fetch_metadata(t['langkode'], t['id'])
            desc = web_desc
            # Only use web image if we don't have an official icon
            if not img_url:
                img_url = web_img
        
        t['description'] = desc
        if img_url:
            t['image_url'] = download_and_optimize_image(img_url, t['id'])
        
        time.sleep(0.01)

    print("Step 3: Creating images.zip...")
    if os.path.exists('assets/images.zip'): os.remove('assets/images.zip')
    with zipfile.ZipFile('assets/images.zip', 'w') as img_zip:
        for img_file in os.listdir('temp_images'):
            img_zip.write(os.path.join('temp_images', img_file), img_file)

    print("Step 4: Saving to Database...")
    for t in all_types:
        cursor.execute('''INSERT INTO nin_types VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)''', (
            t['id'], t['navn'], t['kategori'], t['parent_id'], t['ecosystnivaa_navn'], 
            t['typekategori_navn'], t['langkode'], t['definisjon'], t['image_url'], 
            t['description'], t['lkm_data'], t['scale'], t['contains_types']
        ))
    
    conn.commit()
    
    cursor.execute("SELECT COUNT(*) FROM nin_types WHERE lkm_data IS NOT NULL")
    lkm_count = cursor.fetchone()[0]
    print(f"Success! {len(all_types)} types saved. {lkm_count} have Matrix coordinates.")
    print("Images bundled in assets/images.zip")
    conn.close()

if __name__ == "__main__":
    main()
