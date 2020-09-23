from requests.sessions import session
from sqlalchemy.orm import sessionmaker

def generate_moor(engine, path):
    ''' Export CREATE query into moor file'''
    Session = sessionmaker(bind=engine)
    session = Session()
    res = session.execute('SELECT sql FROM sqlite_master').fetchall()
    with open(path, 'w') as f:
        for row in res:
            if row['sql'] !=  None:
                f.write(row['sql'])
                f.write(';\n')