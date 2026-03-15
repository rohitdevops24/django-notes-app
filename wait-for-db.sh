#!/bin/sh

echo "Waiting for MySQL..."

while ! nc -z $DB_HOST $DB_PORT; do
  sleep 2
done

echo "MySQL is ready!"

python manage.py migrate

gunicorn notesapp.wsgi:application --bind 0.0.0.0:8000
