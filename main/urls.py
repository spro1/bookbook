from django.urls import path
from . import views

urlpatterns = [
    path('', views.main_page, name='main_page'),
    path('search', views.search_page, name='search_page'),
    #path('/info', views.introduce_page),
]