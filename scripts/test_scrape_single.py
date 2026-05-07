import requests
from bs4 import BeautifulSoup

WEB_BASE_URL = 'https://artsdatabanken.no/naturtyper/natur-i-norge'
FOOTER_KEYWORDS = ['havnegata', 'trondheim', 'postboks', 'organisasjonsnummer', 'redaksjonen@artsdatabanken.no', 'postmottak', 'torgarden']

def fetch_metadata(langkode):
    headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'}
    url = f"{WEB_BASE_URL}/{langkode}"
    print(f"Fetching: {url}")
    
    r = requests.get(url, headers=headers, timeout=10)
    if r.status_code == 200:
        soup = BeautifulSoup(r.text, 'html.parser')
        
        ingress = soup.find(class_='ingress')
        body = soup.find(class_='body')
        content = soup.find(class_='main-content') or soup.find(id='main-content') or soup.body
        
        desc_text = ""
        if ingress:
            desc_text = ingress.get_text().strip()
        
        if body and len(desc_text) < 100:
            paras = [p.get_text().strip() for p in body.find_all('p') if len(p.get_text().strip()) > 30 and not any(kw in p.get_text().lower() for kw in FOOTER_KEYWORDS)]
            if paras:
                desc_text += "\n\n" + paras[0]
        
        img_url = None
        img_container = soup.find(class_='image') or content
        if img_container:
            for img in img_container.find_all('img'):
                src = img.get('src', '')
                if '/public/' in src and not any(x in src.lower() for x in ['icon', 'logo', 'social']):
                    img_url = src if src.startswith('http') else f"https://artsdatabanken.no{src}"
                    break
                    
        return desc_text, img_url
    else:
        return f"Error: Status code {r.status_code}", None

if __name__ == "__main__":
    test_code = "NIN-3.0-T-C-PE-NA-MB-A-TB01"
    desc, img = fetch_metadata(test_code)
    print("\n--- DESCRIPTION ---")
    print(desc)
    print("\n--- IMAGE URL ---")
    print(img)
