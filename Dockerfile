FROM python:3.10-slim

# Cài đặt các công cụ hệ thống và các thư viện cần thiết cho mysqlclient
RUN apt-get update && \
    apt-get install -y gcc g++ python3-dev default-libmysqlclient-dev build-essential libssl-dev libffi-dev libmariadb-dev-compat libmariadb-dev && \
    apt-get clean

WORKDIR /app

COPY requirements.txt /app/

# Cập nhật pip và setuptools để đảm bảo hỗ trợ các gói mới nhất
RUN pip install --upgrade pip setuptools wheel

# Cài đặt mysqlclient trước để kiểm tra lỗi riêng lẻ
RUN pip install mysqlclient

# Cài đặt các gói còn lại từ requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "Project_Clother.wsgi:application"]
