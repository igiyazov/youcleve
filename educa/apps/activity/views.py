from django.http.response import HttpResponse
from rest_framework.response import Response
from rest_framework import response, serializers
from educa.apps.courses.models import Course, Lesson
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from .services import add_comment, add_or_remove_like, all_comments, all_likes_count, is_liked
from educa.apps.authentication.models import CustomUser
from rest_framework import status
from .serilizers import CommentSerializer, SubscriptionSerializer
from django.core.exceptions import ObjectDoesNotExist
from .models import Subscription, ViewCourse, ViewLesson

@api_view(['POST'])
def add_like_course(request):
    user_id = request.data.get('user_id', None)
    course_id = request.data.get('course_id', None)
    try:
        user = CustomUser.objects.get(pk=user_id)
    except ObjectDoesNotExist:
        return Response({'detail': 'User does not exist'}, status=status.HTTP_404_NOT_FOUND)
    
    try:
        course = Course.filtered.get(pk=course_id)
    except ObjectDoesNotExist:
        return Response({'detail': 'Course does not exist'}, status=status.HTTP_404_NOT_FOUND)
    
    course.likes = all_likes_count(course) + 1
    course.save()
    if add_or_remove_like(course, user):
        return Response({'result':'liked'}, status=status.HTTP_200_OK)
    return Response({'result':'unliked'}, status=status.HTTP_200_OK)

@api_view(['GET'])
def is_liked_course(request):
    # breakpoint()
    user_id = request.GET.get('user_id', None)
    course_id = request.GET.get('course_id', None)
    user = CustomUser.objects.get(pk=user_id)
    course = Course.filtered.get(pk=course_id)
    if is_liked(course, user):
        return Response({'result':'liked'}, status=status.HTTP_200_OK)
    return Response({'result':'notliked'}, status=status.HTTP_200_OK)


class CommentListView(APIView):
    def get(self, request):
        course_id = request.GET.get('course_id', None)
        course = Course.filtered.get(pk=course_id)
        comments = all_comments(course)
        serializer = CommentSerializer(comments, many=True)
        return Response(serializer.data)

class CommentDetailView(APIView):
    def post(self, request):
        course_id = request.data.get('course_id', None)
        user_id = request.data.get('user_id', None)
        text = request.data.get('text', None)
        course = Course.filtered.get(pk=course_id)
        user = CustomUser.objects.get(pk=user_id)
        add_comment(course, user, text)
        return Response({'status':'ok'}, status = status.HTTP_200_OK)


class SubscriptionDetailView(APIView):
    def get(self, request, user_id):

        try:
            user = CustomUser.objects.get(pk=user_id)
        except Exception:
            return Response({'detail': 'user not exist'})
        
        if user.subscription.exists():
            serialized = SubscriptionSerializer(user.subscription.all()[:1].get())
            return Response({'detail':'subed', 'result':serialized.data})
        else:
            return Response({'detail':'notsubed'})

    def post(self, request):
        user_id = request.data.get('user')
        try:
            user = CustomUser.objects.get(pk=user_id)
        except Exception:
            return Response({'detail': 'user not exist'})
        
        if user.subscription.exists():
            return Response({'detail':'alsubed'})
        serilized = SubscriptionSerializer(data=request.data)
        
        if serilized.is_valid():
            serilized.save()
            return Response({'detail':'ok'}, status=status.HTTP_201_CREATED)
        
        return Response({'detail':'error', 'result':serilized.errors})
        


@api_view(['POST'])
def add_view(request):
    course_id = request.data.get('course_id', None)
    lesson_id = request.data.get('lesson_id', None)
    user_id = request.data.get('user_id', None)
    course = Course.objects.get(id=course_id)
    lesson = Lesson.objects.get(id=lesson_id)
    user = CustomUser.objects.get(id=user_id)
    obj, created = ViewCourse.objects.get_or_create(user=user, course=course)
    view_lesson, les_created = ViewLesson.objects.get_or_create(lesson = lesson, view_course=obj)
    if les_created:
        obj.viewed_lessons += 1
        obj.percentage = (100/course.lessons.count()) * obj.viewed_lessons
        obj.save()
    return Response({'status':created})

# @api_view(['POST'])
# def add_like_course(request):
#     user_id = request.POST.get('user_id', None)
#     comment_id = request.POST.get('comment_id', None)
#     user = CustomUser.objects.get(pk=user_id)
#     comment = Comment.filtered.get(pk=comment_id)
#     add_like(course, user)
#     return Response({'status':'ok'}, status=status.HTTP_200_OK)



