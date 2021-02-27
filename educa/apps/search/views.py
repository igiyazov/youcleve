from rest_framework import serializers
from educa.apps.authentication.models import CustomUser, Profile
from django.shortcuts import render
from rest_framework.decorators import api_view
from django.contrib.postgres.search import SearchVector
from rest_framework.response import Response
from educa.apps.courses.models import Course
from educa.apps.courses.serializers import CourseListSerializer
from educa.apps.authentication.serializers import ProfileListSerializer
from django.contrib.postgres.search import TrigramSimilarity


@api_view(['GET'])
def search(request):
    search_data = request.GET.get('search', [])

    if not search_data:
        return Response({})

    course = Course.filtered.filter(title__icontains=search_data)

    # course_tri = Course.filtered.annotate(similarity=TrigramSimilarity('title', search_data))\
    #                             .filter(similarity__gt=0.1)\
    #                             .order_by('-similarity')
    # breakpoint()
    # if course_tri:
    #     course = course.union(course_tri)
                
    authors = Profile.objects.annotate(similarity=TrigramSimilarity('custom_user__username', search_data))\
                                .filter(similarity__gt=0.3)\
                                .order_by('-similarity')
    # breakpoint()
    serialized_courses = CourseListSerializer(course, many=True)
    serialized_authors = ProfileListSerializer(authors, many=True)
    res = {
        'courses':serialized_courses.data,
        'authors':serialized_authors.data,
    }
    # if serialized_courses.data:
    #     res = serialized_courses.data
    # if serialized_authors.data:
    #     authors_data = serialized_authors.data
    #     res |= authors_data
    # breakpoint()
    
    return Response(res)
