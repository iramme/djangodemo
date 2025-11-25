# Dockerfile
FROM python:3.11-slim

# Variables d'environnement pour Django
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Installer les dépendances
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copier le projet
COPY . .

# Collecter les fichiers statiques
RUN python manage.py collectstatic --noinput

# Exposer le port
EXPOSE 8000

# Appliquer les migrations et lancer Gunicorn
CMD python manage.py migrate --noinput && gunicorn myproject.wsgi:application --bind 0.0.0.0:8000
