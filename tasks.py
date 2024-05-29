# tasks.py
from celery import Celery

app = Celery('tasks')
app.config_from_object('celeryconfig')

