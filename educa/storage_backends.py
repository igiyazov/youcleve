import os
from storages.backends.s3boto3 import S3Boto3Storage
from django.conf import settings
import logging
import boto3
from botocore.exceptions import ClientError

class MediaStorage(S3Boto3Storage):
    location = 'media'
    file_overwrite = False
    def __init__(self):
        super().__init__()
        self.s3_storage = super().connection

    def save_from_path(self, path, new_path):
        """ 
        Сохраняет локальный файл в storage
        """
        with open(path, 'rb') as file:
            super().save(new_path, file)

    def copy(self, from_path, to_path):
        """ 
        Функция копирует из одной директории storage в другую директорию storage
        """
        bucket_name = settings.AWS_STORAGE_BUCKET_NAME
        full_to_path = os.path.join(settings.AWS_LOCATION, 
                                    to_path)
        full_from_path = os.path.join(bucket_name, 
                                    settings.AWS_LOCATION, 
                                    from_path)
        self.s3_storage.Object(bucket_name, full_to_path)\
        .copy_from(CopySource=full_from_path)


    def move(self, from_path, to_path):
        self.copy(from_path,to_path)
        super().delete(from_path)

