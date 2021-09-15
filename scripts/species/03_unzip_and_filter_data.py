# %%
from glob import glob
import os
from zipfile import ZipFile
import logging
# %%


# %%
dirs_in_data = glob('data/*')
# %%
def unzip(dir):
    files_in_dir = glob(f'{dir}/*.zip')
    if len(files_in_dir) == 0:
        logging.warn(f'No zipfile in {dir}')
        return
    if len(files_in_dir) > 1:
        logging.warn(f'Multiple zip files in {dir}')
        return

    with ZipFile(files_in_dir[0], 'r') as zip_object:
        zip_object.extractall(dir)

unzip(dirs_in_data[1])
# %%
# logging.basicConfig(level=logging.DEBUG)
# for data_dir in dirs_in_data:
