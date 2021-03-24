from celery import Celery
from celery import shared_task

@shared_task
def test():
    print('Testing my Celery')