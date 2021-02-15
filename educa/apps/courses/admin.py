from django.contrib import admin
from .models import Course,Category

@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    list_display = ['title', 'subject', 'created_at']
    list_filter = ['created_at', 'subject']
    search_fields = ['title', 'overview']
    prepopulated_fields = {'slug': ('title',)}

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['title', 'slug', 'photo']
    list_filter = ['title']
    search_fields = ['title', 'description']
    prepopulated_fields = {'slug': ('title',)}