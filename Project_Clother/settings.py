"""
Django settings for Project_Clother project.

Generated by 'django-admin startproject' using Django 5.0.4.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.0/ref/settings/
"""

from pathlib import Path
import os

import pymysql
pymysql.install_as_MySQLdb()


# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "static"),]
# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-o77_hvf!u$fn=51&076uyj9pz$wb+p1-h_kz_w-iqndj*ka6a-'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

#DEBUG = os.getenv('DEBUG', 'False').lower() in ['true', '1']




# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'dashboard', 
    'django.contrib.humanize', 
    'Home', 

    'django.contrib.sites', 
    'allauth',
    'allauth.account',
    'allauth.socialaccount',
    'allauth.socialaccount.providers.google',
    'allauth.socialaccount.providers.facebook',

    'social_django',
    'django_extensions',
]

SITE_ID = 1


AUTHENTICATION_BACKENDS = (
    'social_core.backends.google.GoogleOAuth2',  
    'django.contrib.auth.backends.ModelBackend',
)


import os

CLIENT_ID = os.getenv('GOOGLE_OAUTH_CLIENT_ID')
CLIENT_SECRET = os.getenv('GOOGLE_OAUTH_CLIENT_SECRET')




SOCIALACCOUNT_LOGIN_ON_GET = True



# ALLOWED_HOSTS = ['localhost', '127.0.0.1']
#ALLOWED_HOSTS = ['localhost', '127.0.0.1', 'shop-quan-ao-git-nvthanhty-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com',shop-quan-ao-git-doanopenshift-dev.apps.sandbox-m4.g2pi.p1.openshiftapps.com]
#ALLOWED_HOSTS = [
#    'localhost',
 #   '127.0.0.1',
 #   'shop-quan-ao-git-nvthanhty-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com',
#    'shop-quan-ao-git-doanopenshift-dev.apps.sandbox-m4.g2pi.p1.openshiftapps.com'
#]

# ALLOWED_HOSTS = [
#     'localhost',
#     '127.0.0.1',
#     'shop-quan-ao-git-nvthanhty-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com',
#     'shop-quan-ao-git-doanopenshift-dev.apps.sandbox-m4.g2pi.p1.openshiftapps.com',
#     'shop-clother-git-nvthanhty-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com'
# ]

ALLOWED_HOSTS = ['*']

# CSRF_TRUSTED_ORIGINS = [
#     'https://shop-quan-ao-git-4-nvthanhty122-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com',
# ]

CSRF_TRUSTED_ORIGINS = ['https://shop-quan-ao-git-clothingshop-dev.apps.sandbox-m3.1530.p1.openshiftapps.com',]



LOGIN_REDIRECT_URL = '/'
LOGOUT_REDIRECT_URL = '/'


ACCOUNT_EMAIL_VERIFICATION = 'none'  
ACCOUNT_EMAIL_REQUIRED = True
ACCOUNT_USERNAME_REQUIRED = False
ACCOUNT_AUTHENTICATED_LOGIN_REDIRECTS = False  
ACCOUNT_LOGIN_ON_EMAIL_CONFIRMATION = True  


MIDDLEWARE = [
    'whitenoise.middleware.WhiteNoiseMiddleware',

    
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'allauth.account.middleware.AccountMiddleware',
]


SOCIALACCOUNT_PROVIDERS = {
    'google': {
        'SCOPE': ['profile', 'email'],
        'AUTH_PARAMS': {'access_type': 'online'},
        'OAUTH_PKCE_ENABLED': True,
    }
}



ROOT_URLCONF = 'Project_Clother.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],  
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


WSGI_APPLICATION = 'Project_Clother.wsgi.application'


# Database
# https://docs.djangoproject.com/en/5.0/ref/settings/#databases

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': BASE_DIR / 'db.sqlite3',
#     }
# }

import os

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.getenv('DB_NAME', 'DB_Shop'),
        'USER': os.getenv('DB_USER', 'hothanhty'),
        'PASSWORD': os.getenv('DB_PASSWORD', 'tyho7236'),
        'HOST': os.getenv('DB_HOST', 'mysql'), 
        'PORT': os.getenv('DB_PORT', '3306'),
        # 'OPTIONS': {
        #     'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
        #     'charset': 'utf8mb4',
        # },
    }
}




# Password validation
# https://docs.djangoproject.com/en/5.0/ref/settings/#auth-password-validators

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
# https://docs.djangoproject.com/en/5.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.0/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'


MEDIA_URL ='/media/'
MEDIA_ROOT =os.path.join(BASE_DIR, 'media')

# Default primary key field type
# https://docs.djangoproject.com/en/5.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

LOGIN_URL = 'login'

# import os

# PORT = os.getenv('PORT', '8080')
# SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
# CSRF_TRUSTED_ORIGINS = [
#     'https://shop-clother-git-nvthanhty-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com'
# ]

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['console'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
