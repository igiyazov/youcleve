from django.shortcuts import render
from rest_framework import serializers
from rest_framework.response import Response
from rest_framework.views import APIView
from .services import get_filtered

from .pagination import PaginationHandlerMixin
from .models import (Category, Level, Subcategory, Course, Lesson)
from .serializers import (CategoryListSerializer,
                        CourseDetailSerializer, 
                        CourseListSerializer, 
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


class SubcategoryListView(APIView):
    """Запрос возвращает все подкатегории"""
    def get(self, request, slug):
        subcategory = Subcategory.objects.filter(draft=False)\
                                            .filter(category__slug=slug) #TODO написать кастомный менеджр
        serializer = SubcategoryListSerializer(subcategory, many=True)
        return Response(serializer.data)

class LessonListView(APIView):
    """Запрос возвращает все уроки"""
    def get(self, request, slug=None):
        lesson = Lesson.objects.filter(draft=False) #TODO написать кастомный менеджр
        if slug:
            lesson = lesson.filter(course__slug=slug) 
        serializer = LessonListSerializer(lesson, many=True)
        return Response(serializer.data)

class LessonDetailView(APIView):
    """Запрос возвращает все подкатегории"""
    def get(self, request, slug):
        lesson = Lesson.objects.filter(draft=False)\
                                .filter(slug=slug) #TODO написать кастомный менеджр
        serializer = LessonDetailView(lesson)
        return Response(serializer.data)


class LevelListView(APIView):
    def get(self, request):
        levels = Level.objects.all()
        serializer = LevelListSerializer(levels, many=True)
        return Response(serializer.data)