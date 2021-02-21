from educa.apps.activity.views import CommentDetailView, CommentListView, add_like_course
from django.urls import path


urlpatterns = [
    path('like/', add_like_course, name='course_like'),
    path('comment/', CommentDetailView.as_view(), name='add_comment'),
    path('comments/', CommentListView.as_view(), name='all_comments'),
]
