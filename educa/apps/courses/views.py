from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView

from .models import (Category, Subcategory, Course, Lesson)
from .serializers import (CategoryListSerializer,
                        CategoryDetailSerializer)

class CategoryListView(APIView):
    def get(self, request):
        categories = Category.objects.all()
        serializer = CategoryListSerializer(categories, many=True)
        return Response(serializer.data)

class CategoryDetailView(APIView):
    def get(self, request, pk):
        categorie = Category.objects.get(pk = pk)
        serializer = CategoryDetailSerializer(categorie)
        return Response(serializer.data)

