from educa.apps.authentication.services import profile_info
from django.db import models
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from rest_framework import permissions
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework import status
from rest_framework_simplejwt.views import TokenObtainPairView

from .models import CustomUser, Profile
from .serializers import (CustomUserListSerializer,
                        CustomUserDetailSerializer, 
                        MyTokenObtainPairSerializer, ProfileDetailSerializer, ProfileListSerializer
                        )

class CustomUserListView(APIView):
    def get(self, request):
        categories = CustomUser.objects.all()
        serializer = CustomUserListSerializer(categories, many=True)
        return Response(serializer.data)

class CustomUserDetailView(APIView):
    permission_classes = (permissions.AllowAny,)
    def get(self, request, pk):
        user = CustomUser.objects.get(pk = pk)
        serializer = CustomUserDetailSerializer(user)
        return Response(serializer.data)

class CustomUserCreateView(APIView):
    def post(self, request):
        username = request.data.get('username', None)
        email = request.data.get('email', None)
        # em = request.data['email']
        password = request.data.get('password', None)
        # breakpoint()
        user = CustomUser.objects.create_user(username=username, 
                                                email=email, 
                                                password=password)
        serializer = CustomUserDetailSerializer(user)
        return Response(serializer.data)


# class CustomUserLoginView(APIView):
class CustomUserLogoutView(APIView):
    permission_classes = (permissions.IsAuthenticated,)

    def post(self, request):
        try:
            refresh_token = request.POST.get("refresh_token", None)
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

@api_view(['GET'])
def get_profile_info(request, pk, param):
    user = CustomUser.objects.get(pk=pk)
    data = profile_info(user, param)
    return Response(data)