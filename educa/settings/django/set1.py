from datetime import timedelta
from pathlib import Path
import os

BASE_DIR = Path(__file__).resolve().parent.parent


SECRET_KEY = os.getenv('SECRET_KEY')
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
