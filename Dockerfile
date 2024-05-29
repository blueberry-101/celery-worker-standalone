FROM python:3.11-slim

# Create a non-root user
RUN useradd -m celeryuser

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Change to non-root user
USER celeryuser

# Command to run the Celery worker
CMD ["celery", "-A", "tasks", "worker", "--loglevel=info"]
