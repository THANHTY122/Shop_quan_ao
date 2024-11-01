FROM python:3.10-slim

# Cài đặt các thư viện hệ thống cần thiết cho mysqlclient
RUN apt-get update && \
    apt-get install -y gcc g++ python3-dev default-libmysqlclient-dev && \
    apt-get clean

WORKDIR /app

COPY requirements.txt /app/

# Cài đặt mysqlclient
RUN pip install mysqlclient

# Cài đặt các gói còn lại từ requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "Project_Clother.wsgi:application"]
