from celery import Celery
from celery.utils.log import get_task_logger
from educa.apps.courses.models import Course
from celery import shared_task
from .services import create_lessons
log = get_task_logger(__name__)

@shared_task
def async_create_lessons(data, course_id):
    course = Course.objects.get(pk=course_id)
    result = create_lessons(data, course)
    log.info('create_lesson result is %s', result)