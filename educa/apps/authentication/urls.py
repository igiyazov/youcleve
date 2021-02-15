from django.urls import path
from rest_framework_simplejwt.views import TokenRefreshView
from .views import (CustomUserListView,
                    CustomUserDetailView,
                    CustomUserLogoutView, MyObtainTokenPairView,
                    )

urlpatterns = [
    path('users/', CustomUserListView.as_view(), name='user_list'),
    path('user/<int:pk>', CustomUserDetailView.as_view(), name='user_detail'),
    path('user/create', CustomUserDetailView.as_view(), name='user_detail'),
    path('user/logout', CustomUserLogoutView.as_view(), name='auth_logout'),
    path('user/login/', MyObtainTokenPairView.as_view(), name='token_obtain_pair'),
    path('user/login/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]
