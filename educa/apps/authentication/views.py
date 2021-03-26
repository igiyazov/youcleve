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
            user.profile = Profile()
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



#FIXME Work incorrect
@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated])
def profile_follow(request):
    user_id = request.data.get('user_id')
    follow_id = request.data.get('follow_id')

    if user_id and follow_id:
        user = CustomUser.objects.get(pk=user_id)
        follow = CustomUser.objects.get(pk=user_id)
        user.profile.followings.add(follow.profile)

        return Response('ok')
    
    return Response('not ok')