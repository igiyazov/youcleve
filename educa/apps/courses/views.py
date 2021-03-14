import os
from django.core.files.storage import default_storage
from rest_framework.parsers import JSONParser, MultiPartParser
from educa.apps.authentication.models import CustomUser
from os import stat
from django.shortcuts import render
from django.views.decorators.csrf import requires_csrf_token
from rest_framework import serializers
from rest_framework.response import Response
from rest_framework.views import APIView
from .services import PlainTextParser, delete_file_tmp, get_filtered, get_poster_path, new_poster_path, tmp_to_storage
from rest_framework.exceptions import *
from rest_framework.decorators import api_view, parser_classes
# from rest_framework.parsers


from .services import upload_file_tmp
from .pagination import PaginationHandlerMixin
from .models import (Category, Level, Subcategory, Course, Lesson)
from .serializers import (CategoryListSerializer,
                        CourseDetailSerializer, 
                        CourseListSerializer, LessonDetailSerializer, 
                        LessonListSerializer, LevelListSerializer, 
                        SubcategoryListSerializer)



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
    """Информация об одном курсу"""
    def get(self, request, pk):
        courses = Course.filtered.get(pk=pk)
        serializer = CourseDetailSerializer(courses)
        return Response(serializer.data)

    def post(self, request):    
              
        serialized_course = CourseDetailSerializer(data=request.data)
        
        val = serialized_course.is_valid()
        
        if serialized_course.is_valid():
            res = serialized_course.save()
            poster_path, filename = get_poster_path(request)
            new_path = new_poster_path(res, filename)
            if poster_path is not None:                
                default_storage.copy(poster_path, new_path)
                default_storage.delete(poster_path)
                res.photo = new_path
                res.save()
            # tmp_to_storage(request)
            
            # create_lessons()
        return Response('ok')



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
        lesson = Lesson.objects.filter(draft=False) #TODO написать кастомный менеджр
        if course_id:
            lesson = lesson.filter(course__pk=course_id) 
        serializer = LessonListSerializer(lesson, many=True)
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
    if request.method == 'POST':
        return Response(upload_file_tmp(request), status=status.HTTP_200_OK, content_type='text/plain')
    elif request.method == 'DELETE':
        delete_file_tmp(request)
        return Response({},status=status.HTTP_200_OK)


@api_view(['POST'])
def course_save(request):
    user_id = request.data.get('user_id')
    obj_id = request.data.get('obj_id')

    if user_id and obj_id:
        user = CustomUser.objects.get(pk=user_id)
        course = Course.objects.get(pk=obj_id)

        user.profile.saved.add(course)
    return Response('ok')
