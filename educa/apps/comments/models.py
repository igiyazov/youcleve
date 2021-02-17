from django.db import models
from django.db.models.deletion import CASCADE
from educa.apps.base.models import TimestampedModel
from educa.apps.authentication.models import CustomUser
from educa.apps.courses.models import Course

class Comment(TimestampedModel):
    owner = models.ForeignKey(CustomUser, 
                                related_name='comments',
                                on_delete=models.CASCADE)

    post = models.ForeignKey(Course, 
                                related_name='comments',
                                on_delete=models.CASCADE)