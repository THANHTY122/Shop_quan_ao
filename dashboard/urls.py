from django.shortcuts import render

# Create your views here.
from django.urls import path
from . import views # call to url_shortener/views.py

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.dashboard, name='dashboard'),
    path('login', views.login, name = 'login'),
    path('product-list', views.product_list, name='product-list'),
    path('ThemLoaiSP', views.ThemLoaiSP, name = 'ThemLoaiSP'),
    path('ThemSP', views.ThemSP, name = 'ThemSP'),
    path('logout', views.logout, name = 'logout'),
    path('detail-product/<int:MaSP>/', views.detail_product, name = 'detail-product'),
    path('edit-product/<int:MaSP>', views.edit_product, name = 'edit-product'),
    path('delete-product/<int:MaSP>', views.manage_product, name = 'delete-product'),
    path('edit-category/<int:MaLoai>', views.edit_category, name = 'edit_category'),

    # path('delete-category/<int:MaLoai>', views.manage_category, name = 'hide_category'),
    path('delete-category/<int:MaLoai>/', views.manage_category, name='delete-category'),

    path('user-list', views.user_list, name= 'user-list'),
    path('add-user', views.add_user, name = 'add-user'),
    path('profile/<int:id>', views.profile, name = 'profile'),
    path('edit-profile/<int:id>', views.edit_profile, name = 'edit-profile'),
    path('invoice-list', views.invoice, name = 'invoice-list'),
    path('detail-invoice/<int:MaHD>', views.detail_invoice, name = 'detail-invoice'),
    path('confirm-invoice/<int:MaHD>', views.confirm_invoice, name = 'confirm-invoice')
]




