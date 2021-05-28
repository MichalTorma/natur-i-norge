# %%
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from model.model import Base
import model.model as model
import pyphen

# %%
pyphen.language_fallback('nn_NO')
dic = pyphen.Pyphen(lang='nb_NO')
# %%
res = dic.inserted('ikke saltanriket', hyphen='-')# hyphen='\u00AD')
print(res)
# %%
database_file = '/Users/amarok/src/natur-i-norge/naturinorge_guide/assets/nin_database.db'
engine = create_engine(f'sqlite:///{database_file}')
# %%
Session = sessionmaker(bind=engine)
session = Session()

# %%
def hyphenate_word(word):
    if word == None:
        return None
    if '\u00AD' in word:
        return word

    return dic.inserted(word, hyphen='\u00AD')

def hyphenate_detail(detail):
    if detail.key[0] != '<':
        detail.key = hyphenate_word(detail.key)
    detail.value = hyphenate_word(detail.value)
    session.commit()

# %%
# %%
details_nb = session.query(model.Detail)\
    .filter(model.Detail.language_id == 'nb').all()
for detail in details_nb:
    hyphenate_detail(detail)
# %%
pyphen.language_fallback('en_GB')
dic = pyphen.Pyphen(lang='en')

# %%
details_nb = session.query(model.Detail)\
    .filter(model.Detail.language_id == 'en').all()
for detail in details_nb:
    hyphenate_detail(detail)
# %%
