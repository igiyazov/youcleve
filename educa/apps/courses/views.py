from django.core.files.storage import default_storage
from rest_framework.parsers import JSONParser, MultiPartParser
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework import permissions
from educa.apps.authentication.models import CustomUser
from os import stat
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from .services import PlainTextParser, create_lessons, delete_file_tmp, get_filtered, get_poster_path, new_poster_path, tmp_to_storage,delete_course_photo_from_server
from rest_framework.decorators import api_view, parser_classes, permission_classes
from django.core.exceptions import ObjectDoesNotExist
from rest_framework import status

from .services import upload_file_tmp
from .pagination import PaginationHandlerMixin
from .models import Category, Level, Subcategory, Course, Lesson
from .serializers import CategoryListSerializer, CourseDetailSerializer, CourseListSerializer, LessonDetailSerializer, LessonListSerializer, LevelListSerializer, SubcategoryListSerializer



class CategoryListView(APIView):
    def get(self, request):
        categories = Category.objects.filter(draft=False) #TODO написать кастомный менеджр
        serializer = CategoryListSerializer(categories, many=True)
        return Response(serializer.data)


class CourseListView(APIView, PaginationHandlerMixin):
    
    """Запрос возвращает все курсы отсортировав их, либо курсы определенной субкатегории"""
 
    def get(self, request, category=None, subcategory=None):
        courses = Course.filtered.all()
        if category:
            courses = Course.filtered.filter(category__slug=category)
        if subcategory:
            courses = Course.filtered.filter(subcategory__slug=subcategory)
        
        courses = get_filtered(request, courses)
        page = self.paginate_queryset(courses)
        if page is not None:
            serializer = CourseListSerializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = CourseListSerializer(courses, many=True)
        return Response(serializer.data)

class CourseDetailView(APIView):
    # permission_classes = [IsAuthenticatedOrReadOnly]

    """Информация об одном курсу"""
    def get(self, request, pk):
        try:
            courses = Course.filtered.get(pk=pk)
        except ObjectDoesNotExist:
            return Response({'detail':'Course does not exist'}, status=status.HTTP_400_BAD_REQUEST)
        serializer = CourseDetailSerializer(courses)
        return Response(serializer.data)

    def post(self, request):    
        # breakpoint()
        print(request.data)
        serialized_course = CourseDetailSerializer(data=request.data)
        # breakpoint()
        val = serialized_course.is_valid()
        # breakpoint()
        if serialized_course.is_valid():
            res = serialized_course.save()
            try:
                poster_path, filename = get_poster_path(request)
            except ParseError as e:
                return Response(data = {'message':e.default_detail}, status=e.status_code)
            except Exception as e:
                return Response(e.msg)
            new_path = new_poster_path(res, filename)               
            default_storage.copy(poster_path, new_path)
            default_storage.delete(poster_path)
            res.photo = new_path
            create_lessons(request, res)
            res.save()
            return Response('Course created successfully', status=status.HTTP_201_CREATED)
            # tmp_to_storage(request)
            
            
        return Response(serialized_course.errors, status=status.HTTP_400_BAD_REQUEST)

    def put(self, request, pk):
        if not pk:
            return Response({'detail':'Course id is required'}, status=status.HTTP_400_BAD_REQUEST)
        try:
            course = Course.filtered.get(pk=pk)
        except ObjectDoesNotExist:
            return Response({'detail':'Course does not exist'}, status=status.HTTP_400_BAD_REQUEST)
        serialized_course = CourseDetailSerializer(data=request.data)
        if serialized_course.is_valid():
            serialized_course.update(course, serialized_course.validated_data)
            return Response({'detail', 'Course updated'})
        return Response(serialized_course.errors, status=status.HTTP_400_BAD_REQUEST)


    def delete(self, request, pk):
        if not pk:
            return Response({'detail':'Course id is required'}, status=status.HTTP_400_BAD_REQUEST)
        try:
            course = Course.filtered.get(pk=pk)
        except ObjectDoesNotExist:
            return Response({'detail':'Course does not exist'}, status=status.HTTP_400_BAD_REQUEST)
        course.draft = True
        course.save()
        return Response({'detail':'Course deleted'}, status=status.HTTP_200_OK)
        


class SubcategoryListView(APIView):
    """Запрос возвращает все подкатегории"""
    def get(self, request, id):
        subcategory = Subcategory.objects.filter(draft=False)\
                                            .filter(category__id=id) #TODO написать кастомный менеджр
        serializer = SubcategoryListSerializer(subcategory, many=True)
        return Response(serializer.data)

class LessonListView(APIView):
    """Запрос возвращает все уроки"""
    def get(self, request, course_id):
        try:
            course = Course.objects.get(pk=course_id)
        except ObjectDoesNotExist:
            return Response({'detail':'Course doe not exist'}, status=status.HTTP_400_BAD_REQUEST)
        
        lessons = course.lessons.filter(draft=False).all()
        # lesson = Lesson.objects.filter(draft=False) #TODO написать кастомный менеджр
        serializer = LessonListSerializer(lessons, many=True)
        return Response(serializer.data)

class LessonDetailView(APIView):
    """Запрос возвращает все подкатегории"""
    def get(self, request, id):
        lesson = Lesson.objects.filter(draft=False)\
                                .get(pk=id) #TODO написать кастомный менеджр
        
        print(lesson)
        # breakpoint()
        
        serializer = LessonDetailSerializer(lesson)
        return Response(serializer.data)

    def post(self, request):
        title = request.POST.get('title')
        course_id = request.POST.get('course',None)
        video = request.FILES.get('video') 

        course = Course.filtered.get(pk=course_id)      
        lesson = None
        # try:
        lesson = Lesson.objects.create(title=title, 
                                            course=course, 
                                            video=video)
        # except:
        #     return Response({'error': 'Value error'}, status=status.HTTP_400_BAD_REQUEST)

        serialize = LessonDetailSerializer(lesson)
        return Response(serialize.data, status=status.HTTP_201_CREATED)
            


class LevelListView(APIView):
    def get(self, request):
        levels = Level.objects.all()
        serializer = LevelListSerializer(levels, many=True)
        return Response(serializer.data)


@api_view(['POST','DELETE'])
@parser_classes([PlainTextParser, JSONParser, MultiPartParser])
def tmp(request):
    if request.method == 'GET':
        return Response()
    elif request.method == 'POST':
        return Response(upload_file_tmp(request), status=status.HTTP_200_OK, content_type='text/plain')
    elif request.method == 'DELETE':
        delete_file_tmp(request)
        return Response({},status=status.HTTP_200_OK)




@api_view(['POST'])
# @permission_classes([permissions.IsAuthenticated])
def course_save(request):
    user_id = request.data.get('user_id')
    course_id = request.data.get('course_id')
    if not (user_id and course_id):
        return Response({'detail': 'Both user_id and course_id are required'}, status=status.HTTP_400_BAD_REQUEST)
    try:
        user = CustomUser.objects.get(pk=user_id)
        course = Course.objects.get(pk=course_id)
    except ObjectDoesNotExist:
        return Response({'detail': 'User and/or course user does not exist'})
    kkk = user.profile.saved.filter(pk=course.pk).exists()
    if not user.profile.saved.filter(pk=course.id).exists():
        user.profile.saved.add(course)
        return Response({'detail':'Course saved'})
    else:
        user.profile.saved.remove(course)
        return Response({'detail':'Course unsaved'})

@api_view(['POST'])
# @permission_classes([permissions.IsAuthenticated])
def is_course_saved(request):
    '''
    сохранён ли курс
    '''
    user_id = request.data.get('user_id')
    course_id = request.data.get('course_id')
    
    if not (user_id and course_id):
        return Response({'detail': 'Both user_id and course_id are required'}, status=status.HTTP_400_BAD_REQUEST)

    try:
        user = CustomUser.objects.get(pk=user_id)
        course = Course.objects.get(pk=course_id)
    except ObjectDoesNotExist:
        return Response({'detail': 'User and/or course user does not exist'})

    try:
        user.profile.saved.get(id=course_id)
    except ObjectDoesNotExist:
        return Response({'detail': 'notsaved'})
    # user.profile.get()
    return Response({'detail':'saved'})




@api_view(['DELETE'])
def delete_course_photo(request,pk):
    # try:
    delete_course_photo_from_server(pk)
    # except Exception as e:
    #     return Response(, status=status.HTTP_400_BAD_REQUEST)
    return Response({'detail':'Photo deleted'}, status=status.HTTP_200_OK)