import django
django.setup()
from educa.apps.courses.models import Category, Course, Lesson, Subcategory, Resolution
from django.core.files.storage import default_storage
from educa.apps.base.models import TmpFiles
from django.conf import settings
from rest_framework.exceptions import ParseError
from rest_framework.parsers import BaseParser
from pathlib import Path
import boto3
import os
from educa.apps.base.utils import *
import multiprocessing
import shutil
from datetime import timedelta
from pprint import pprint

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




def new_upload_path(data, course, i):
    category_id = data.get('category', None)
    subcategory_id = data.get('subcategory', None)
    category = Category.objects.get(pk=category_id)
    subcategory = Subcategory.objects.get(pk=subcategory_id)

    return os.path.join(
      category.slug,
      subcategory.slug,
      course.slug, 
      'lessons', 
      f'lesson_{i}')


def save_to_tmp(file, tmp_id):  
    """ Записывает бинарный файл в папку tmp"""
    directory_path = os.path.join(settings.TMP_VIDEO_PATH, str(tmp_id))
    Path(directory_path).mkdir(parents=True, exist_ok=True)
    new_file_full_path = os.path.join(directory_path, file.name)
    fd = os.open(new_file_full_path, os.O_WRONLY|os.O_CREAT)

    try:
        current_chunk = None
        while current_chunk != b'':
            current_chunk = file.read(settings.TMP_VIDEO_CHUNK_SIZE)
            os.write(fd, current_chunk)
    finally:
        os.close(fd)


def upload_file_tmp(request):
    ff = request.FILES.get('filepond')
    model = TmpFiles.objects.create(key=ff.name)
    path = os.path.join('tmp', str(model.id), ff.name)
    save_to_tmp(ff, model.id)
    # filename = default_storage.save(path, ff)
    # newpath = os.path.join(settings.MEDIA_URL, filename)
    # duration = probe(newpath)
    return model.id

def get_ffmpeg_resol_text(resol, path, filename):
    res_path = os.path.join(path,resol)
    Path(res_path).mkdir(parents=True, exist_ok=True)
    filepath = os.path.join(path, resol, filename)
    ffmpeg_resol = settings.VIDEO_RESOLUTION[resol]
    return (['-s', ffmpeg_resol, '-acodec', 'copy', filepath], filepath)

def get_cmd_text(path, filename):
    file_path=os.path.join(path,filename)
    cmd = ['ffmpeg', '-i', file_path]
    paths = []
    current_resolution = get_video_resolution(file_path)
    for key in settings.VIDEO_RESOLUTION:
        if current_resolution >= int(key):
            resol_text, resol_path = get_ffmpeg_resol_text(key, path, filename)
            cmd.extend(resol_text)
            paths.append(resol_path)
    return (cmd,paths)


# def popenAndCall(onExit, popen_args, on_exit_args):
#     def runInThread(onExit, popen_args, on_exit_args):
#         proc = subprocess.Popen(popen_args)
#         proc.wait()
#         onExit(**on_exit_args)
#         return
#     proc = multiprocessing.Process(target=runInThread, args = (onExit, popen_args, on_exit_args,))
#     proc.start()
#     return proc

def runInThread(onExit, popen_args, on_exit_args):
    proc = subprocess.run(popen_args)
    # proc.wait()
    onExit(**on_exit_args)


def create_video_resolutions(path, new_path, filename):
    """ 
    Создаёт видео в более низких разрешениях и сохраняет в storage
    """
    cmd, paths = get_cmd_text(path, filename)

    # proc = multiprocessing.Process(target=runInThread, args = (save_files_on_storage, cmd, on_exit_args))
    # proc.start()
    proc = subprocess.run(cmd)
    



def save_files_on_storage(path, new_path, filename):
    paths=[]
    resolutions=[]
    for key in settings.VIDEO_RESOLUTION:
        file_path = Path(path, key, filename)
        if not file_path.exists():
            continue
        
        with open(file_path, 'rb') as file:
            full_new_path = os.path.join(new_path,key,filename)
            default_storage.save(full_new_path, file)
        paths.append(full_new_path)
        resolutions.append(key)
    return (paths, resolutions)

def delete_file_tmp(path, id):
    dir_path = Path(path)
    instance = TmpFiles.objects.get(id=id)
    instance.delete()
    try:
        shutil.rmtree(dir_path, ignore_errors=True)
    except OSError as e:
        print("Error: %s : %s" % (dir_path, e.strerror))


def create_resolution_records(lesson, resolution_paths, resolutions):
    for path, resolution in zip(resolution_paths, resolutions):
        res = Resolution.objects.create(
            resolution=resolution,
            lesson=lesson,
            video=path
        )



def create_lessons(data, course):
    pprint(course)
    videos = data.get('videos', None)
    if videos:
        for video,i in zip(videos, range(len(videos))):
            path, filename = get_path_from_tmp(int(video))
            dirname = os.path.dirname(path)
            basename, video_format = get_basename_n_format(filename)
            new_path = new_upload_path(data,course,i)
            duration = get_video_duration(path)
            create_video_resolutions(dirname, new_path, filename)
            paths, resolutions = save_files_on_storage(dirname, new_path, filename)
            delete_file_tmp(dirname, video)
            lesson = Lesson.objects.create(
                title=basename,
                course=course,
                video_format=video_format,
                file_name=filename,
                duration=duration,
            )
            print(f'course_duration: {course.course_duration}')
            print(f'duration: {duration}')
            # pprint()
            course.course_duration += duration
            print(f'course_duration: {course.course_duration}')
            
            pprint(lesson)
            # course.save()
            create_resolution_records(lesson, paths, resolutions)
        course.save()
        return True
    
    

def create_poster(data, res):
    """ 
    Функция переносит постер из tmp в storage
    data - это request.data
    res - serialized.data
    """
    tmp_id = data.get('poster', None)
    if not tmp_id:
        return False
    path, filename = get_poster_path(data)
    dirname = os.path.dirname(path)
    new_path = new_poster_path(res, filename)  
    default_storage.save_from_path(path, new_path)

    delete_file_tmp(dirname, tmp_id)
    res.photo = new_path
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


def get_poster_path(data):
    """ 
    Возвращает путь к постеру в tmp/ и название файла
    Принимает:
        request - информация из фронта

    Возвращает:
        Результат выполнения функции get_path_from_tmp
    """ 
    id = int(data.get('poster', -1))
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
    
    path = f'{settings.TMP_VIDEO_PATH}/{id}/{model.key}'
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
        