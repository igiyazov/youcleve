from django.db import models
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework import status
from rest_framework_simplejwt.views import TokenObtainPairView

from .models import CustomUser
from .serializers import (CustomUserListSerializer,
                        CustomUserDetailSerializer, 
                        MyTokenObtainPairSerializer, ProfileDetailSerializer
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

    def post(self, request):
        email = request.POST.get('email', None)
        # em = request.POST['email']
        password = request.POST.get('password', None)
        user = CustomUser.objects.create_user(email=email, password=password)
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


class MyObtainTokenPairView(TokenObtainPairView):
    permission_classes = (permissions.AllowAny,)
    serializer_class = MyTokenObtainPairSerializer