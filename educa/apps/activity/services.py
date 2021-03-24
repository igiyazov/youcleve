from django.contrib.auth import get_user_model
from django.contrib.contenttypes.models import ContentType
from .models import Like,Comment
# from .serilizers import CommentSerializer

User = get_user_model()

def all_comments(obj):
    obj_type = ContentType.objects.get_for_model(obj)
    comments = Comment.objects.filter(content_type=obj_type, 
                                        object_id=obj.id)
    return comments
    

def add_comment(obj, user, text):
    obj_type = ContentType.objects.get_for_model(obj)
    comment = Comment.objects.create(content_type=obj_type, 
                                    user=user,
                                    body=text,
                                    object_id=obj.id)
    return comment


def add_or_remove_like(obj, user):
    """Лайкает `obj`.
    """
    obj_type = ContentType.objects.get_for_model(obj)
    like, is_created = Like.objects.get_or_create(
        content_type=obj_type, object_id=obj.id, user=user)
    if not is_created:
        remove_like(obj, user)
        return False
    return True

def all_likes_count(obj):
    obj_type = ContentType.objects.get_for_model(obj)
    likes = Like.objects.filter(
        content_type=obj_type, object_id=obj.id,
    ).count()
    return likes

def is_liked(obj, user):
    obj_type = ContentType.objects.get_for_model(obj)
    try:
        like = Like.objects.get(
            content_type=obj_type, object_id=obj.id, user=user)
    except Like.DoesNotExist:
        return False
    return True

def remove_like(obj, user):
    """Удаляет лайк с `obj`.
    """
    obj_type = ContentType.objects.get_for_model(obj)
    Like.objects.filter(
        content_type=obj_type, object_id=obj.id, user=user
    ).delete()