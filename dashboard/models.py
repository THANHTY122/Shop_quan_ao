from django.db import models
from django.conf import settings

from django.contrib.auth.models import User

# Loại Sản Phẩm, Sản Phẩm, Users, Profiles, Hoá Đơn, Chi Tiết Hoá Đơn, 


class LoaiSanPham(models.Model):
    MaLoai = models.AutoField(primary_key=True)
    TenLoai = models.CharField(max_length=100)
    TrangThai = models.SmallIntegerField(default=1)  # 1: Hoạt động, 0: Đã ẩn

        
class NguoiDung(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    DiaChi = models.CharField(max_length=255)

    
class SanPham(models.Model):
    MaSP = models.AutoField(primary_key=True)
    TenSP = models.CharField(max_length=100)
    DonGia = models.PositiveIntegerField()
    HinhAnh = models.ImageField(upload_to='images/', blank=True, null=True)
    MoTa = models.TextField(max_length=255)
    NCC = models.CharField(max_length=100)
    SoLuong = models.IntegerField()
    LoaiSP = models.ForeignKey(LoaiSanPham, on_delete=models.CASCADE)
    # TrangThai = models.CharField(max_length=100)
    TrangThai = models.SmallIntegerField(default=1)



class HoaDon(models.Model):
    MaHD = models.AutoField(primary_key=True)
    NgayDat = models.DateField()
    TrangThai = models.CharField(max_length=100)
    NgayGiao = models.DateField(null=True)
    DiaChiGiao = models.CharField(max_length=255)
    SDT = models.CharField(max_length=10)
    MaNV = models.IntegerField(null=True)
    Tong = models.BigIntegerField(null = True)

class CTHoaDon(models.Model):
    MaHD = models.ForeignKey(HoaDon, on_delete=models.CASCADE)
    MaSP = models.ForeignKey(SanPham, on_delete=models.CASCADE)
    TenSP = models.CharField(max_length=100)
    SoLuong = models.IntegerField()
    DonGia = models.PositiveIntegerField()