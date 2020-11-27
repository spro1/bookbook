from django.shortcuts import render

# Create your views here.
from django.shortcuts import render

# Create your views here.
def post_page(request):
    return render(request, 'post/post_page.html', {'page': 'post_page'})