# %%
from PIL import Image
import requests
import pandas as pd
from tqdm import tqdm
import os
from io import BytesIO
from google.cloud import storage
import hashlib

# %%
class ImageDigestor():
    def __init__(self) -> None:
        os.environ["GOOGLE_APPLICATION_CREDENTIALS"]="/Users/amarok/src/natur-i-norge/scripts/species/secret/natur-i-norge-training-bfcd40f1165d.json"
        self.storage_client = storage.Client()
        self.bucket = self.storage_client.get_bucket('nin_training')
        tqdm.pandas()
        self.species_urls = pd.read_csv(f'partial{os.sep}04_species_urls.csv')

    def _get_file_path(self, specie):
        hash_object = hashlib.sha224(b'Hello World')
        hex_dig = hash_object.hexdigest()
        return f'{specie.gbifKey}/{hex_dig}.jpg'

    def is_specie_in_bucket(self, file_path):
        blob = storage.Blob(name=file_path, bucket=self.bucket)
        return blob.exists(self.storage_client);

    def get_image(self, specie):
        resp = requests.get(specie['identifier'])
        file_jpgdata = BytesIO(resp.content)

        return Image.open(file_jpgdata)

    def crop_img(self, img):
        width, height = img.size   # Get dimensions
        new_size = min([width, height])
        left = (width - new_size)/2
        top = (height - new_size)/2
        right = (width + new_size)/2
        bottom = (height + new_size)/2
        # Crop the center of the image
        return img.crop((left, top, right, bottom))

    def resize_img(self, img :Image):
        img.thumbnail(size=(224,224), resample=Image.ANTIALIAS)
        return img

    def create_tmp_dir(self, specie):
        name = specie.gbifKey
        tmp_dir = f'tmp{os.sep}{name}'
        if os.path.isdir(tmp_dir):
            return
        else:
            os.mkdir(tmp_dir)

    def run_on_specie(self, specie):
        self.create_tmp_dir(specie)
        file_path = self._get_file_path(specie)
        if self.is_specie_in_bucket(file_path):
            return
        img = self.get_image(specie)
        print(img)
        img_crop = self.crop_img(img)
        print(img_crop)
        img_crop_resize = self.resize_img(img_crop)
        print(img_crop_resize)

        tmp_path = f'tmp{os.sep}{file_path}'
        img_crop_resize.save(tmp_path)
        self.upload(tmp_path, file_path)
        os.remove(f'tmp{os.sep}*')

    def upload(self, source, destination):
        blob = self.bucket.blob(destination)
        blob.upload_from_filename(source)

    def run_all(self):
        self.species_urls.iloc[:2].progress_apply(self.run_on_specie, axis=1)
# %%
if __name__ == '__main__':
    image_digestor = ImageDigestor()
    image_digestor.run_all()
    exit()