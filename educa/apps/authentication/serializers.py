from django.db.models import fields
from rest_framework import serializers

from .models import CustomUser, Profile

class CustomUserListSerializer(serializers.ModelSerializer):

    class Meta:
        model = CustomUser
        fields = '__all__'

class CustomUserDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = CustomUser
        # fields = '__all__'
        exclude = ['password']

class ProfileDetailSerializer(serializers.ModelSerializer):
    followers_count = serializers.SerializerMethodField()
    followings_count = serializers.SerializerMethodField()
    def get_followers_count(self, obj):
        return Profile.objects.get(pk=obj.id).followers.count()
    def get_followings_count(self, obj):
        return Profile.objects.get(pk=obj.id).followings.count()
    class Meta:
        model = Profile
        # fields = '__all__'
        exclude = ['followings']


from rest_framework_simplejwt.serializers import TokenObtainPairSerializer


class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        # The default result (access/refresh tokens)
        data = super(MyTokenObtainPairSerializer, self).validate(attrs)
        # Custom data you want to include
        data.update({'user': self.user.email})
        data.update({'id': self.user.id})
        # and everything else you want to send in the response
        return data