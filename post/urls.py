from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_page, name='post_page'),
    # path('/post/<int:post_id>', views.post_view),
    # path('/post/update/<int:post_id>', views.post_update),
    # path('/post/delete/<int:post_id>', views.post_delete),

]