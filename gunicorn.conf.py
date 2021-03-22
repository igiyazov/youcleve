command='/home/www/project/youcleve/v1/v1_env/bin/gunicorn'
pythonpath='/home/www/project/youcleve/v1/youcleve'
bind='unix:/run/gunicorn.sock'
workers=5
user='www'

raw_env=[
'DJANGO_SETTINGS_MODULE=educa.settings.prod',
'SECRET_KEY=pm0_l$n%oy9$z7c5%+ae6#8#9rl_p#8v0l6ngc6j!2#dd7sok',
'DB_NAME=youclevedb',
'DB_USER=youcleverole',
'DB_PASSWORD=ruslan010110',
'DB_HOST=127.0.0.1',
'DB_PORT=5432',
'AWS_ID=jDi9lFLj1QS-QbC47vhM',
'AWS_KEY=jK5ZZQ1XBG85RU8XJbEOklUD5EKj6QVKoxLJ38tD'
]
