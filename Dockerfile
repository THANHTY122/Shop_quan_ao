FROM python:3.10-slim

# Cài đặt các công cụ build và thư viện cần thiết
RUN apt-get update && \
    apt-get install -y gcc g++ python3-dev libmariadb-dev && \
    apt-get clean

WORKDIR /app

COPY requirements.txt /app/

# Cài đặt mysqlclient trước các gói khác
RUN pip install mysqlclient

# Cài đặt các gói trong requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "Project_Clother.wsgi:application"]
