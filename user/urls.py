from django.urls import path
from . import views

urlpatterns = [
    path('', views.user_page, name='user_page'),

    #path('/info', views.introduce_page),
]