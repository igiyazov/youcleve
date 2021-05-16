from rest_framework.decorators import api_view
from educa.apps.activity.views import CommentDetailView, CommentListView, add_like_course, add_view, is_liked_course, SubscriptionDetailView
from django.urls import path


urlpatterns = [
    path('like', add_like_course, name='course_like'),
    path('isliked', is_liked_course, name='is_liked'),
    path('comment', CommentDetailView.as_view(), name='add_comment'),
    path('comments', CommentListView.as_view(), name='all_comments'),
    path('subscription/profile/<int:user_id>', SubscriptionDetailView.as_view(), name='subscribe'),
    path('subscription/profile', SubscriptionDetailView.as_view(), name='subscribe_profile'),
    path('view', add_view)
]
