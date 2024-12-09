from django.shortcuts import render
from django import db
from django.http import response, HttpResponseRedirect

def homepage(request):
    return render(request, 'homepage.html')
