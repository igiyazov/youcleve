from django.contrib import admin
from .models import Course,Category, Lesson, Level, Subcategory

@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    list_display = ['owner', 'subcategory', 'slug', 'course_duration', 'rating', 'views', 'photo', 'likes', 'price', 'overview', 'draft']
    list_filter = ['created_at', 'subcategory']
    search_fields = ['title', 'overview']
    prepopulated_fields = {'slug': ('title',)}

@admin.register(Subcategory)
class SubcategoryAdmin(admin.ModelAdmin):
    list_display = ['title', 'slug', 'category']
    list_filter = ['title',]
    search_fields = ['title',]
    prepopulated_fields = {'slug': ('title',)}

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['title', 'slug', 'photo']
    list_filter = ['title']
    search_fields = ['title', 'description']
    prepopulated_fields = {'slug': ('title',)}

@admin.register(Lesson)
class LessonAdmin(admin.ModelAdmin):
    list_display = ['title', 'slug', 'photo', 'video', 'duration', 'course', 'draft']
    list_filter = ['title']
    search_fields = ['title', 'description']
    prepopulated_fields = {'slug': ('title',)}

@admin.register(Level)
class LevelAdmin(admin.ModelAdmin):
    list_display = ['key', 'body', 'draft']
    list_filter = ['body']
    search_fields = ['body']
