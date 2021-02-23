from django.db import models
from django.db.models.aggregates import Sum
from django.db.models.deletion import SET_DEFAULT
from django.db.models.fields import BooleanField
from educa.apps.authentication.models import CustomUser
from educa.apps.base.models import TimestampedModel

class FilteredQuerySet(models.QuerySet):
    def recommended(self):
        return self.order_by('-likes')

    def popular(self):
        return self.order_by('-views')

    def duration(self):
        return self.annotate(duration=Sum('lessons__duration'))\
                            .order_by('duration')
    
    def for_children(self):
        return self.filter(level__key='CH')

    def for_begginer(self):
        return self.filter(level__key='BG')

    def for_advanced(self):
        return self.filter(level__key='AD')

class FilteredManager(models.Manager):
    def get_queryset(self):
        return FilteredQuerySet(self.model, using=self._db).filter(draft=False)

    def recommended(self):
        return self.get_queryset().recommended()

    def popular(self):
        return self.get_queryset().popular()

    def duration(self):
        return self.get_queryset().duration()
    
    def for_children(self):
        return self.get_queryset().for_children()

    def for_begginer(self):
        return self.get_queryset().for_begginer()

    def for_advanced(self):
        return self.get_queryset().for_advanced()

class Level(models.Model):
    key = models.CharField(max_length=5)
    body = models.CharField(max_length=50)
    draft = BooleanField(default=True)

    def __str__(self):
        return self.body

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
    slug = models.SlugField(max_length=200, unique=True)
    course_duration = models.DurationField(null=True)
    rating = models.FloatField(default=0)
    views = models.PositiveIntegerField(default=0)
    photo = models.ImageField(null=True, upload_to=f'courses/{title}')
    likes = models.PositiveIntegerField(default=0)
    price = models.PositiveIntegerField(null=True)
    level = models.ForeignKey(
        Level,
        related_name='courses',
        on_delete=models.SET_NULL,
        null=True,
        blank=True
    )
    overview = models.TextField()
    draft = models.BooleanField(default=True)


    def __str__(self):
        return self.title

    objects = models.Manager()
    filtered = FilteredManager()

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
