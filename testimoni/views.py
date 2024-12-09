from django.shortcuts import render

def index(request):
    # TODO: Fetch testimoni data from the database
    return render(request, 'testimoni/index.html')

def create_testimoni(request):
    # TODO: Handle form submission for creating a testimoni
    return render(request, 'testimoni/create.html')
