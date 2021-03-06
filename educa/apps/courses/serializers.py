from django.db.models.aggregates import Sum
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
    # duration = serializers.SerializerMethodField()
    username = serializers.SerializerMethodField()
    def get_lessons_count(self, obj):
        return Course.objects.get(pk=obj.id).lessons.count()

    def get_likes_count(self, obj):
        likes_count = all_likes_count(obj)
        obj.likes = likes_count
        obj.save()   
        return likes_count

    # def get_duration(self, obj):
    #     time = Course.objects.get(pk=obj.id)\
    #                 .lessons\
    #                 .aggregate(dur=Sum('duration')).get('dur', 0)
    #     if time:
    #         time = time.total_seconds()
    #     return time

    def get_username(self, obj):
        try:
            return Course.objects.get(pk=obj.id).owner.username
        except:
            return 'undefined'
            

    class Meta:
        model = Course
        fields = '__all__'

class CourseDetailSerializer(serializers.ModelSerializer):
    lessons_count = serializers.SerializerMethodField()
    likes_count = serializers.SerializerMethodField()
    duration = serializers.SerializerMethodField()
    username = serializers.SerializerMethodField()
    def get_lessons_count(self, obj):
        return Course.filtered.get(pk=obj.id).lessons.count()

    def get_likes_count(self, obj):
        return all_likes_count(obj)

    def get_duration(self, obj):
        time = Course.filtered.get(pk=obj.id)\
                    .lessons\
                    .aggregate(dur=Sum('duration')).get('dur', 0)
        if time:
            time = time.total_seconds()
        return time

    def get_username(self, obj):
        return Course.filtered.get(pk=obj.id).owner.username
    class Meta:
        model = Course
        fields = '__all__'
        extra_kwargs = {
                        'category':{'required': True}, 
                        'subcategory':{'required': True},
                        }

class SubcategoryListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subcategory
        fields = '__all__'

class LessonListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lesson
        fields = '__all__'

class LessonDetailSerializer(serializers.ModelSerializer):
    videos = serializers.SerializerMethodField()
    def get_videos(self, obj):
        return [(str(res.resolution),res.video.url) for res in obj.resolutions.all()]
    class Meta:
        model = Lesson
        fields = '__all__'

class LevelListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Level
        fields = '__all__'

