from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.response import Response
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
import datetime
from django.contrib import messages
from django.utils.translation import gettext_lazy as _

# Import models và serializers
from dashboard.models import LoaiSanPham, SanPham, NguoiDung, HoaDon, CTHoaDon
from .serializers import LoaiSanPhamSerializer, SanPhamSerializer, NguoiDungSerializer, HoaDonSerializer, CTHoaDonSerializer

# --------------------------- API Views --------------------------- #

class LoaiSanPhamViewSet(viewsets.ModelViewSet):
    queryset = LoaiSanPham.objects.all()
    serializer_class = LoaiSanPhamSerializer

class ListLoaiSanPham(APIView):
    def get(self, request, format=None):
        loai_san_phams = LoaiSanPham.objects.all()
        serializer = LoaiSanPhamSerializer(loai_san_phams, many=True)
        return Response(serializer.data)

class ListSanPham(APIView):
    def get(self, request, format=None):
        san_phams = SanPham.objects.all()
        serializer = SanPhamSerializer(san_phams, many=True)
        return Response(serializer.data)

class SanPhamViewSet(viewsets.ModelViewSet):
    queryset = SanPham.objects.all()
    serializer_class = SanPhamSerializer

class KhachHangViewSet(viewsets.ModelViewSet):
    queryset = NguoiDung.objects.all()
    serializer_class = NguoiDungSerializer

class HoaDonViewSet(viewsets.ModelViewSet):
    queryset = HoaDon.objects.all()
    serializer_class = HoaDonSerializer

class CTHoaDonViewSet(viewsets.ModelViewSet):
    queryset = CTHoaDon.objects.all()
    serializer_class = CTHoaDonSerializer

# --------------------------- User Views --------------------------- #

def index(request):
    loaisanpham = LoaiSanPham.objects.filter(TrangThai=1)
    sanpham = SanPham.objects.all()
    return render(request, 'page/home.html', {'loaisanpham': loaisanpham, 'sanpham': sanpham})

def home(request):
    return index(request)

def product(request):
    loaisanpham = LoaiSanPham.objects.filter(TrangThai=1)
    sanpham = SanPham.objects.all()
    return render(request, 'page/product.html', {'loaisanpham': loaisanpham, 'sanpham': sanpham})

def product_detail(request, ml):
    sp = SanPham.objects.get(MaSP=ml)
    dssp = SanPham.objects.filter(LoaiSP_id=sp.LoaiSP_id)
    loaisanpham = LoaiSanPham.objects.all()
    return render(request, 'page/product_detail.html', {
        'sanpham': dssp,
        'loaisanpham': loaisanpham,
        'single_product': sp,
    })

def search_products(request):
    search_query = request.GET.get('search_query', '')
    products = SanPham.objects.filter(TenSP__icontains=search_query)
    loaisanpham = LoaiSanPham.objects.all()
    return render(request, 'page/product-search.html', {
        'products': products,
        'loaisanpham': loaisanpham,
        'search_query': search_query,
    })

def hoa_don(request):
    if request.method == "GET":
        SDT = request.GET.get('SDT')
        hd = HoaDon.objects.filter(SDT=SDT)
        return render(request, 'page/Invoice.html', {"hd": hd})
    return render(request, 'page/Invoice.html')

def detail_invoice(request, MaHD):
    ct = CTHoaDon.objects.filter(MaHD_id=MaHD)
    return render(request, 'page/detail_invoice.html', {"ct": ct})

def Sign_In(request):
    return render(request, 'page/SignIn.html')

# def SignUp(request):
#     if request.method == 'POST':
#         form = UserCreationForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('Dang_Nhap')  # Redirect sau khi đăng ký thành công
#     else:
#         form = UserCreationForm()
#     return render(request, 'page/signup.html', {'form': form})

def SignUp(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            # Kiểm tra xem email đã tồn tại hay chưa
            email = form.cleaned_data.get('email')
            if NguoiDung.objects.filter(email=email).exists():
                messages.error(request, _('Email đã được sử dụng. Vui lòng chọn email khác.'))
                return render(request, 'page/signup.html', {'form': form})

            form.save()
            messages.success(request, _('Đăng ký thành công! Bạn có thể đăng nhập ngay.'))
            return redirect('account_login') 
    else:
        form = UserCreationForm()
    
    return render(request, 'page/signup.html', {'form': form})


# --------------------------- Cart Views --------------------------- #

def cart(request):
    loaisanpham = LoaiSanPham.objects.filter(TrangThai=1)
    cart = request.session.get('cart', [])
    
    # Tính tổng tiền
    total_amount = sum(item.get('TongSP', 0) for item in cart)
    
    return render(request, 'page/Cart.html', {
        "cart": cart, 
        "loaisanpham": loaisanpham,
        "total_amount": total_amount  
    })


@login_required
def AddToCart(request, MaSP):
    sp = SanPham.objects.get(MaSP=MaSP)
    cart = request.session.get('cart', [])
    inCart = False

    for item in cart:
        if item['MaSP'] == sp.MaSP:
            item['SoLuong'] += 1
            item['TongSP'] += sp.DonGia
            inCart = True
            break

    if not inCart:
        cart.append({
            'MaSP': sp.MaSP,
            'HinhAnh': sp.HinhAnh.url,
            'DonGia': sp.DonGia,
            'SoLuong': 1,
            'TenSP': sp.TenSP,
            'TongSP': sp.DonGia,
        })

    request.session['cart'] = cart
    next_url = request.GET.get('next', '/cart')
    return redirect(next_url)

def remove_from_cart(request, product_id):
    # Chuyển đổi product_id sang kiểu số nguyên nếu nó là số
    product_id = int(product_id)

    # Lấy giỏ hàng từ session (là một danh sách)
    cart = request.session.get('cart', [])

    # Lọc bỏ sản phẩm có MaSP trùng với product_id
    cart = [item for item in cart if item['MaSP'] != product_id]

    # Lưu giỏ hàng mới vào session
    request.session['cart'] = cart

    # Chuyển hướng lại trang giỏ hàng sau khi xóa
    return redirect('cart')

def AddToInvoice(request):
    if request.method == "POST":
        cart = request.session.get('cart', [])
        hd = HoaDon(
            NgayDat=datetime.date.today(),
            TrangThai="Đang Chờ Xử Lí",
            DiaChiGiao=request.POST.get('DiaChiGiao'),
            SDT=request.POST.get('SDT'),
        )
        hd.save()

        tong = sum(s.get('TongSP') for s in cart)

        for s in cart:
            CT = CTHoaDon(
                TenSP=s.get('TenSP'),
                SoLuong=s.get('SoLuong'),
                DonGia=s.get('DonGia'),
                MaSP_id=s.get('MaSP'),
                MaHD_id=hd.MaHD,
            )
            CT.save()

        hd.Tong = tong
        hd.save()
        del request.session['cart']
        return redirect('cart')

def DeleteAllCart(request):
    del request.session['cart']
    return redirect('cart')

# --------------------------- Additional Views --------------------------- #

def DSSPTheoLoai(request, ml):
    loai_san_pham = LoaiSanPham.objects.filter(MaLoai=ml, TrangThai="1").first()  # Chỉ lấy loại sản phẩm đang hiển thị
    dssp = SanPham.objects.filter(LoaiSP_id=ml)
    loaisanpham = LoaiSanPham.objects.filter(TrangThai=1)  # Chỉ lấy loại sản phẩm đang hiển thị
    data = {
        'sanpham': dssp,
        'loaisanpham': loaisanpham,
        'loai_san_pham': loai_san_pham,
    }
    return render(request, 'page/product.html', data)


