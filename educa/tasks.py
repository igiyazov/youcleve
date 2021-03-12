from celery.schedules import crontab
from django.utils import timezone
from celery import Celery

app = Celery('tasks', broker='redis://localhost')

@app.task
def check():
    print('I am checking your stuff')
app.conf.beat_schedule = {
    'run-me-every-ten-seconds': {
        'task': 'tasks.check',
        'schedule': 3.0
    }
}