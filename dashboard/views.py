from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import PenggunaForm, PekerjaForm
from authentication.models import Pengguna, Pekerja

@login_required
def dashboard(request):
    # Periksa apakah session "user" ada
    if not request.session.has_key("user"):
        return redirect('/login')  # Redirect ke halaman login jika session tidak ditemukan

    # Ambil informasi pengguna dari session
    user_session = request.session["user"]
    user_type = user_session.get("role")

    # Tentukan apakah pengguna adalah `Pengguna` atau `Pekerja`
    if user_type == "pengguna":
        try:
            profile = request.user.pengguna
            is_pengguna = True
            
        except Pengguna.DoesNotExist:
            return redirect('/login')  # Redirect jika data tidak ditemukan
    elif user_type == "pekerja":
        try:
            profile = request.user.pekerja
            is_pengguna = False
            
        except Pekerja.DoesNotExist:
            return redirect('/login')  # Redirect jika data tidak ditemukan
    else:
        return redirect('/login')  # Redirect jika tipe user tidak valid

    # Pilih form yang sesuai
    form = PenggunaForm(instance=profile) if is_pengguna else PekerjaForm(instance=profile)

    # Proses form jika metode POST
    if request.method == 'POST':
        form = PenggunaForm(request.POST, instance=profile) if is_pengguna else PekerjaForm(request.POST, instance=profile)
        if form.is_valid():
            form.save()
            return redirect('dashboard:dashboard')  # Redirect ke dashboard setelah berhasil update

    # Kirim data ke template
    return render(request, 'dashboard.html', {
        'form': form,
        'profile': profile,
        'is_pengguna': is_pengguna,
        'user': user_session,
    })
