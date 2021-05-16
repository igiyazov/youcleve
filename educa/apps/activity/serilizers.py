from rest_framework.serializers import ModelSerializer
from .models import Comment, Subscription

class CommentSerializer(ModelSerializer):
    class Meta:
        model=Comment
        exclude=['object_id', 'content_type']


class SubscriptionSerializer(ModelSerializer):
    class Meta:
        model=Subscription
        fields='__all__'