FROM python:3.10-slim

# Cài đặt các công cụ hệ thống cơ bản nếu cần
RUN apt-get update && \
    apt-get install -y gcc g++ python3-dev && \
    apt-get clean

WORKDIR /app

COPY requirements.txt /app/

# Cài đặt các gói từ requirements.txt (bao gồm PyMySQL)
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "Project_Clother.wsgi:application"]
