FROM python:3.12

# Install SSH Client
RUN apt-get update && apt-get install -y openssh-client

# Ser environment variables
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Copy requirements.txt file
COPY requirements.txt /app/requirements.txt

# Install python dependencies
RUN pip install -r requirements.txt

# Copy the application to the working directory
COPY . /app

# Start the SSH tunnel
CMD python manage.py runserver 0.0.0.0:8000