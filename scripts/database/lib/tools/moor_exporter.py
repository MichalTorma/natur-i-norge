def generate_moor(session, path):
    ''' Export CREATE query into moor file'''
    res = session.execute('SELECT sql FROM sqlite_master').fetchall()
    with open(path, 'w') as f:
        for row in res:
            if row['sql'] !=  None:
                f.write(row['sql'])
                f.write(';\n')