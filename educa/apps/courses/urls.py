from educa.apps.courses.serializers import CategoryDetailSerializer
from django.urls import path
from .views import (CategoryListView,
                    CategoryDetailView, 
                    CourseDetailView, 
                    CourseListView, CourseListViewCategories,  
                    LessonDetailView, 
                    LessonListView, LevelListView, 
                    SubcategoryListView
                    )

urlpatterns = [
    path('categories/', CategoryListView.as_view(), name='category_list'),
    path('category/<int:pk>', CategoryDetailView.as_view(), name='category_detail'),
    path('courses/category/<slug:slug>', CourseListViewCategories.as_view(), name='category_courses'),
    path('courses/<slug:slug>', CourseListView.as_view(), name='course_list'),
    path('courses/', CourseListView.as_view(), name='all_course_list'),
    # path('courses/recomended', CourseRecomendedListView.as_view(), name='course_recomended_list'),
    # path('courses/popular', CoursePopularListView.as_view(), name='course_popular_list'),
    path('course/<slug:slug>', CourseDetailView.as_view(), name='course_detail'),
    path('subcategories/<slug:slug>', SubcategoryListView.as_view(), name='subcategory_list'),
    path('lessons/<slug:slug>', LessonListView.as_view(), name='lesson_list'),
    path('lesson/<slug:slug>', LessonDetailView.as_view(), name='lesson_detail'),
    path('levels/', LevelListView.as_view(), name='level_list')
]
