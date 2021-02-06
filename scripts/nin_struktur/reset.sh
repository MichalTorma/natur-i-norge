#$/bin/bash
find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
find . -path "*/migrations/*.pyc"  -delete
rm db.sqlite3
./manage.py makemigrations
./manage.py migrate
./manage.py createsuperuser
./manage.py runserver 8080