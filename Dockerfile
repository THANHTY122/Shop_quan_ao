# Sử dụng image Python cơ bản
FROM python:3.10-slim

# Cài đặt các công cụ build bổ sung
RUN apt-get update && \
    apt-get install -y gcc g++ python3-dev && \
    apt-get clean

# Đặt thư mục làm việc cho ứng dụng Django
WORKDIR /app

# Sao chép tệp requirements.txt vào thư mục /app
COPY requirements.txt /app/

# Cài đặt các gói phụ thuộc trong requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Sao chép toàn bộ mã nguồn dự án vào container
COPY . /app/

# Mở cổng 8000 cho ứng dụng Django
EXPOSE 8000

# Chạy lệnh để khởi động server Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
