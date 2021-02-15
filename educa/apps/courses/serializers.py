from django.db.models import fields
from rest_framework import serializers

from .models import (Category, Subcategory, Course, Lesson)

class CategoryListSerializer(serializers.ModelSerializer):

    class Meta:
        model = Category
        fields = ('id', 'title', 'slug', 'photo', 'description')

class CategoryDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = Category
        fields = '__all__'

