FROM python:3.9

WORKDIR /app

COPY requirements.txt .

RUN apt-get update \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && pip install --no-cache-dir mysqlclient \
    && pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["gunicorn", "notesapp.wsgi:application", "--bind", "0.0.0.0:8000"]
