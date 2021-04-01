from educa.apps.authentication.serializers import MyTokenRefreshSerializer
from django.urls import path
from rest_framework_simplejwt.views import TokenRefreshView
from .views import (CustomUserCreateView, CustomUserListView,
                    CustomUserDetailView,
                    CustomUserLogoutView, 
                    MyObtainTokenPairView, 
                    MyRefreshTokenView, 
                    ProfileDetailView, 
                    ProfileListView, 
                    get_profile_courses, 
                    get_profile_info, is_profile_follow, 
                    profile_follow, profile_unfollow, 
                    )

urlpatterns = [
    path('users', CustomUserListView.as_view(), name='user_list'),
    path('user/<int:pk>', CustomUserDetailView.as_view(), name='user_detail'),
    path('user/create', CustomUserCreateView.as_view(), name='user_detail'),
    path('user/logout', CustomUserLogoutView.as_view(), name='auth_logout'),
    path('user/login', MyObtainTokenPairView.as_view(), name='token_obtain_pair'),
    path('user/login/refresh', MyRefreshTokenView.as_view(), name='token_refresh'),
    path('profile/follow', profile_follow, name='profile_follow'),
    path('profile/unfollow', profile_unfollow, name='profile_unfollow'),
    path('profile/isfollow', is_profile_follow, name='is_profile_follow'),
    path('profile/<int:pk>', ProfileDetailView.as_view(), name='profile_detail'),
    path('profile/<int:pk>/courses', get_profile_courses, name='profile_courses'),
    path('profile/<int:pk>/<slug:param>', get_profile_info, name='profile_info'),
    path('profiles', ProfileListView.as_view(), name='profile_list')
]
