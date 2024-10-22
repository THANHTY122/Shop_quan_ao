from rest_framework import serializers
from dashboard.models import LoaiSanPham, SanPham, NguoiDung, HoaDon, CTHoaDon

class LoaiSanPhamSerializer(serializers.ModelSerializer):
    class Meta:
        model = LoaiSanPham
        fields = '__all__'

class SanPhamSerializer(serializers.ModelSerializer):
    class Meta:
        model = SanPham
        fields = '__all__'

class NguoiDungSerializer(serializers.ModelSerializer):
    class Meta:
        model = NguoiDung
        fields = '__all__'

class HoaDonSerializer(serializers.ModelSerializer):
    class Meta:
        model = HoaDon
        fields = '__all__'

class CTHoaDonSerializer(serializers.ModelSerializer):
    class Meta:
        model = CTHoaDon
        fields = '__all__'