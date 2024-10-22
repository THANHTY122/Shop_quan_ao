from django.urls import path, include
from django.contrib.auth import views as auth_views
from . import views
from rest_framework.routers import DefaultRouter
from .views import LoaiSanPhamViewSet, SanPhamViewSet, KhachHangViewSet, HoaDonViewSet, CTHoaDonViewSet, ListSanPham

from django.conf import settings
from django.conf.urls.static import static

router = DefaultRouter()
router.register(r'loaisanpham', LoaiSanPhamViewSet)
router.register(r'sanpham', SanPhamViewSet)
router.register(r'khachhang', KhachHangViewSet)
router.register(r'hoadon', HoaDonViewSet)
router.register(r'cthoadon', CTHoaDonViewSet)

urlpatterns = [
    path('',views.index,name='index'),
    path('product',views.product,name='product'), 
    path('home/',views.home,name='home'), 
    path('SignIn/',views.Sign_In,name='Dang_Nhap'), 
    path('signup/', views.SignUp, name='signup'), 

    path('api/LoaiSanPhamViewSet/', views.ListLoaiSanPham.as_view(), name='loaisanpham-list'),
    path('api/sanpham/', ListSanPham.as_view(), name='list_sanpham'),
    path('products/<int:ml>/', views.DSSPTheoLoai, name='DSSPTheoLoai'),
    path('product_detail/<int:ml>/', views.product_detail, name='product_detail'),
    path('search/', views.search_products, name='search_products'),
    # --------- #
    path('cart/', views.cart, name='cart'),
    path('addToCart/<int:MaSP>', views.AddToCart, name = 'addToCart'),
    path('cart/remove/<int:product_id>/', views.remove_from_cart, name='remove_from_cart'),
    path('cart/AddToInvoice', views.AddToInvoice, name = 'AddToInvoice'),
    path('cart/DeleteAllCart', views.DeleteAllCart, name = 'DeleteAllCart'),
    path('hoa-don',views.hoa_don, name = 'hoa_don'),
    path('detail-invoice/<int:MaHD>', views.detail_invoice, name = 'detail-invoice'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
] 

