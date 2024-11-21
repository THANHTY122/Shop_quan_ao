#!/bin/bash

# Chạy lệnh migrate để áp dụng các thay đổi cơ sở dữ liệu
python manage.py migrate --noinput

# Thu thập các file tĩnh
python manage.py collectstatic --noinput

# Chạy ứng dụng Django trên cổng mà OpenShift cung cấp
python manage.py runserver 0.0.0.0:${PORT}
