import requests
from bs4 import BeautifulSoup

WEB_BASE_URL = 'https://artsdatabanken.no/naturtyper/natur-i-norge'
FOOTER_KEYWORDS = ['havnegata', 'trondheim', 'postboks', 'organisasjonsnummer', 'redaksjonen@artsdatabanken.no', 'postmottak', 'torgarden']

def extract_text_from_soup(soup):
    content = soup.find('main', id='main-content') or soup.find('article') or soup.body
    if not content: return ""
    
    # Filter out obvious UI elements
    for nav in content.find_all(['nav', 'button', 'script', 'style', 'header', 'footer']): 
        nav.decompose()
    
    captured = []
    found_start = False
    
    # Common start markers
    start_markers = ['Inndeling', 'Beskrivelse', 'Bruk av variabelen', 'Definisjon', 'Identifisering', 'Innhold']
    
    for el in content.find_all(['h2', 'h3', 'h4', 'p', 'ul', 'ol']):
        text = el.get_text(separator=' ', strip=True)
        if not text: continue
        
        # Skip breadcrumbs/nav
        if not found_start:
            if el.name == 'p' and len(text) > 100 and 'Forside' not in text:
                found_start = True
            elif el.name.startswith('h') and any(m in text for m in start_markers):
                found_start = True
            
            if not found_start: continue

        # Stop markers
        if any(kw in text.lower() for kw in FOOTER_KEYWORDS) or 'Siden siteres som' in text:
            break
        
        if el.name.startswith('h'):
            captured.append(f"### {text}")
        elif el.name == 'ul' or el.name == 'ol':
            items = [li.get_text(strip=True) for li in el.find_all('li')]
            for item in items:
                if len(item) > 5:
                    captured.append(f"- {item}")
        else:
            if len(text) > 20:
                captured.append(text)
    
    return "\n\n".join(captured)

def fetch_metadata(langkode):
    headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'}
    
    short_desc = ""
    long_desc = ""
    img_url = None
    
    # 1. Main Page
    url = f"{WEB_BASE_URL}/{langkode}"
    print(f"Fetching Main: {url}")
    r = requests.get(url, headers=headers, timeout=10)
    if r.status_code == 200:
        soup = BeautifulSoup(r.text, 'html.parser')
        ingress = soup.find(class_='ingress')
        if ingress: short_desc = ingress.get_text().strip()
        
        long_desc = extract_text_from_soup(soup)
        
        # Image ...
        content = soup.find(class_='main-content') or soup.find(id='main-content') or soup.body
        for img in content.find_all('img'):
            src = img.get('src', '')
            if '/public/' in src and not any(x in src.lower() for x in ['icon', 'logo', 'social']):
                img_url = src if src.startswith('http') else f"https://artsdatabanken.no{src}"
                break

    # 2. Description Page
    desc_url = f"{WEB_BASE_URL}/{langkode}/beskrivelse"
    print(f"Fetching Desc: {desc_url}")
    r = requests.get(desc_url, headers=headers, timeout=10)
    if r.status_code == 200:
        soup_desc = BeautifulSoup(r.text, 'html.parser')
        desc_long = extract_text_from_soup(soup_desc)
        if desc_long and len(desc_long) > len(long_desc):
            long_desc = desc_long

    # Merge
    full_text = short_desc
    if long_desc:
        if full_text and long_desc.startswith(full_text[:50]):
            full_text = long_desc
        else:
            full_text = f"{full_text}\n\n{long_desc}".strip()
            
    return full_text, img_url

if __name__ == "__main__":
    test_code = "NiN-3.0-V-A-N-LM-GK-W-KA-W"
    desc, img = fetch_metadata(test_code)
    print("\n--- DESCRIPTION ---")
    print(desc)
    print("\n--- IMAGE URL ---")
    print(img)
