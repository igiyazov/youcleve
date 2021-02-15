from django.db import models
from educa.apps.authentication.models import CustomUser
from educa.apps.base.models import TimestampedModel
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey

class Category(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(max_length=200, unique=True)
    description = models.TextField(null=True, blank=True)
    photo = models.ImageField(null=True, upload_to='category/')

    class Meta:
        ordering = ['title']

    def __str__(self):
        return self.title

class Subcategory(models.Model):
    title = models.CharField(max_length=200)
    category = models.ForeignKey(Category, 
                                related_name='subcategories',
                                on_delete=models.CASCADE)

    class Meta:
        ordering = ['title']

    def __str__(self):
        return self.title

class Course(TimestampedModel):
    owner = models.ForeignKey(CustomUser, 
                                related_name='courses_created', 
                                on_delete=models.CASCADE)
    subject = models.ForeignKey(Subcategory, 
                                related_name='courses', 
                                on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    slug = models.SlugField(max_length=200, unique=True)
    overview = models.TextField()

    def __str__(self):
        return self.title

class Lesson(TimestampedModel):
    title = models.CharField(max_length=200)
    duration = models.DurationField()
    module = models.ForeignKey(Course, 
                                related_name='lessons', 
                                on_delete=models.CASCADE)
    video_path = models.URLField(max_length=200)
    image_path = models.URLField(max_length=200)
