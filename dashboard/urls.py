# urls.py
from django.urls import path
from . import views

app_name = "dashboard"

urlpatterns = [
    path('', views.dashboard, name='dashboard'),
    path('update-dashboard/', views.update_dashboard, name='update_dashboard'),
]
