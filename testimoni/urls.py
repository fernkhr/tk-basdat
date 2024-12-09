from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='testimoni_index'),
    path('create/', views.create_testimoni, name='create_testimoni'),
]
