# %%
from PIL import Image
import requests
import pandas as pd
import os
from io import BytesIO
# %%
species_urls = pd.read_csv(f'partial{os.sep}04_species_urls.csv')
# %%
specie = species_urls.iloc[0]
# %%
resp = requests.get(specie['identifier'])
# %%
file_jpgdata = BytesIO(resp.content)
img = Image.open(file_jpgdata)
# %%
width, height = img.size   # Get dimensions
new_size = min([width, height])
left = (width - new_size)/2
top = (height - new_size)/2
right = (width + new_size)/2
bottom = (height + new_size)/2

# Crop the center of the image
img_crop = img.crop((left, top, right, bottom))
img_crop
# %%
img_crop.thumbnail(size=(244,244), resample=Image.ANTIALIAS)
# %%
img_crop
# %%
