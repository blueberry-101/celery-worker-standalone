FROM python:3.11.4-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install build dependencies
RUN apk add --no-cache build-base

# Install pip dependencies
RUN pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy application files
COPY . .

# Set the working directory
WORKDIR /app

# Define the entrypoint for the Celery worker
ENTRYPOINT [ "celery", "-A", "Finksta", "worker", "--loglevel=info" ]
