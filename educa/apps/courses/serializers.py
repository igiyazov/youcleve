from educa.apps.activity.services import all_likes_count
from django.db.models import fields
from rest_framework import serializers
from .models import (
                    Course,
                    Lesson,
                    )

from .models import (Category, Subcategory, Course, Lesson, Level)

class CategoryListSerializer(serializers.ModelSerializer):

    class Meta:
        model = Category
        fields = ('id', 'title', 'slug', 'photo', 'description')

class CategoryDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = Category
        fields = '__all__'

class CourseListSerializer(serializers.ModelSerializer):
    lessons_count = serializers.SerializerMethodField()
    likes_count = serializers.SerializerMethodField()
    def get_lessons_count(self, obj):
        return Course.filtered.get(pk=obj.id).lessons.count()

    def get_likes_count(self, obj):
        return all_likes_count(obj)

    class Meta:
        model = Course
        fields = '__all__'

class CourseDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = '__all__'

class SubcategoryListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subcategory
        fields = '__all__'

class LessonListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lesson
        fields = '__all__'

class LessonDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lesson
        fields = '__all__'

class LevelListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Level
        fields = '__all__'

