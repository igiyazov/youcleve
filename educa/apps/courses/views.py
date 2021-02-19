from django.shortcuts import render
from rest_framework import serializers
from rest_framework.response import Response
from rest_framework.views import APIView

from .pagination import PaginationHandlerMixin
from .models import (Category, Level, Subcategory, Course, Lesson)
from .serializers import (CategoryListSerializer,
                        CategoryDetailSerializer, 
                        CourseDetailSerializer, 
                        CourseListSerializer, 
                        LessonListSerializer, LevelListSerializer, 
                        SubcategoryListSerializer)



class CategoryListView(APIView):
    def get(self, request):
        categories = Category.objects.filter(draft=False) #TODO написать кастомный менеджр
        serializer = CategoryListSerializer(categories, many=True)
        return Response(serializer.data)

class CategoryDetailView(APIView):
    def get(self, request, pk):
        categorie = Category.objects.get(pk = pk)
        serializer = CategoryDetailSerializer(categorie)
        return Response(serializer.data)

class CourseListViewCategories(APIView, PaginationHandlerMixin):
    courses = Course.objects.filter(draft=False)
    def get(self, request, slug=None):
        filtering = request.GET.get('filter')
        self.courses = self.courses.filter(category__slug=slug)
        if filtering == 'recomended':
            self.courses = self.courses.order_by('-likes')
        elif filtering == 'popular':
            self.courses = self.courses.order_by('-views')

        page = self.paginate_queryset(self.courses)
        if page is not None:
            serializer = CourseListSerializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = CourseListSerializer(self.courses, many=True)
        return Response(serializer.data)

class CourseListView(APIView, PaginationHandlerMixin):
    courses = Course.objects.filter(draft=False) #TODO написать кастомный менеджр
    
    """Запрос возвращает все курсы"""
    # def get(self, request,slug=None):
    #     if slug == 'recomended':
    #         self.courses = self.courses.order_by('-likes')
    #     elif slug == 'popular':
    #         self.courses = self.courses.order_by('-views')
    #     elif slug:
    #         self.courses = self.courses.filter(subcategory__slug=slug)
    #     result_page = self.pagination_class().paginate_queryset(self.courses, request)
    #     serializer = CourseListSerializer(result_page, many=True)
    #     return Response(serializer.data)


    def get(self, request, slug=None):

        if slug == 'recomended':
            self.courses = self.courses.order_by('-likes')
        elif slug == 'popular':
            self.courses = self.courses.order_by('-views')
        elif slug:
            self.courses = self.courses.filter(subcategory__slug=slug)

        page = self.paginate_queryset(self.courses)
        if page is not None:
            serializer = CourseListSerializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = CourseListSerializer(self.courses, many=True)
        return Response(serializer.data)

# #TODO Переписать
# class CourseRecomendedListView(APIView):
#     """Запрос возвращает рекомендованные курсы"""
#     def get(self, request):
#         courses = Course.objects.filter(draft=False)
#                                 # .order_by('likes')#TODO написать кастомный менеджр
#         serializer = CourseListSerializer(courses, many=True)
#         return Response(serializer.data)

# #TODO Переписать
# class CoursePopularListView(APIView):
#     """Запрос возвращает популярные курсы"""
#     def get(self, request):
#         courses = Course.objects.filter(draft=False)\
#                                 .order_by('views')#TODO написать кастомный менеджр
#         serializer = CourseListSerializer(courses, many=True)
#         return Response(serializer.data)

class CourseDetailView(APIView):
    """Информация об одном курсу"""
    def get(self, request, slug):
        courses = Course.objects.filter(draft=False)\
                                .filter(slug=slug) #TODO написать кастомный менеджр
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