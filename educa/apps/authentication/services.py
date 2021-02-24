from .models import CustomUser
from educa.apps.courses.models import Course
class CustomUserService:
    def __init__(self, user, param):
        self.functions = {
            'courses':self.all_user_courses,
            'saved':self.saved_courses,
            'followings':self.all_followings,
        }
        self.user = user
        self.param = param
    
    def get_queryset(self):
        if self.param:
            return self.functions[self.param]()
        else:
            return []

    def all_user_courses(self):
        return self.user.courses
    
    def saved_courses(self):
        return self.user.saved

    def all_followings(self):
        return self.user.followings

def profile_info(user, param):
    return CustomUserService(user, param).get_queryset()