from django.db.models.query import QuerySet
from educa.apps.authentication.serializers import CustomUserListSerializer, ProfileListSerializer
from .models import CustomUser, Profile
from educa.apps.courses.models import Course
from educa.apps.courses.serializers import CourseListSerializer
from educa.querydeb import query_debugger

class CustomUserService:
    def __init__(self, user, param):
        self.functions = {
            'courses':self.all_user_courses,
            'saved':self.saved_courses,
            'followings':self.all_followings,
            'following-courses':self.all_followings_courses,
        }
        self.user = user
        self.param = param
    
    def get_queryset(self):
        '''Вызывает, в зависимости от param нужную функцию 
            из словаря
        '''
        if self.param:
            return self.functions[self.param]()
        else:
            return []

    #TODO Optimize
    def all_user_courses(self):
        '''Собственные курсы определенного пользователя'''
        resp = CourseListSerializer(self.user.courses_created, many=True)
        return resp.data

    #TODO Optimize
    def saved_courses(self):
        '''Сохраненные курсы пользователя'''
        resp = CourseListSerializer(self.user.profile.saved, many=True)
        return resp.data

    def all_followings(self):
        '''Список всех подписок пользователя'''
        # breakpoint()
        resp = ProfileListSerializer(self.user.profile.followings.select_related('custom_user'), many=True)
        return resp.data
    
    #TODO Optimize. Now 60 hits to DB
    def all_followings_courses(self):
        '''Курсы пользователей на кого подписан данный пользователь '''
        
        followings = self.user.profile.followings\
                            .select_related('custom_user')
                            # .prefetch_related('custom_user__courses_created')
        courses = Course.filtered.none()
        for flw in followings:
            courses |= flw.custom_user.courses_created.all()
        serialize = CourseListSerializer(courses.order_by('-created_at'), many=True)
        return serialize.data


def profile_info(user, param):
    return CustomUserService(user, param).get_queryset()


