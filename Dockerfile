# FROM python:3.10-slim

# # Cài đặt các công cụ hệ thống cơ bản nếu cần
# RUN apt-get update && \
#     apt-get install -y gcc g++ python3-dev && \
#     apt-get clean

# WORKDIR /app

# RUN pip install whitenoise

# COPY requirements.txt /app/

# # Cài đặt các gói từ requirements.txt (bao gồm PyMySQL)
# RUN pip install --no-cache-dir -r requirements.txt

# COPY . /app/

# EXPOSE 8080

# # CMD ["gunicorn", "--bind", "0.0.0.0:8080", "Project_Clother.wsgi:application"]
# # CMD ["sh", "-c", "python manage.py collectstatic --noinput && gunicorn Project_Clother.wsgi:application --bind 0.0.0.0:8080"]
# CMD ["gunicorn", "Project_Clother.wsgi:application", "--bind", "0.0.0.0:8080"]












FROM python:3.10-slim

# Cài đặt các công cụ hệ thống cần thiết
RUN apt-get update && apt-get install -y --no-install-recommends gcc g++ python3-dev libpq-dev && apt-get clean

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép và cài đặt các phụ thuộc
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Sao chép mã nguồn dự án
COPY . /app/

# Thu thập các tệp tĩnh
RUN python manage.py collectstatic --noinput

# Mở cổng và cấu hình khởi chạy Gunicorn
EXPOSE 8080
CMD ["gunicorn", "Project_Clother.wsgi:application", "--bind", "0.0.0.0:8080"]
