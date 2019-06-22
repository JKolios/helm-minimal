FROM python:3.7.3-alpine3.9
RUN apk add build-base
ADD application.py Pipfile Pipfile.lock /
RUN pip install pipenv
RUN pipenv sync
EXPOSE 8080
ENTRYPOINT [ "pipenv", "run", "python", "application.py" ]
