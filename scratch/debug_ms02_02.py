import requests
import os
import hashlib
from bs4 import BeautifulSoup
from PIL import Image
from io import BytesIO

WEB_BASE_URL = 'https://artsdatabanken.no/naturtyper/natur-i-norge'

def fetch_metadata(langkode):
    url = f"{WEB_BASE_URL}/{langkode}"
    print(f"Fetching {url}...")
    headers = {'User-Agent': 'Mozilla/5.0'}
    r = requests.get(url, headers=headers, timeout=10)
    if r.status_code != 200:
        print(f"Failed to fetch {url}")
        return None, None
    
    soup = BeautifulSoup(r.text, 'html.parser')
    img_url = None
    content = soup.find(class_='main-content') or soup.find(id='main-content') or soup.body
    for img in content.find_all('img'):
        src = img.get('src', '')
        if not src: continue
        if ('/public/' in src or '/sites/default/files/' in src) and \
           not any(x in src.lower() for x in ['icon', 'logo', 'social', 'user', 'theme', 'avatar']):
            img_url = src if src.startswith('http') else f"https://artsdatabanken.no{src}"
            break
    
    print(f"Found image URL: {img_url}")
    return "Dummy description", img_url

def download_and_optimize_image(url, type_id):
    if not url: return None
    print(f"Downloading image from {url}...")
    r = requests.get(url, headers={'User-Agent': 'Mozilla/5.0'}, timeout=15)
    if r.status_code == 200:
        print("Optimizing image with Pillow...")
        img = Image.open(BytesIO(r.content))
        if img.mode in ('RGBA', 'P'): img = img.convert('RGB')
        # Check if this crashes
        img.save("debug_test.webp", 'WEBP', quality=85)
        print("Image saved successfully.")
        return "debug_test.webp"
    return None

if __name__ == "__main__":
    langkode = "NIN-3.0-T-C-LI-0-0-MS02-02"
    desc, img_url = fetch_metadata(langkode)
    if img_url:
        download_and_optimize_image(img_url, "MS02-02")
    print("Test finished successfully!")
