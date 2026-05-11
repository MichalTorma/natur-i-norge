import sqlite3
import json
import requests
from tqdm import tqdm

BASE_URL = 'https://nin-kode-api.artsdatabanken.no/v3.0'
DB_PATH = 'assets/nin_database.sqlite'

def update_relationships():
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    # Find all Kartleggingsenheter
    cursor.execute("SELECT id FROM nin_types WHERE kategori = 'Kartleggingsenhet'")
    ke_ids = [row[0] for row in cursor.fetchall()]
    
    print(f"Updating relationships for {len(ke_ids)} Kartleggingsenheter...")
    
    for ke_id in tqdm(ke_ids):
        try:
            url = f"{BASE_URL}/typer/kodeforKartleggingsenhet/{ke_id}"
            r = requests.get(url, timeout=10)
            if r.status_code == 200:
                data = r.json()
                if data.get('grunntyper'):
                    gt_ids = [g['kode']['id'] for g in data['grunntyper']]
                    contains_types = json.dumps(gt_ids)
                    cursor.execute("UPDATE nin_types SET contains_types = ? WHERE id = ?", (contains_types, ke_id))
                    
                    # Also try to get LKM data if it exists for the KE itself
                    lkm_list = []
                    def w(o):
                        if isinstance(o, dict):
                            if o.get('registert') == True and o.get('kode'):
                                k = o['kode']
                                ki = k['id'] if isinstance(k, dict) else str(k)
                                vi = ki.split('_')[0] if '_' in ki else ki
                                if any(p in vi for p in ['LM-', 'KM-', 'KA-', 'UF-', 'HI-', 'VM-']):
                                    lkm_list.append({
                                        'v_kode': vi, 
                                        'v_navn': o.get('navn'), 
                                        'v_trinn': o.get('verdi'), 
                                        'v_trinn_navn': o.get('beskrivelse')
                                    })
                            for v in o.values(): w(v)
                        elif isinstance(o, list):
                            for i in o: w(i)
                    w(data)
                    if lkm_list:
                        cursor.execute("UPDATE nin_types SET lkm_data = ? WHERE id = ?", (json.dumps(lkm_list), ke_id))
        except Exception as e:
            print(f"Error updating {ke_id}: {e}")
            
    conn.commit()
    conn.close()
    print("Done!")

if __name__ == "__main__":
    update_relationships()
