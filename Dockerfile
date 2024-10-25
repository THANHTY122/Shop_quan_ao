FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y gcc g++ python3-dev && \
    apt-get clean

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8080

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
