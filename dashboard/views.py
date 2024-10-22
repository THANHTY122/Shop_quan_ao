from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from .models import SanPham,LoaiSanPham, HoaDon, CTHoaDon
from .forms import LoaiSPForm
from django.http import HttpResponseRedirect
from django.contrib.auth import login as auth_login, logout as auth_logout, authenticate
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import make_password
from .models import NguoiDung
from django.contrib.auth.decorators import user_passes_test
# Create your views here.

def is_admin(user):
    return user.is_staff

@login_required
@user_passes_test(is_admin)
def dashboard(request):
    user = request.user
    return render(request, 'pages/dashboard.html')

def login(request):
    if request.user.is_authenticated:
        return redirect('dashboard')
    if request.method == "POST":
        username = request.POST.get("username").lower()
        password = request.POST.get("password")

        try:
            user = authenticate(request, username = username, password = password)
        except:
            messages.success(request,("Tài khoản không tồn tại!"))
            return HttpResponseRedirect('login')
        if user is not None:
            auth_login(request, user)
            return redirect('dashboard')
        else:
            messages.success(request,("Tài Khoản hoặc mật khẩu không chính xác!"))
    return render(request, 'pages/login.html')

@login_required
@user_passes_test(is_admin)
def product_list(request):
    data = {
        'lstProduct': SanPham.objects.filter(TrangThai__gte=0),
        # 'lstCategory' : LoaiSanPham.objects.all(),
        'lstCategory' : LoaiSanPham.objects.filter(TrangThai__gte=0),
    }
    return render(request, 'pages/product-list.html',  data)

@login_required
@user_passes_test(is_admin)
def ThemLoaiSP(request):
    form = LoaiSPForm()
    if request.method == 'POST':
        form = LoaiSPForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request,("Thêm Thành Công!"))
            return HttpResponseRedirect('ThemLoaiSP')
    
    return render(request, 'pages/add-category.html', {'form': form})



@login_required
@user_passes_test(is_admin)
def ThemSP(request):
    if request.method == "POST":
        getSP = SanPham.objects.filter(TenSP=request.POST.get('TenSP'))
        if getSP:
            messages.error(request, "Tên Sản Phẩm đã tồn tại")
            return HttpResponseRedirect('ThemSP')

        sp = SanPham()
        sp.TenSP = request.POST.get('TenSP')
        sp.DonGia = request.POST.get('DonGia')
        sp.MoTa = request.POST.get('MoTa')
        sp.NCC = request.POST.get('NCC')
        sp.SoLuong = request.POST.get('SoLuong')
        sp.TrangThai = '1'  
        sp.LoaiSP_id = request.POST.get('LoaiSP')

        if 'HinhAnh' in request.FILES:
            sp.HinhAnh = request.FILES['HinhAnh']  


        sp.save()

        messages.success(request, "Thêm sản phẩm thành công!")
        return HttpResponseRedirect('ThemSP')

    return render(request, 'pages/add-product.html', {
        'lstLoaiSP': LoaiSanPham.objects.all(),
    })

    

@login_required
@user_passes_test(is_admin)
def logout(request):
    auth_logout(request)
    messages.success(request, ('Thoát thành công'))
    return redirect('login')

@login_required
@user_passes_test(is_admin)
def detail_product(request, MaSP):
    sp = SanPham.objects.get(MaSP = MaSP)
    return render(request, 'pages/detail-product.html', {'sp': sp})

@login_required
@user_passes_test(is_admin)
def edit_product(request, MaSP):
    sp = SanPham.objects.get(MaSP = MaSP)
    category = LoaiSanPham.objects.all()
    if request.method == "POST":
        if sp.TenSP != request.POST.get('TenSP'):
            getSP = SanPham.objects.filter(TenSP = request.POST.get('TenSP'))
            if getSP:
                messages.success(request,("Tên Sản Phẩm đã tồn tại"))
                return render(request, 'pages/edit-product.html',{'sp':sp, 'loaiSP' : category})
        

        if len(request.FILES) != 0:
            
            sp.HinhAnh = request.FILES.get('HinhAnh').name
        sp.TenSP = request.POST.get('TenSP')
        sp.DonGia = request.POST.get('DonGia')
        sp.MoTa = request.POST.get('MoTa')
        sp.NCC = request.POST.get('NCC')
        sp.SoLuong = request.POST.get('SoLuong')
        sp.TrangThai = 1
        sp.LoaiSP_id = request.POST.get('LoaiSP')

        sp.save()
        messages.success(request,("Chỉnh sửa thành công!"))
        return redirect('product-list')
   
    return render(request, 'pages/edit-product.html',{'sp':sp, 'loaiSP' : category})

##########################################---------------------PRODUCT------------------------------############################################
@login_required
@user_passes_test(is_admin)
def manage_product(request, MaSP):
    sp = SanPham.objects.get(MaSP=MaSP)
    
    if request.method == "POST":
        action = request.POST.get('action')
        
        if action == 'delete':
            sp.delete()  # Xóa sản phẩm
            messages.success(request, "Sản phẩm đã bị xóa!")
            return redirect('product-list')

        elif action == 'hide':
            sp.TrangThai = 0  # Ẩn sản phẩm
            sp.save()
            messages.success(request, "Sản phẩm đã được ẩn!")
            return redirect('product-list')

    return render(request, 'pages/delete-product.html', {'sp': sp})


@login_required
@user_passes_test(is_admin)
def delete_product(request, MaSP):
    try:
        sp = SanPham.objects.get(MaSP=MaSP)
        if request.method == "POST":
            sp.delete()  # Xóa sản phẩm hoàn toàn
            messages.success(request, "Sản phẩm đã bị xóa!")
            return redirect('product-list')
    except SanPham.DoesNotExist:
        messages.error(request, "Sản phẩm không tồn tại.")
        return redirect('product-list')
    
    return render(request, 'pages/delete-product.html', {'sp': sp})



##########################################---------------------END-PRODUCT------------------------------############################################

@login_required
@user_passes_test(is_admin)
def edit_category(request, MaLoai):
    category = LoaiSanPham.objects.get(MaLoai = MaLoai)
    if request.method == "POST":

        if category.TenLoai != request.POST.get('TenLoai'):
            getCategory = LoaiSanPham.objects.filter(TenLoai = request.POST.get('TenLoai'))
            if getCategory:
                messages.success(request,("Tên Loại Sản Phẩm đã tồn tại"))
                return render(request, 'pages/edit-category.html',{'loaiSP' : category})

        


        category.TenLoai = request.POST.get('TenLoai')
        category.TrangThai = 1
        category.save()

        return redirect('product-list')
    return render(request, 'pages/edit-category.html',{'loaiSP' : category})


@login_required
@user_passes_test(is_admin)
def manage_category(request, MaLoai):
    category = LoaiSanPham.objects.get(MaLoai=MaLoai)
    
    if request.method == "POST":
        action = request.POST.get('action')
        if action == "disable":
            category.TrangThai = "0"  # Đánh dấu là đã ẩn
            category.save()
            messages.success(request, "Loại sản phẩm đã được ẩn!")
        elif action == "delete":
            category.delete()  # Xóa hoàn toàn khỏi cơ sở dữ liệu
            messages.success(request, "Loại sản phẩm đã được xóa!")
        return redirect('product-list')

    return render(request, 'pages/delete-category.html', {'category': category})



@login_required
@user_passes_test(is_admin)
def user_list(request):
    users = User.objects.all()
    return render(request, 'pages/user-list.html', {'users': users})

@login_required
@user_passes_test(is_admin)
def add_user(request):
    if request.method == "POST":
        if request.POST.get('password') != request.POST.get('con_password'):
            return redirect('add-user')
        else:
            user = User()
            user.username = request.POST.get('username')
            user.password = make_password(request.POST.get('password'))
            user.is_staff = 1
            if request.POST.getlist('is_superuser'):
                user.is_superuser = 1
            else:
                user.is_superuser = 0

            user.save()
            return HttpResponseRedirect('user-list')
        

    return render(request, 'pages/add-user.html')

@login_required
@user_passes_test(is_admin)
def profile(request, id):
    u = User.objects.get(id = id)
    p = NguoiDung.objects.filter(user_id = id)
    if p:
        return render(request, 'pages/profile.html', {'u': u, 'p' : p})
    return render(request, 'pages/profile.html', {'u': u})

@login_required
@user_passes_test(is_admin)
def edit_profile(request, id):
    u = User.objects.get(id = id)
    p = NguoiDung.objects.filter(user_id = id)
    if request.method == "POST":

        if p:
            prof = NguoiDung.objects.get(user_id = id)
        else:
            prof = NguoiDung()
            prof.user_id = u.id

        prof.DiaChi = request.POST.get('DiaChi')

        u.first_name = request.POST.get('first_name')
        u.last_name = request.POST.get('last_name')

        if request.POST.getlist('is_superuser'):
            u.is_superuser = 1
        else:
            u.is_superuser = 0

        if request.POST.get('password'):
            u. password = make_password(request.POST.get('password'))
        
        prof.save()
        u.save()
        return render(request, 'pages/edit-profile.html', {'u': u, 'p' : p})
    if p:
        return render(request, 'pages/edit-profile.html', {'u': u, 'p' : p})
    return render(request, 'pages/edit-profile.html', {'u': u})

@login_required
@user_passes_test(is_admin)
def invoice(request):
    hd = HoaDon.objects.all()
    return render(request,'pages/invoice-list.html', {"hd": hd})

@login_required
@user_passes_test(is_admin)
def detail_invoice(request, MaHD):
    ct = CTHoaDon.objects.filter(MaHD_id = MaHD)

    return render(request, 'pages/detail-invoice.html', {"ct":ct})

@login_required
@user_passes_test(is_admin)
def confirm_invoice(request, MaHD):
    hd = HoaDon.objects.get(MaHD = MaHD)
    hd.TrangThai = "Đã Xác Nhận"
    hd.MaNV = request.user.id
    hd.save()
    return HttpResponseRedirect('/dashboard/invoice-list')

