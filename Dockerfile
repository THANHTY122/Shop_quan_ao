FROM python:3.10-slim

# Cài đặt các công cụ hệ thống và các thư viện cần thiết cho mysqlclient
RUN apt-get update && \
    apt-get install -y gcc g++ python3-dev default-libmysqlclient-dev build-essential libssl-dev libffi-dev && \
    apt-get clean

WORKDIR /app

COPY requirements.txt /app/

# Cập nhật pip và setuptools để hỗ trợ cài đặt các gói mới nhất
RUN pip install --upgrade pip setuptools

# Cài đặt mysqlclient trước
RUN pip install mysqlclient

# Cài đặt các gói còn lại từ requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "Project_Clother.wsgi:application"]
