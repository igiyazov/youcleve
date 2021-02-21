from django.conf import settings
from django.db import models
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from educa.apps.authentication.models import CustomUser

class Comment(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                            related_name='comments',
                            on_delete=models.CASCADE)
    body = models.TextField(blank=True)
    content_type = models.ForeignKey(ContentType,related_name='comments', on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

class Like(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             related_name='likes',
                             on_delete=models.CASCADE)
    content_type = models.ForeignKey(ContentType, related_name='likes', on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')
