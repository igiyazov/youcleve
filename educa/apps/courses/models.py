from os import times
import os
from django.db import models
from django.utils.text import slugify 
from django.db.models.aggregates import Sum
from django.db.models.deletion import SET_DEFAULT
from django.utils.timezone import timedelta
from django.db.models.fields import BooleanField, TimeField
from educa.apps.authentication.models import CustomUser
from educa.apps.base.models import TimestampedModel

class FilteredQuerySet(models.QuerySet):
    def recommended(self):
        # breakpoint()
        return self.order_by('-likes')

    def popular(self):
        return self.order_by('-views')

    def duration(self, arrow):
        # res = self.annotate(duration=Sum('lessons__duration'))
        if arrow == 'UP':
            return self.order_by('course_duration')
        else:
            return self.order_by('-course_duration') 
    
    def for_children(self):
        return self.filter(level__key='CH')

    def for_begginer(self):
        return self.filter(level__key='BG')

    def for_advanced(self):
        return self.filter(level__key='AD')

class FilteredManager(models.Manager):
    def get_queryset(self):
        return FilteredQuerySet(self.model, using=self._db)\
                                .filter(draft=False)

    def recommended(self):
        return self.get_queryset().recommended()

    def popular(self):
        return self.get_queryset().popular()

    def duration(self, arrow):
        return self.get_queryset().duration(arrow)
    
    def for_children(self):
        return self.get_queryset().for_children()

    def for_begginer(self):
        return self.get_queryset().for_begginer()

    def for_advanced(self):
        return self.get_queryset().for_advanced()

class Level(models.Model):
    key = models.CharField(max_length=5)
    body = models.CharField(max_length=50)
    draft = BooleanField(default=False)

    def __str__(self):
        return self.body

class Category(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(max_length=200, unique=True)
    description = models.TextField(null=True, blank=True)
    photo = models.ImageField(null=True, upload_to='category/')
    draft = models.BooleanField(default=False)

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
    draft = models.BooleanField(default=False)

    class Meta:
        ordering = ['title']

    def __str__(self):
        return self.title

class Course(TimestampedModel):
    owner = models.ForeignKey(CustomUser, 
                                related_name='courses_created', 
                                on_delete=models.SET_NULL, 
                                null=True)
    category = models.ForeignKey(Category, 
                                related_name='courses', 
                                on_delete=models.SET_NULL,
                                null=True)
    subcategory = models.ForeignKey(Subcategory, 
                                related_name='courses', 
                                on_delete=models.SET_NULL,
                                null=True)
    title = models.CharField(max_length=200)
    slug = models.SlugField(max_length=200, unique=True, null=True)
    course_duration = models.DurationField(default=timedelta())
    rating = models.FloatField(default=0)
    views = models.PositiveIntegerField(default=0)
    photo = models.ImageField(null=True, upload_to=f'courses/{title}')
    likes = models.PositiveIntegerField(default=0)
    # price = models.PositiveIntegerField(null=True)
    level = models.ForeignKey(
        Level,
        related_name='courses',
        on_delete=models.SET_NULL,
        null=True,
        blank=True
    )
    overview = models.TextField(null=True, blank=True)
    draft = models.BooleanField(default=False)


    def __str__(self):
        return self.title

    objects = models.Manager()
    filtered = FilteredManager()

    def save(self, *args, **kwargs): 
        super(Course, self).save(*args, **kwargs)
        self.slug = slugify(f'{self.title} {self.id}')
        super(Course, self).save(update_fields=['slug'])


class Lesson(TimestampedModel):
    title = models.CharField(max_length=1000)
    duration = models.DurationField(default=timedelta(minutes=0))
    slug = models.SlugField(max_length=1000, unique=True, null=True)
    course = models.ForeignKey(Course, 
                                related_name='lessons', 
                                on_delete=models.CASCADE)
    photo = models.ImageField(upload_to='photo/', null=True, blank=True)
    overview = models.TextField(null=True, blank=True)
    number = models.IntegerField(default=-1)
    size = models.PositiveIntegerField(default=0)
    file_name = models.TextField(default=None, null=True)
    video_format = models.CharField(max_length=50, null=True, blank=True)
    draft = models.BooleanField(default=False)

    @property
    def filename(self):
        return self.file_name or 'Unknown'

    def save(self, *args, **kwargs): 
        super(Lesson, self).save(*args, **kwargs)
        slug = f'{self.course.slug} {self.title} {self.id}'
        self.slug = slugify(slug) 
        self.title = self.filename
        # self.course.course_duration += self.duration
        super(Lesson, self).save(update_fields=['slug'])


class Resolution(models.Model):
    resolution = models.CharField('Video resolution', max_length=20)
    video = models.FileField(blank=True, max_length=1500) 
    lesson = models.ForeignKey(Lesson, related_name='resolutions', on_delete=models.CASCADE)