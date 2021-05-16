from educa.apps.courses.models import Course, Lesson
from django.conf import settings
from django.db import models
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from educa.apps.authentication.models import CustomUser
from educa.apps.base.models import TimestampedModel
from datetime import date
from dateutil.relativedelta import relativedelta


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


class Subscription(TimestampedModel):
    """ 
    Создаёт запись в таблице Subscription(подписки).
    При создании поле sub_end автоматицески определяется.
    Например, если пользователь покупает подписку 02.10.2021,
    то поле заполняется датой ровно на месяц вперёд, то есть 02.11.2021.
    """
    user = models.ForeignKey(CustomUser,
                            related_name='subscription',
                            on_delete=models.CASCADE)
    sub_end = models.DateField(blank=True, null=True)

    def update_sub_end(self):
        subs = Subscription.objects.filter(pk=self.id)
        sub_end = self.created_at + relativedelta(months=+1)
        subs.update(sub_end=sub_end)

    def save(self, *args,  **kwargs):
        super().save(*args, **kwargs) 
        self.update_sub_end()   


class ViewCourse(TimestampedModel):
    user = models.ForeignKey(CustomUser,
                            related_name='viewed_courses',
                            on_delete=models.SET_NULL,
                            null=True)
    course = models.ForeignKey(Course, related_name='viewed', on_delete=models.CASCADE)
    viewed_lessons = models.PositiveSmallIntegerField(blank=True, default=0)
    percentage = models.PositiveSmallIntegerField(blank=True, default=0)

class ViewLesson(TimestampedModel):

    lesson = models.ForeignKey(Lesson,
                            related_name='viewed_lessons',
                            on_delete=models.CASCADE)

    view_course = models.ForeignKey(ViewCourse,
                                    related_name='viewed_lessons_list',
                                    on_delete=models.CASCADE
                                    )