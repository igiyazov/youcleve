from django.db import models
from educa.apps.authentication.models import CustomUser
from educa.apps.base.models import TimestampedModel

class Category(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(max_length=200, unique=True)
    description = models.TextField(null=True, blank=True)
    photo = models.ImageField(null=True, upload_to='category/')
    draft = models.BooleanField(default=True)

    class Meta:
        ordering = ['title']

    def __str__(self):
        return self.title

class Subcategory(models.Model):
    title = models.CharField(max_length=200)
    category = models.ForeignKey(Category, 
                                related_name='subcategories',
                                on_delete=models.CASCADE)
    slug = models.SlugField(null=True)
    draft = models.BooleanField(default=True)

    class Meta:
        ordering = ['title']

    def __str__(self):
        return self.title

class Course(TimestampedModel):
    owner = models.ForeignKey(CustomUser, 
                                related_name='courses_created', 
                                on_delete=models.CASCADE)
    subcategory = models.ForeignKey(Subcategory, 
                                related_name='courses', 
                                on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    slug = models.SlugField(max_length=200, unique=True)
    course_duration = models.DurationField(null=True)
    rating = models.FloatField(default=0)
    views = models.PositiveIntegerField(default=0)
    photo = models.ImageField(null=True, upload_to=f'courses/{title}')
    likes = models.PositiveIntegerField(default=0)
    price = models.PositiveIntegerField(null=True)
    overview = models.TextField()
    draft = models.BooleanField(default=True)


    def __str__(self):
        return self.title

class Lesson(TimestampedModel):
    title = models.CharField(max_length=200)
    duration = models.DurationField()
    slug = models.SlugField(max_length=200, unique=True, null=True)
    course = models.ForeignKey(Course, 
                                related_name='lessons', 
                                on_delete=models.CASCADE)
    video = models.FileField(upload_to='video/', blank=True) #TODO Написать фильтрацию видео файлов по директориям, а не в общую диркеторию
    photo = models.ImageField(upload_to=f'lesson/{title}', null=True, blank=True)
    overview = models.TextField(null=True, blank=True)
    draft = models.BooleanField(default=True)

