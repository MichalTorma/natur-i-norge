# %%
from glob import glob
import pandas as pd
import logging
import os
# %%
if __name__ == '__main__':
    dirs_in_data = glob(f'data{os.sep}*')
    list_of_mulimedia_dfs = []
    for dir_in_data in dirs_in_data:
        multimedia = pd.read_csv(f'{dir_in_data}{os.sep}multimedia.txt', sep='\t')
        gbif_key = int(dir_in_data.split(os.sep)[-1])
        multimedia['gbifKey'] = gbif_key
        multimedia = multimedia[['gbifKey', 'identifier']]
        list_of_mulimedia_dfs.append(multimedia)
    res = pd.concat(list_of_mulimedia_dfs)
    res.to_csv(f'partial{os.sep}04_species_urls.csv')
# %%
