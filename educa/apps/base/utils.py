import os
import subprocess
import json
from django.conf import settings
import datetime
import cv2
from moviepy.editor import *
import moviepy

def get_basename(path):
    '''
    Возвращает название файла

    Принимает:
    file.txt

    Возвращает:
    file
    '''
    return os.path.splitext(path)[0]

def get_format(path):
    '''
    Возвращает формат файла

    Принимает:
    file.txt

    Возвращает:
    txt
    '''
    return path.split('.')[-1]

def get_basename_n_format(path):
    '''
    Возвращает название и формат файла 

    Принимает:
    path/new/file.txt

    Возвращает:
    (file,txt)
    '''
    return (get_basename(path), get_format(path))


def clean_path(file_path):
    if file_path.startswith('/'):
        return file_path[1:]
    return file_path

def get_video_duration(file_path):
    file_path = clean_path(file_path)
    # file_path = os.path.join(settings.MEDIA_URL, file_path)

    cap = cv2.VideoCapture(file_path)
    fps = cap.get(cv2.CAP_PROP_FPS) 
    frame_count = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
    duration = frame_count/fps    
    return datetime.timedelta(seconds=duration)

def get_video_resolution(file_path):
    file_path = clean_path(file_path)
    cap = cv2.VideoCapture(file_path)
    height = cap.get(cv2.CAP_PROP_FRAME_HEIGHT)
    return height

# def make_new_quality(new_height, file_path):
#     clip = VideoFileClip(file_path)
#     new_width = math.ceil((new_height/clip.h)*clip.w)
#     try:
#         moviepy.video.io.ffmpeg_tools.ffmpeg_resize(inputV, "480.mp4", (new_width, new_height))
#     except:
#         return False
#     return True

# def make_1080(file_path):
#     return make_new_quality(1080, file_path)

# def make_720(file_path):
#     return make_new_quality(720, file_path)

# def make_480(file_path):
#     return make_new_quality(480, file_path)

# def make_360(file_path):
#     return make_new_quality(360, file_path)





# def get_video_duration(file_path):
    
#     if file_path.startswith('/'):
#         file_path = file_path[1:]
#     file_path = os.path.join(settings.MEDIA_URL, file_path)
    
#     result = subprocess.run(["ffprobe", "-v", "error", "-show_entries",
#                              "format=duration", "-of",
#                              "default=noprint_wrappers=1:nokey=1", file_path],
#         stdout=subprocess.PIPE,
#         stderr=subprocess.STDOUT)

#     time_in_seconds = float(result.stdout)
#     return datetime.timedelta(seconds=time_in_seconds)
