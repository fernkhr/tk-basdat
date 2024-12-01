from django.shortcuts import render, redirect
# from django.contrib.auth.decorators import login_required
from .forms import PenggunaForm, PekerjaForm
from .queries import get_pengguna_data, get_pekerja_data, update_pengguna_data, update_pekerja_data
from django.http import HttpResponseRedirect

# @login_required
def dashboard(request):
    if not request.session.has_key("user"):
        return HttpResponseRedirect('/login')
    else :
        user_session = request.session["user"]
        role = user_session.get("role")

        if role == "pengguna":
            data_user = get_pengguna_data(user_session["no_hp"])
            if not data_user:
                return HttpResponseRedirect('/login')
        elif role == "pekerja":
            data_user = get_pekerja_data(user_session["no_hp"])
            if not data_user:
                return HttpResponseRedirect('/login')
        else:
            return HttpResponseRedirect('/login')
    
        # if is_pengguna:
        #     form = PenggunaForm(instance=pengguna_data)
        # else:
        #     form = PekerjaForm(instance=pekerja_data)


        # if request.method == 'POST':
        #     if is_pengguna:
        #         form = PenggunaForm(request.POST, instance=pengguna_data)
        #     else:
        #         form = PekerjaForm(request.POST, instance=pekerja_data)

        #     if form.is_valid():
        #         if is_pengguna:
        #             update_pengguna_data(form.cleaned_data, user_session["username"])
        #         else:
        #             update_pekerja_data(form.cleaned_data, user_session["username"])
        #         return redirect('dashboard:dashboard') 

        return render(request, 'dashboard.html', {
            # 'form': form,
            'profile': data_user,
            'role': role,
            'user': user_session,
            'authenticated': True
        })

def update_dashboard(request):
    if not request.session.has_key("user"):
        return HttpResponseRedirect('/login')
    
    user_session = request.session["user"]
    role = user_session.get("role")
    no_hp = user_session["no_hp"]

    if role == "pengguna":
        data_user = get_pengguna_data(no_hp)
        form = PenggunaForm(initial=data_user)
    elif role == "pekerja":
        data_user = get_pekerja_data(no_hp)
        form = PekerjaForm(initial=data_user)
    else:
        return HttpResponseRedirect('/login')

    if request.method == "POST":
        if role == "pengguna":
            form = PenggunaForm(request.POST)
            if form.is_valid():
                update_pengguna_data(form.cleaned_data, no_hp)
                return redirect('dashboard:dashboard')
        elif role == "pekerja":
            form = PekerjaForm(request.POST)
            if form.is_valid():
                update_pekerja_data(form.cleaned_data, no_hp)
                return redirect('dashboard:dashboard')

    return render(request, 'update_dashboard.html', {
        'form': form,
        'role': role
    })
