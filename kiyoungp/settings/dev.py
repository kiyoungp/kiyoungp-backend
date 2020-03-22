from .base import *

DEBUG = True


STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'static'),
]
KIYOUNGP_HOST = '127.0.0.1'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'kiyoungp',
        'USER': 'postgres',
        'HOST': 'db',
        'PORT': '5432',
        'PASSWORD': 'password',
    }
}