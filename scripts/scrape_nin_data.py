import requests
import sqlite3
import json
from bs4 import BeautifulSoup
from tqdm import tqdm
import time
import os
import hashlib
import zipfile

BASE_URL = 'https://nin-kode-api.artsdatabanken.no/v3.0'
WEB_BASE_URL = 'https://artsdatabanken.no/naturtyper/natur-i-norge'
DB_PATH = 'assets/nin_database.sqlite'
FOOTER_KEYWORDS = ['havnegata', 'trondheim', 'postboks', 'organisasjonsnummer', 'redaksjonen@artsdatabanken.no']

def setup_db():
    if os.path.exists(DB_PATH): os.remove(DB_PATH)
    os.makedirs('assets', exist_ok=True)
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    cursor.execute('''CREATE TABLE nin_types (id TEXT PRIMARY KEY, navn TEXT, kategori TEXT, parent_id TEXT, ecosystnivaa_navn TEXT, typekategori_navn TEXT, langkode TEXT, definisjon TEXT, image_url TEXT, description TEXT, lkm_data TEXT)''')
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

def fetch_metadata(langkode):
    """Scrape description and image from the web portal."""
    try:
        url = f"{WEB_BASE_URL}/{langkode}"
        r = requests.get(url, timeout=10)
        if r.status_code == 200:
            soup = BeautifulSoup(r.text, 'html.parser')
            content = soup.find(class_='main-content') or soup.find(id='main-content') or soup.body
            paras = [p.get_text().strip() for p in content.find_all('p') if len(p.get_text().strip()) > 40 and not any(kw in p.get_text().lower() for kw in FOOTER_KEYWORDS)]
            desc = "\n\n".join(paras[:2]) if paras else None
            img = soup.find('img', src=lambda s: s and '/sites/default/files/' in s)
            img_url = (f"https://artsdatabanken.no{img.get('src')}" if img.get('src').startswith('/') else img.get('src')) if img else None
            return desc, img_url
    except: pass
    return None, None

def main():
    conn = setup_db()
    cursor = conn.cursor()
    
    print("Step 1: Building Hierarchy...")
    r = requests.get(f"{BASE_URL}/typer/allekoder")
    data = r.json()
    
    all_types = []
    def process_type(item, parent_id=None):
        kode = item['kode']
        t_data = {
            'id': kode['id'], 'navn': item['navn'], 'kategori': item['kategori'], 'parent_id': parent_id,
            'ecosystnivaa_navn': item.get('ecosystnivaaNavn'), 'typekategori_navn': item.get('typekategoriNavn'),
            'langkode': kode.get('langkode'), 'definisjon': kode.get('definisjon'),
            'image_url': None, 'description': None, 'lkm_data': None
        }
        all_types.append(t_data)
        for key in ['hovedtypegrupper', 'hovedtyper', 'grunntyper']:
            if item.get(key):
                for sub in item[key]: process_type(sub, kode['id'])

    for root in data['typer']: process_type(root)
    
    print(f"Step 2: Deep Scraping {len(all_types)} types (Matrix, Descriptions, Images)...")
    for t in tqdm(all_types):
        # Matrix Data (Only for Grunntyper)
        if t['kategori'] == 'Grunntype':
            try:
                url = f"{BASE_URL}/typer/kodeforGrunntype/{t['id']}"
                dr = requests.get(url, timeout=10)
                if dr.status_code == 200: t['lkm_data'] = parse_lkm_deep(dr.json())
            except: pass

        # Descriptions & Images (Mostly for Hovedtype/Grunntype)
        if t['kategori'] in ['Hovedtype', 'Grunntype']:
            desc, img = fetch_metadata(t['langkode'])
            t['description'] = desc
            t['image_url'] = img
        
        # Throttling to be polite to the API
        time.sleep(0.01)

    print("Step 3: Saving to Database...")
    for t in all_types:
        cursor.execute('INSERT INTO nin_types VALUES (?,?,?,?,?,?,?,?,?,?,?)', (t['id'], t['navn'], t['kategori'], t['parent_id'], t['ecosystnivaa_navn'], t['typekategori_navn'], t['langkode'], t['definisjon'], t['image_url'], t['description'], t['lkm_data']))
    
    conn.commit()
    
    cursor.execute("SELECT COUNT(*) FROM nin_types WHERE lkm_data IS NOT NULL")
    lkm_count = cursor.fetchone()[0]
    print(f"Success! {len(all_types)} types saved. {lkm_count} have Matrix coordinates.")
    conn.close()

if __name__ == "__main__":
    main()
