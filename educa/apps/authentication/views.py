from functools import partial
from educa.apps.courses.models import Course
from django.core.exceptions import ObjectDoesNotExist
from jedi.api.completion import search_in_module
from educa.apps.authentication.services import profile_info
from django.db import models
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view, permission_classes
from rest_framework import permissions
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework import status
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView


from educa.permissions import OnlyOwner
from .models import CustomUser, Profile
from .serializers import (CustomUserListSerializer,
                        CustomUserDetailSerializer, 
                        MyTokenObtainPairSerializer, MyTokenRefreshSerializer, ProfileDetailSerializer, ProfileListSerializer
                        )

class CustomUserListView(APIView):
    def get(self, request):
        categories = CustomUser.objects.all()
        serializer = CustomUserListSerializer(categories, many=True)
        return Response(serializer.data)

class CustomUserDetailView(APIView):
    permission_classes = (permissions.IsAuthenticated,)
    def get(self, request, pk):
        user = CustomUser.objects.get(pk = pk)
        serializer = CustomUserDetailSerializer(user)
        return Response(serializer.data)

class CustomUserCreateView(APIView):
    def post(self, request):
        serialized = CustomUserDetailSerializer(data=request.data)
        if serialized.is_valid():
            user = serialized.create(serialized.validated_data)
            user.profile = Profile(custom_user=user)
            user.profile.save()
            # breakpoint()
            return Response(serialized.data)
        return Response(serialized.errors, status=status.HTTP_409_CONFLICT)


class CustomUserLogoutView(APIView):
    permission_classes = (permissions.IsAuthenticated,)

    def post(self, request):
        try:
            refresh_token = request.data.get("refresh_token", None)
            token = RefreshToken(refresh_token)
            token.blacklist()

            return Response(status=status.HTTP_205_RESET_CONTENT)
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST)


class ProfileDetailView(APIView):
    def get(self, request, pk):
        user = CustomUser.objects.get(pk = pk)
        serializer_profile = None
        if user:
            profile = user.profile
            serializer_profile = ProfileDetailSerializer(profile)
        serializer_user = CustomUserDetailSerializer(user)
        result = serializer_user.data
        if serializer_profile:
            result = {**serializer_user.data, **serializer_profile.data}
        return Response(result)

    def put(self, request, pk):
        user = CustomUser.objects.get(pk = pk)
        serialized_user =  CustomUserDetailSerializer(user, data=request.data, partial=True)
        serialized_profile = ProfileDetailSerializer(user.profile, data=request.data, partial=True)
        if serialized_user.is_valid() and serialized_profile.is_valid():
            serialized_user.save()
            serialized_profile.save()
            return Response({'message': 'good'})
        return Response([serialized_user.errors])

#TODO Paginate
class ProfileListView(APIView):
    def get(self, request):
        profiles = Profile.objects.all()
        serialize = ProfileListSerializer(profiles, many=True)
        return Response(serialize.data)


class MyObtainTokenPairView(TokenObtainPairView):
    permission_classes = (permissions.AllowAny,)
    serializer_class = MyTokenObtainPairSerializer

    # def post(self,request):


class MyRefreshTokenView(TokenRefreshView):
    permission_classes = (permissions.AllowAny,)
    serializer_class = MyTokenRefreshSerializer

@api_view(['GET'])
@permission_classes([permissions.IsAuthenticated, OnlyOwner])
def get_profile_info(request, pk, param):
    """
        Функция возвращает личные данные пользователя.
        Доступ разрешен только авторизованному пользователю
        Принимает:
            pk - id пользователя
            param - ключевое слово для вызова нужной функции
        Возвращает:
            queryset из запрошенных данных 
    """
    try:
        user = CustomUser.objects.get(pk=pk)
        data = profile_info(user, param)
    except CustomUser.DoesNotExist:
        return Response({'detail': 'User doesn\'t exist'}, status.HTTP_404_NOT_FOUND)
    return Response(data)

@api_view(['GET'])
def get_profile_courses(request, pk):
    try:
        user = CustomUser.objects.get(pk=pk)
        data = profile_info(user, 'courses')
    except CustomUser.DoesNotExist:
        return Response({'detail': 'User doesn\'t exist'}, status.HTTP_404_NOT_FOUND)
    return Response(data)




@api_view(['POST'])
# @permission_classes([permissions.IsAuthenticated])
def profile_follow(request):
    user_id = request.data.get('user_id')
    follow_id = request.data.get('follow_id')
    if user_id == follow_id:
        return Response({'detail':'you can\'t subscribe to yourself'}, status=status.HTTP_400_BAD_REQUEST)

    if not (user_id and follow_id):
        return Response({'detail': 'Both user_id and follow_id are required'}, status=status.HTTP_400_BAD_REQUEST)

    try:
        user = CustomUser.objects.get(pk=user_id)
        follow = CustomUser.objects.get(pk=follow_id)
    except ObjectDoesNotExist:
        return Response({'detail': 'User and/or following user does not exist'})
    
    user.profile.followings.add(follow.profile)
    return Response({'detail':'User followed'})


@api_view(['POST'])
# @permission_classes([permissions.IsAuthenticated])
def profile_unfollow(request):
    user_id = request.data.get('user_id')
    follow_id = request.data.get('follow_id')
    if user_id == follow_id:
        return Response({'detail':'you can\'t subscribe to yourself'}, status=status.HTTP_400_BAD_REQUEST)

    if not (user_id and follow_id):
        return Response({'detail': 'Both user_id and follow_id are required'}, status=status.HTTP_400_BAD_REQUEST)

    try:
        user = CustomUser.objects.get(pk=user_id)
        follow = CustomUser.objects.get(pk=follow_id)
    except ObjectDoesNotExist:
        return Response({'detail': 'User and/or unfollowing user does not exist'})
    print(user.profile.followings.all())
    user.profile.followings.remove(follow.profile)
    print(user.profile.followings.all())
    user.profile.save()
    return Response({'detail':'User unfollowed'})




@api_view(['POST'])
# @permission_classes([permissions.IsAuthenticated])
def is_profile_follow(request):
    user_id = request.data.get('user_id')
    follow_id = request.data.get('follow_id')
    if user_id == follow_id:
        return Response({'detail':'Similar ids'}, status=status.HTTP_400_BAD_REQUEST)

    if not (user_id and follow_id):
        return Response({'detail': 'Both user_id and follow_id are required'}, status=status.HTTP_400_BAD_REQUEST)

    try:
        user = CustomUser.objects.get(pk=user_id)
        follow = CustomUser.objects.get(pk=follow_id)
    except ObjectDoesNotExist:
        return Response({'detail': 'User and/or following user does not exist'})

    try:
        user.profile.followings.get(custom_user__id=follow_id)
    except ObjectDoesNotExist:
        return Response({'detail': 'notfollowed'})
    # user.profile.get()
    return Response({'detail':'followed'})


@api_view(['POST'])
# @permission_classes([permissions.IsAuthenticated])
def profile_purchase(request):
    user_id = request.data.get('user_id')
    course_id = request.data.get('course_id')
    
    if not (user_id and course_id):
        return Response({'detail': 'Both user_id and course_id are required'}, status=status.HTTP_400_BAD_REQUEST)

    try:
        user = CustomUser.objects.get(pk=user_id)
        course = Course.objects.get(pk=course_id)
    except ObjectDoesNotExist:
        return Response({'detail': 'User and/or course user does not exist'})

    user.profile.purchases.add(course)
    return Response({'detail':'Purchased'})


@api_view(['POST'])
# @permission_classes([permissions.IsAuthenticated])
def is_profile_purchase(request):
    '''
    куплен ли курс
    '''
    user_id = request.data.get('user_id')
    course_id = request.data.get('course_id')
    
    if not (user_id and course_id):
        return Response({'detail': 'Both user_id and course_id are required'}, status=status.HTTP_400_BAD_REQUEST)

    try:
        user = CustomUser.objects.get(pk=user_id)
        course = Course.objects.get(pk=course_id)
    except ObjectDoesNotExist:
        return Response({'detail': 'User and/or course user does not exist'})

    try:
        user.profile.purchases.get(id=course_id)
    except ObjectDoesNotExist:
        return Response({'detail': 'notbought'})
    # user.profile.get()
    return Response({'detail':'bought'})

