from celery import Celery

app = Celery('Finksta')  # Change to 'Finksta' if that is your app name
app.config_from_object('celeryconfig')

