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
        description TEXT
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

def download_image(url, langkode):
    if not url:
        return None
    
    try:
        # We save everything as .webp regardless of source format
        filename = f"{hashlib.md5(langkode.encode()).hexdigest()}.webp"
        filepath = os.path.join(IMAGE_DIR, filename)
        
        if os.path.exists(filepath):
            return filename
            
        r = requests.get(url, timeout=15)
        if r.status_code == 200:
            img = Image.open(BytesIO(r.content))
            # Convert to RGB if necessary (to handle PNG with transparency)
            if img.mode in ('RGBA', 'P'):
                img = img.convert('RGB')
            
            # Save as high-quality WebP
            img.save(filepath, 'WEBP', quality=85)
            return filename
    except Exception as e:
        print(f"Error downloading/converting {url}: {e}")
    return None

def scrape_web_metadata(langkode):
    if not langkode:
        return None, None
    
    try:
        url = f"{WEB_BASE_URL}/{langkode}/beskrivelse"
        response = requests.get(url, timeout=10)
        if response.status_code == 200:
            soup = BeautifulSoup(response.text, 'html.parser')
            
            content = soup.find(class_='main-content') or soup.body
            paragraphs = content.find_all('p')
            description = None
            if paragraphs:
                valid_p = [p.get_text().strip() for p in paragraphs if len(p.get_text().strip()) > 30]
                description = "\n\n".join(valid_p[:2])
            
            image_url = None
            img_tag = soup.find('img', src=lambda s: s and '/sites/default/files/' in s)
            if img_tag:
                src = img_tag.get('src')
                image_url = f"https://artsdatabanken.no{src}" if src.startswith('/') else src
                
            return description, image_url
    except Exception as e:
        pass
    return None, None

def main():
    conn = setup_env()
    cursor = conn.cursor()
    
    print("Fetching types from API...")
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
            'description': None
        })
        for key in ['hovedtypegrupper', 'hovedtyper', 'grunntyper', 'kartleggingsenheter']:
            if item.get(key):
                for sub in item[key]:
                    process_type(sub, kode['id'])

    for root_type in data['typer']:
        process_type(root_type)
    
    print(f"Syncing {len(all_types)} types with WebP conversion...")
    
    for t in tqdm(all_types):
        if t['kategori'] != 'Kartleggingsenhet':
            desc, img_url = scrape_web_metadata(t['langkode'])
            t['description'] = desc
            if img_url:
                local_img = download_image(img_url, t['langkode'])
                t['image_url'] = local_img
            
            time.sleep(0.02)
            
        cursor.execute('''
            INSERT INTO nin_types (id, navn, kategori, parent_id, ecosystnivaa_navn, typekategori_navn, langkode, definisjon, image_url, description)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', (t['id'], t['navn'], t['kategori'], t['parent_id'], t['ecosystnivaa_navn'], t['typekategori_navn'], t['langkode'], t['definisjon'], t['image_url'], t['description']))

    print("Zipping WebP images...")
    with zipfile.ZipFile(ZIP_PATH, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(IMAGE_DIR):
            for file in files:
                zipf.write(os.path.join(root, file), file)

    print("Syncing variables...")
    rv = requests.get(f"{BASE_URL}/variabler/allekoder")
    v_data = rv.json()
    def process_var(item, parent_id=None):
        v_id = item['kode']['id']
        cursor.execute('''
            INSERT INTO nin_variables (id, navn, kategori, parent_id, ecosystnivaa_navn, variabelkategori_navn)
            VALUES (?, ?, ?, ?, ?, ?)
        ''', (v_id, item['navn'], item.get('kategori', 'Variabel'), parent_id, item.get('ecosystnivaaNavn'), item.get('variabelkategoriNavn')))
        if item.get('variabelnavn'):
            for sub in item['variabelnavn']:
                process_var(sub, v_id)
    for root_var in v_data['variabler']:
        process_var(root_var)

    conn.commit()
    conn.close()
    print(f"Full WebP offline bundle created at assets/")

if __name__ == "__main__":
    main()
