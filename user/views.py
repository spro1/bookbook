from django.shortcuts import render

# Create your views here.
from django.shortcuts import render


# Create your views here.
def user_page(request):
    return render(request, 'user/user_page.html', {'page': 'user_page'})