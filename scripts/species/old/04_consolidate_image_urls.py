# %%
from glob import glob
import pandas as pd
import logging
import os
# %%
if __name__ == '__main__':
    dirs_in_data = glob(f'data{os.sep}*')
    list_of_multimedia_dfs = []
    for dir_in_data in dirs_in_data:
        multimedia = pd.read_csv(f'{dir_in_data}{os.sep}multimedia.txt', sep='\t')
        gbif_key = int(dir_in_data.split(os.sep)[-1])
        multimedia['gbifKey'] = gbif_key
        multimedia = multimedia[['gbifKey', 'identifier']]
        list_of_multimedia_dfs.append(multimedia)
    res = pd.concat(list_of_multimedia_dfs)
    res.to_csv(f'partial{os.sep}04_species_urls.csv')
# %%
def stats(df, treshold_num=10):
    input_num = df.groupby(['gbifKey']).agg(lambda x: len(x))
    input_num = input_num[['identifier']]
    input_num.columns = ['count']

    return {
        'Treshold' : treshold_num,
        'Number of species with observation' : len(input_num),
        'Number of species with more than treshold' : {sum(input_num['count']>treshold_num)},}


# %%
