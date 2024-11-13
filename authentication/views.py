from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib import messages
from .models import Pengguna, Pekerja
from django.db import IntegrityError
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseRedirect

# View untuk login
def user_login(request):
    if request.method == "POST":
        no_hp = request.POST.get("no_hp")
        password = request.POST.get("password")

        # Autentikasi pengguna berdasarkan no_hp dan password
        user = authenticate(request, username=no_hp, password=password)
        
        if user is not None:
            login(request, user)
            messages.success(request, "Login berhasil!")
            return redirect('homepage')  # Redirect ke homepage setelah login sukses
        else:
            messages.error(request, "Nomor Hp atau password salah. Silakan coba lagi!")
    
    return render(request, 'login.html')

# View untuk logout
def user_logout(request):
    logout(request)
    messages.success(request, "Logout berhasil!")
    return redirect('authentication:user_login')  # Redirect ke halaman login setelah logout

def user_register(request):
    if request.method == "POST":
        role = request.POST.get("role")
        if role == 'Pengguna':
            return redirect('authentication:register_pengguna')
        elif role == 'Pekerja':
            return redirect('authentication:register_pekerja')
    return render(request, 'register_choice.html')

def register_pengguna(request):
    if request.method == "POST":
        nama = request.POST.get("nama")
        password = request.POST.get("password")
        jenis_kelamin = request.POST.get("jenis_kelamin")
        no_hp = request.POST.get("no_hp")
        tanggal_lahir = request.POST.get("tanggal_lahir")
        alamat = request.POST.get("alamat")

        # Validasi nomor HP yang sudah terdaftar
        if User.objects.filter(username=no_hp).exists():
            messages.error(request, "Nomor HP telah terdaftar. Silakan login.")
            return redirect('authentication:user_login')

        try:
            # Membuat user baru
            user = User.objects.create_user(username=no_hp, password=password)
            Pengguna.objects.create(
                user=user,
                nama=nama,
                jenis_kelamin=jenis_kelamin,
                no_hp=no_hp,
                tanggal_lahir=tanggal_lahir,
                alamat=alamat
            )
            messages.success(request, "Registrasi berhasil. Silakan login.")
            return redirect('authentication:user_login')
        except IntegrityError:
            messages.error(request, "Gagal registrasi. Data tidak valid.")

    return render(request, 'register_pengguna.html')

def register_pekerja(request):
    if request.method == "POST":
        nama = request.POST.get("nama")
        password = request.POST.get("password")
        jenis_kelamin = request.POST.get("jenis_kelamin")
        no_hp = request.POST.get("no_hp")
        tanggal_lahir = request.POST.get("tanggal_lahir")
        alamat = request.POST.get("alamat")
        nama_bank = request.POST.get("nama_bank")
        no_rekening = request.POST.get("no_rekening")
        npwp = request.POST.get("npwp")
        url_foto = request.POST.get("url_foto")

        # Validasi nomor HP yang sudah terdaftar
        if User.objects.filter(username=no_hp).exists():
            messages.error(request, "Nomor HP telah terdaftar. Silakan login.")
            return redirect('authentication:user_login')

        # Validasi pasangan nama bank dan no rekening yang sudah ada
        if Pekerja.objects.filter(nama_bank=nama_bank, no_rekening=no_rekening).exists():
            messages.error(request, "Pasangan nama bank dan no rekening sudah terdaftar.")
            return redirect('authentication:user_register')
            
        # Validasi NPWP yang sudah terdaftar
        if Pekerja.objects.filter(npwp=npwp).exists():
            messages.error(request, "NPWP telah terdaftar.")
            return redirect('authentication:user_register')

        try:
            # Membuat user baru
            user = User.objects.create_user(username=no_hp, password=password)
            Pekerja.objects.create(
                user=user,
                nama=nama,
                jenis_kelamin=jenis_kelamin,
                no_hp=no_hp,
                tanggal_lahir=tanggal_lahir,
                alamat=alamat,
                nama_bank=nama_bank,
                no_rekening=no_rekening,
                npwp=npwp,
                url_foto=url_foto
            )
            messages.success(request, "Registrasi berhasil. Silakan login.")
            return redirect('authentication:user_login')
        except IntegrityError:
            messages.error(request, "Gagal registrasi. Data tidak valid.")

    return render(request, 'register_pekerja.html')
