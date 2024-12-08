from django.urls import path
from . import views
from .views import register_pekerja,register_pengguna, user_register, user_login, user_logout

app_name = "authentication"

urlpatterns = [
    path('', views.authentication, name='authentication'),
    path('login/', views.user_login, name='user_login'),
    path('logout/', views.user_logout, name='user_logout'),
    path('register/', views.user_register, name='user_register'),  
    path('register/pengguna/', views.register_pengguna, name='register_pengguna'),  
    path('register/pekerja/', views.register_pekerja, name='register_pekerja'),  
]
