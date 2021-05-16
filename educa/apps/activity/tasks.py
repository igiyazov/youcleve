from huey.contrib.djhuey import periodic_task
from huey import crontab
from educa.apps.activity.models import Subscription
from datetime import datetime, timedelta
from termcolor import colored

@periodic_task(crontab(minute='*/1'))
def every_day():
    eta = datetime.now()
    subs = Subscription.objects.filter(sub_end__lte=eta)
    print(f'For delete {colored(subs.values("user"), "red")}')
    subs.delete()

    
    