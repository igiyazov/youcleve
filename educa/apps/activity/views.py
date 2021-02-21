from django.http.response import HttpResponse
from rest_framework.response import Response
from rest_framework import response, serializers
from educa.apps.courses.models import Course
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from .services import add_comment, add_like, all_comments, all_likes_count
from educa.apps.authentication.models import CustomUser
from rest_framework import status
from .serilizers import CommentSerializer

@api_view(['POST'])
def add_like_course(request):
    user_id = request.POST.get('user_id', None)
    course_id = request.POST.get('course_id', None)
    user = CustomUser.objects.get(pk=user_id)
    course = Course.filtered.get(pk=course_id)
    add_like(course, user)
    return Response({'status':'ok'}, status=status.HTTP_200_OK)


class CommentListView(APIView):
    def get(self, request):
        course_id = request.GET.get('course_id', None)
        course = Course.filtered.get(pk=course_id)
        comments = all_comments(course)
        serializer = CommentSerializer(comments, many=True)
        return Response(serializer.data)

class CommentDetailView(APIView):
    def post(self, request):
        course_id = request.POST.get('course_id', None)
        user_id = request.POST.get('user_id', None)
        text = request.POST.get('text', None)
        course = Course.filtered.get(pk=course_id)
        user = CustomUser.objects.get(pk=user_id)
        add_comment(course, user, text)
        return Response({'status':'ok'}, status = status.HTTP_200_OK)


# @api_view(['POST'])
# def add_like_course(request):
#     user_id = request.POST.get('user_id', None)
#     comment_id = request.POST.get('comment_id', None)
#     user = CustomUser.objects.get(pk=user_id)
#     comment = Comment.filtered.get(pk=comment_id)
#     add_like(course, user)
#     return Response({'status':'ok'}, status=status.HTTP_200_OK)



