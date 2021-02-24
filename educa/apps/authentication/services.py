from educa.apps.authentication.serializers import CustomUserListSerializer
from .models import CustomUser
from educa.apps.courses.models import Course
from educa.apps.courses.serializers import CourseListSerializer
class CustomUserService:
    def __init__(self, user, param):
        self.functions = {
            'courses':self.all_user_courses,
            'saved':self.saved_courses,
            # 'followings':self.all_followings,
        }
        self.user = user
        self.param = param
    
    def get_queryset(self):
        if self.param:
            return self.functions[self.param]()
        else:
            return []

    def all_user_courses(self):
        resp = CourseListSerializer(self.user.courses_created, many=True)
        return resp.data
    
    def saved_courses(self):
        resp = CourseListSerializer(self.user.profile.saved, many=True)
        return resp.data

    def all_followings(self):
        resp = CustomUserListSerializer(self.user.followings)
        return self.user.followings

def profile_info(user, param):
    return CustomUserService(user, param).get_queryset()