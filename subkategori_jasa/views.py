from django.shortcuts import render
from django import db
from django.http import response, HttpResponseRedirect

def subkategori_jasa_user(request):
    return render(request, 'subkategori_jasa_user.html')

def profil_pekerja(request):
    return render(request, 'pekerja.html' )

def subkategori_jasa_pekerja(request):
    return render(request, 'subkategori_jasa_pekerja.html')