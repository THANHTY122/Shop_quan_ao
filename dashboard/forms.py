from django import forms
from .models import LoaiSanPham
from .models import SanPham

class LoaiSPForm(forms.Form):
    
    TenLoai = forms.CharField()

    def clean_TenLoai(self):
        TenLoai = self.cleaned_data['TenLoai']

        try:
            LoaiSanPham.objects.get(TenLoai = TenLoai)
        except LoaiSanPham.DoesNotExist:
            return TenLoai
        raise forms.ValidationError("Loại đã tồn tại")
    
    def save(self):
        LoaiSanPham.objects.create(TenLoai = self.cleaned_data['TenLoai'], TrangThai = 1)

class SanPhamForm(forms.Form):
    TenSP = forms.CharField()
    DonGia = forms.IntegerField()
    HinhAnh = forms.ImageField()
    MoTa = forms.TextInput()
    NCC = forms.CharField()
    SoLuong = forms.IntegerField()
    
    def clean_TenSP(self):
        TenSP = self.cleaned_data['TenSP']

        try:
            SanPham.objects.get(TenSP = TenSP)
        except SanPham.DoesNotExist:
            return TenSP
        raise forms.ValidationError("Tên Sản Phẩm đã tồn tại")
    
    def save(self):
        SanPham.objects.create(TenSP = self.cleaned_data['TenTenSPLoai'],DonGia = self.DonGia,MoTa = self.MoTa, NCC = self.NCC, SoLuong = self.SoLuong, TrangThai = 1,HinhAnh = self.HinhAnh)