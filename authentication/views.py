from django.shortcuts import render, redirect
# from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.http import JsonResponse, HttpResponseRedirect
from django.db import IntegrityError
from .queries import *

def authentication(request):
    return render(request, 'authentication.html')

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

        # user = authenticate(request, username=no_hp, password=password)

        if check_user_exists(no_hp, 'pengguna'):
            messages.error(request, "Nomor Hp telah terdaftar. Silakan login!")
            return redirect('authentication:user_login')

        try:
            # user = User.objects.create_user(username=no_hp, password=password)
            create_user_pengguna(nama, jenis_kelamin, no_hp, password, tanggal_lahir, alamat)
            messages.success(request, "Registrasi berhasil. Silakan login!")
            return redirect('authentication:user_login')
        except IntegrityError:
            messages.error(request, "Gagal registrasi. Data tidak valid")

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
        link_foto = request.POST.get("link_foto")

        # user = authenticate(request, username=no_hp, password=password)

        if check_user_exists(no_hp, 'pekerja'):
            messages.error(request, "Nomor Hp telah terdaftar. Silakan login!")
            return redirect('authentication:user_login')

        if check_pekerja_exists(nama_bank, no_rekening):
            messages.error(request, "Pasangan nama bank dan no rekening sudah terdaftar")
            return redirect('authentication:register_pekerja')

        if check_pekerja_exists(npwp=npwp):
            messages.error(request, "NPWP telah terdaftar")
            return redirect('authentication:register_pekerja')

        try:
            # user = User.objects.create_user(username=no_hp, password=password)
            create_user_pekerja(nama, jenis_kelamin, no_hp, password, tanggal_lahir, alamat, nama_bank, no_rekening, npwp, link_foto)
            messages.success(request, "Registrasi berhasil. Silakan login!")
            return redirect('authentication:user_login')
        except IntegrityError:
            messages.error(request, "Gagal registrasi. Data tidak valid")
        user = authenticate(request, username=no_hp, password=password)

    return render(request, 'register_pekerja.html')

def user_login(request):
    if request.method == "POST":
        no_hp = request.POST.get("no_hp")
        password = request.POST.get("password")

        user = check_user_exists(no_hp, 'pengguna') or check_user_exists(no_hp, 'pekerja')
        if user:
            role = check_role(user[0])
            with connection.cursor() as cursor:
                cursor.execute(""" SELECT "nama", "pwd" FROM "USER" WHERE "nohp" = %s """, [no_hp])
                user_data = cursor.fetchone()
            if user_data and user_data[1] == password:
                request.session["user"] = {
                    # "username": user_data[0],  
                    "no_hp": no_hp,  
                    "nama": user_data[0],
                    "role": role
                }
                # messages.success(request, "Login berhasil!")
                return HttpResponseRedirect("/dashboard/")
            else:
                messages.error(request, "Nomor Hp atau password salah. Silakan coba lagi!")
        else:
            messages.error(request, "Nomor HP belum terdaftar.")

    return render(request, 'login.html')

def user_logout(request):
    # logout(request)

    if "user" in request.session:
        del request.session["user"]

    messages.success(request, "Logout berhasil!")
    return redirect('authentication:user_login')  

def get_user(request):
    if "user" not in request.session:
        return JsonResponse({"error": "Pengguna belum login"}, status=401)

    user_data = request.session["user"]
    return JsonResponse(user_data)
