import requests
import sqlite3
import json
from bs4 import BeautifulSoup
from tqdm import tqdm
import time
import os
import hashlib

BASE_URL = 'https://nin-kode-api.artsdatabanken.no/v3.0'
DB_PATH = 'assets/nin_database.sqlite'

def setup_db():
    if not os.path.exists('assets'): os.makedirs('assets')
    # We don't remove the DB here to avoid losing images/descriptions from previous runs
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    # Ensure lkm_data column exists
    try:
        cursor.execute("ALTER TABLE nin_types ADD COLUMN lkm_data TEXT")
    except:
        pass # Already exists
    conn.commit()
    conn.close()

def parse_lkm_deep(detail_json):
    """Recursively find all registered LKM trinn in the detail JSON."""
    lkm_list = []
    
    # In NiN 3.0, coordinates are in 'kodesammensetting' or nested in 'variabler'
    # We look for any object that has 'registert': True and a 'kode'
    
    def walk(obj):
        if isinstance(obj, dict):
            if obj.get('registert') == True and obj.get('kode'):
                kode = obj['kode']
                k_id = kode['id'] if isinstance(kode, dict) else str(kode)
                # We are looking for LKM codes (usually start with LM-, KM-, etc.)
                if any(prefix in k_id for prefix in ['LM-', 'KM-', 'KA-', 'UF-', 'HI-', 'VM-']):
                    lkm_list.append({
                        'v_kode': k_id,
                        'v_navn': obj.get('navn'),
                        'v_trinn': obj.get('verdi'),
                        'v_trinn_navn': obj.get('beskrivelse') or obj.get('navn')
                    })
            for v in obj.values():
                walk(v)
        elif isinstance(obj, list):
            for item in obj:
                walk(item)
                
    walk(detail_json)
    return json.dumps(lkm_list) if lkm_list else None

def main():
    setup_db()
    
    print("Fetching types list...")
    r = requests.get(f"{BASE_URL}/typer/allekoder")
    data = r.json()
    
    all_types = []
    def process_type(item):
        if item['kategori'] == 'Grunntype':
            all_types.append(item['kode']['id'])
        for key in ['hovedtypegrupper', 'hovedtyper', 'grunntyper']:
            if item.get(key):
                for sub in item[key]: process_type(sub)

    for root in data['typer']: process_type(root)
    
    print(f"Deep scraping {len(all_types)} Grunntyper for Matrix coordinates...")
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    for tid in tqdm(all_types):
        try:
            # The Magic URL for Grunntyper
            url = f"{BASE_URL}/typer/kodeforGrunntype/{tid}"
            detail_r = requests.get(url, timeout=10)
            if detail_r.status_code == 200:
                lkm = parse_lkm_deep(detail_r.json())
                if lkm:
                    cursor.execute("UPDATE nin_types SET lkm_data = ? WHERE id = ?", (lkm, tid))
        except Exception as e:
            print(f"Error for {tid}: {e}")
        
        # Periodic commit
        if all_types.index(tid) % 100 == 0: conn.commit()

    conn.commit()
    
    # Verify
    cursor.execute("SELECT COUNT(*) FROM nin_types WHERE lkm_data IS NOT NULL")
    count = cursor.fetchone()[0]
    print(f"Sync complete! {count} Grunntyper now have ecological matrix coordinates.")
    conn.close()

if __name__ == "__main__":
    main()
