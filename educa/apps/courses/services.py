from django.template.defaultfilters import title
# from educa.apps.courses.models import Lesson
from django.core.files.storage import default_storage
from educa.apps.base.models import TmpFiles
from django.conf import settings
import random
from rest_framework.parsers import BaseParser
import boto3
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


import os
def get_upload_video_path(instance, filename):
    return os.path.join(
      instance.course.subcategory.category.slug,
      instance.course.subcategory.slug,
      instance.course.slug, 
      'lessons', 
      f'lesson_{1}',
      filename)

#FIXME Если id повторится, возникнет ошибка
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

def create_lessons(request):
    videos = request.data.get('videos', None)
    if videos:
        videos = literal_eval(videos)
        for video in videos:
            model = TmpFiles.objects.get(pk=id)
            path = f'tmp/{video}/{model.key}'
            basename = os.path.splitext(model)[0]
            Lesson.create(
                title=basename,

            )
        return None
    
    
    




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
    id = int(request.data.get('poster', None))
    if id is None:
        return None
    model = TmpFiles.objects.get(pk=id)
    path = f'tmp/{id}/{model.key}'
    return (path, model.key)


def new_poster_path(instance, filename):
    return os.path.join(
    instance.subcategory.category.slug,
    instance.subcategory.slug,
    instance.slug,
    filename)