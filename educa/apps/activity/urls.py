from educa.apps.activity.views import CommentDetailView, CommentListView, add_like_course, is_liked_course
from django.urls import path


urlpatterns = [
    path('like', add_like_course, name='course_like'),
    path('isliked', is_liked_course, name='is_liked'),
    path('comment', CommentDetailView.as_view(), name='add_comment'),
    path('comments', CommentListView.as_view(), name='all_comments'),
]
