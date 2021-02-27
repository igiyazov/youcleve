from django.contrib import admin
from rest_framework_simplejwt import views as jwt_views
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from rest_framework_simplejwt.views import (
                                            TokenObtainPairView,
                                            TokenRefreshView,
                                            )

from .yasg import urlpatterns as doc_urls

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/activity/', include('educa.apps.activity.urls')),
    path('api/', include('educa.apps.courses.urls')),
    path('api/search', include('educa.apps.search.urls')),
    path('auth/', include('djoser.urls')),
    path('auth/', include('djoser.urls.jwt')),
    # path('api/token/', jwt_views.TokenObtainPairView.as_view(), name='token_obtain_pair'),
    # path('api/token/refresh/', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),

    path('api/accounts/', include('educa.apps.authentication.urls'))
]

urlpatterns += doc_urls

# if settings.Debug:
urlpatterns += static(settings.MEDIA_URL, 
                            document_root=settings.MEDIA_ROOT)
