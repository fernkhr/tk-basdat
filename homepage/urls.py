from django.urls import path
from .views import homepage  # Import the homepage view correctly

urlpatterns = [
    path('', homepage, name='homepage'),
]
