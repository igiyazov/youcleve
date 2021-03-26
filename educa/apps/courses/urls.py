from educa.apps.courses.serializers import CategoryDetailSerializer
from django.urls import path
from .views import (CategoryListView,
                    CourseDetailView, 
                    CourseListView,   
                    LessonDetailView, 
                    LessonListView, LevelListView, 
                    SubcategoryListView, course_save, tmp
                    )

urlpatterns = [
    path('categories', CategoryListView.as_view(), name='category_list'),
    path('courses', CourseListView.as_view(), name='all_course_list'),
    path('subcategories/<int:id>', SubcategoryListView.as_view(), name='subcategory_list'),
    path('courses/<slug:category>', CourseListView.as_view(), name='course_list'),
    path('courses/<slug:category>/<slug:subcategory>', CourseListView.as_view(), name='course_list_sub'),
    path('course/<int:pk>', CourseDetailView.as_view(), name='course_detail'),
    path('course/create', CourseDetailView.as_view(), name='course_create'),
    path('course/save', course_save, name='save_course'),
    path('lessons/<int:course_id>', LessonListView.as_view(), name='lesson_list'),
    path('lessons', LessonListView.as_view(), name='lesson_all_list'),
    path('lesson/<int:id>', LessonDetailView.as_view(), name='lesson_detail'),
    path('lesson/create', LessonDetailView.as_view(), name='lesson_create'),
    path('levels', LevelListView.as_view(), name='level_list'),
    path('tmp/create', tmp, name='tmp_create'),
    path('tmp/delete', tmp, name='tmp_delete'),
]
