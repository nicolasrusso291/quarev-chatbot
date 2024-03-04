# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /usr/src/app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN apt update && apt install -y poppler-utils
# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Run the gunicorn server on port 8000
CMD ["gunicorn", "-b", "0.0.0.0:8000", "script:app"]
