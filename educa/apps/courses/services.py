from educa.apps.courses.models import Category, Course, Lesson, Subcategory
from django.core.files.storage import default_storage
from educa.apps.base.models import TmpFiles
from django.conf import settings
from rest_framework.exceptions import ParseError
from rest_framework.parsers import BaseParser
import boto3
import os
from ast import literal_eval

class PlainTextParser(BaseParser):
    media_type = 'text/plain'

    def parse(self, stream, media_type=None, parser_context=None):
        return stream.read()

def get_filtered(request,model):
    courses_filter = request.GET.get('filter', None)
    courses_level = request.GET.get('level', None)
    
    if courses_filter and courses_filter == 'recommended':
        model = model.recommended()
    elif courses_filter and courses_filter == 'popular':
        model = model.popular()
    elif courses_filter and courses_filter == 'durationup':
        model = model.duration('UP')
    elif courses_filter and courses_filter == 'durationdown':
        model = model.duration('DOWN')

    if courses_level and courses_level == 'CH':
        model = model.for_children()
    elif courses_level and courses_level == 'BG':
        model = model.for_begginer()
    elif courses_level and courses_level == 'AD':
        model = model.for_advanced()
    return model


# def get_unsaved_course_slug


def new_upload_video_path(request, filename, course, i):
    category_id = request.data.get('category', None)
    subcategory_id = request.data.get('subcategory', None)
    category = Category.objects.get(pk=category_id)
    subcategory = Subcategory.objects.get(pk=subcategory_id)

    return os.path.join(
      category.slug,
      subcategory.slug,
      course.slug, 
      'lessons', 
      f'lesson_{i}',
      filename)


def upload_file_tmp(request):
    ff = request.FILES.get('filepond')
    model = TmpFiles.objects.create(key=ff.name)
    path = os.path.join('tmp', str(model.id), ff.name)
    filename = default_storage.save(path, ff)
    newpath = os.path.join(settings.MEDIA_URL, filename)
    return model.id

def delete_file_tmp(request):
    id = int(request.data)
    model = TmpFiles.objects.get(pk=id)
    path = f'tmp/{id}/{model.key}'
    default_storage.delete(path)

def create_lessons(request, course):
    videos = request.data.get('videos', None)
    if videos:
        # breakpoint()
        # videos = literal_eval(videos)
        for video,i in zip(videos, range(len(videos))):
            path, model = get_path_from_tmp(int(video))
            basename = os.path.splitext(model)[0]
            new_path = new_upload_video_path(request, basename,course,i)
            default_storage.copy(path, new_path)
            default_storage.delete(path)
            Lesson.objects.create(
                title=basename,
                video=new_path,
                course=course
            )
        return True
    
    
    




def tmp_to_storage(from_path, to_path):
    session = boto3.session.Session()
    s3 = session.client(
        service_name='s3',
        endpoint_url=settings.AWS_S3_ENDPOINT_URL
    )
    copy_source = {
        'Bucket': settings.AWS_STORAGE_BUCKET_NAME,
        'Key': from_path
    }
    s3.copy(copy_source, settings.AWS_STORAGE_BUCKET_NAME, to_path)

    # pass
    # breakpoint()

# def create_lessons(course, lessons):
#     for id in lessons:
#         Lesson


def get_poster_path(request):
    """ 
    Возвращает путь к постеру в tmp/ и название файла
    Принимает:
        request - информация из фронта

    Возвращает:
        Результат выполнения функции get_path_from_tmp
    """ 
    id = int(request.data.get('poster', None) or -1)
    if id == -1:
        raise ParseError()
    return get_path_from_tmp(id)

def get_video_path(request):
    """ 
    Возвращает путь к видео в tmp/ и название файла
    Принимает:
        request - информация из фронта

    Возвращает:
        Результат выполнения функции get_path_from_tmp
    """ 
    id = int(request.data.get('video', None) or -1)
    if id == -1:
        raise ParseError()
    return get_path_from_tmp()



def get_path_from_tmp(id):
    """
    По id находит информацию о файле в бд. 
    Из полученной информации формируется путь к временнему файлу.
    Принимает:
        id - id записи

    Возвращает:
        path - путь к файлу
        model.key - название файла
    """
    model = TmpFiles.objects.get(pk=id)
    
    path = f'tmp/{id}/{model.key}'
    return (path, model.key)


def new_poster_path(instance, filename):
    return os.path.join(
    instance.subcategory.category.slug,
    instance.subcategory.slug,
    instance.slug,
    filename)


def delete_course_photo_from_server(id):
    course = Course.objects.get(pk=id)
    # breakpoint()
    default_storage.delete(course.photo.name)
    course.photo = None
    course.save()
        