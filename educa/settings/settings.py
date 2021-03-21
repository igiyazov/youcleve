from datetime import timedelta
from pathlib import Path
import os

BASE_DIR = Path(__file__).resolve().parent.parent


SECRET_KEY = 'pm0_l$n%oy9$z7c5%+ae6#8#9rl_p#8v0)l6ngc6j!2#dd7sok'

DEBUG = True

ALLOWED_HOSTS = ['gentle-reef-53739.herokuapp.com', 
                '127.0.0.1', 
                '0.0.0.0', 
                'localhost', 
                '84.201.146.113',
                '192.168.0.105',
                '192.168.0.105:8000',
		        '84.201.146.113'
                ]



INSTALLED_APPS = [
    'educa.apps.authentication',

    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.postgres',

    'rest_framework',
    'djoser',
    'rest_framework_simplejwt',
    'rest_framework_simplejwt.token_blacklist',
    'corsheaders',
    'storages',


    'educa.apps.courses',
    'educa.apps.base',
    'drf_yasg',
    'educa.apps.activity',
    'educa.apps.search',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
]

ROOT_URLCONF = 'educa.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'educa.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.1/ref/settings/#databases

# LOCAL
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'educadb',
        'USER': 'educarole',
        'PASSWORD': 'ruslan010110',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}

# DEPLOY
# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.postgresql',
#         'NAME': 'dd9udtfmrvqdnd',
#         'USER': 'rwtchchpwwiowz',
#         'PASSWORD': '586532ea4459daf3f645bf1037e8ab9a3823c1026cb1d10d136ec678cb5322eb',
#         'HOST': 'ec2-18-204-101-137.compute-1.amazonaws.com',
#         'PORT': '5432',
#     }
# }
# postgres://rwtchchpwwiowz:586532ea4459daf3f645bf1037e8ab9a3823c1026cb1d10d136ec678cb5322eb@ec2-18-204-101-137.compute-1.amazonaws.com:5432/dd9udtfmrvqdnd
# pg_dump --host ec2-18-204-101-137.compute-1.amazonaws.com --port 5432 --user rwtchchpwwiowz dd9udtfmrvqdnd > backup.sql
# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': BASE_DIR / 'db.sqlite3',
#     }
# }

#yandex

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.postgresql',
#         'NAME': 'youclevedb',
#         'USER': 'youcleverole',
#         'PASSWORD': 'ruslan010110',
#         'HOST': '127.0.0.1',
#         'PORT': '5432',
#     }
# }


# Password validation
# https://docs.djangoproject.com/en/3.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.1/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')


# ************************************#

# MEDIA_ROOT = BASE_DIR / 'educa/media/'

MEDIA_URL = '/media/'

AUTH_USER_MODEL = 'authentication.CustomUser'

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_simplejwt.authentication.JWTAuthentication',
    ),
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.LimitOffsetPagination',
    'PAGE_SIZE': 20
}



# CORS_ORIGIN_WHITELIST = [
#     "http://localhost:8080",
#     "http://192.168.0.104",
#     "http://192.168.0.104:8082",
#     "http://0.0.0.0:8000"    
# ]

CORS_ALLOW_ALL_ORIGINS = True



##### AWS
AWS_ACCESS_KEY_ID = 'jDi9lFLj1QS-QbC47vhM'
AWS_SECRET_ACCESS_KEY = 'jK5ZZQ1XBG85RU8XJbEOklUD5EKj6QVKoxLJ38tD'
AWS_STORAGE_BUCKET_NAME = 'youcleve'
AWS_S3_ENDPOINT_URL = 'https://storage.yandexcloud.net'
AWS_QUERYSTRING_AUTH = False

AWS_LOCATION = 'media'


MEDIA_URL = f'https://{AWS_S3_ENDPOINT_URL}/{AWS_LOCATION}/'
# STATICFILES_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'

DEFAULT_FILE_STORAGE = 'educa.storage_backends.MediaStorage'



SIMPLE_JWT = {
    'ACCESS_TOKEN_LIFETIME': timedelta(minutes=5),
    'REFRESH_TOKEN_LIFETIME': timedelta(days=1),
    'AUTH_HEADER_TYPES': ('JWT',),
}
