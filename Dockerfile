# Official BASE IMAGE
FROM python:3.10.4-alpine

# Prevent Python from writing pyc files to disc and buffering stdout and stderr respectively
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Working directory
ENV APP_HOME=/home/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install psycopg2 dependencies
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

# Copy pipenv files
COPY Pipfile Pipfile.lock $APP_HOME/

# Install the dependencies
RUN pip install --upgrade pip &&\
    pip install pipenv &&\
    pipenv install --system

# Copy PROJECT files
COPY . $APP_HOME
