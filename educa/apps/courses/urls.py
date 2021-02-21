from educa.apps.courses.serializers import CategoryDetailSerializer
from django.urls import path
from .views import (CategoryListView,
                    CourseDetailView, 
                    CourseListView,   
                    LessonDetailView, 
                    LessonListView, LevelListView, 
                    SubcategoryListView
                    )

urlpatterns = [
    path('categories/', CategoryListView.as_view(), name='category_list'),
    path('subcategories/<slug:slug>', SubcategoryListView.as_view(), name='subcategory_list'),
    path('courses/<slug:category>', CourseListView.as_view(), name='course_list'),
    path('courses/<slug:category>/<slug:subcategory>', CourseListView.as_view(), name='course_list_sub'),
    path('courses/', CourseListView.as_view(), name='all_course_list'),
    path('course/<int:pk>', CourseDetailView.as_view(), name='course_detail'),
    path('lessons/<slug:slug>', LessonListView.as_view(), name='lesson_list'),
    path('lesson/<slug:slug>', LessonDetailView.as_view(), name='lesson_detail'),
    path('levels/', LevelListView.as_view(), name='level_list'),
]
