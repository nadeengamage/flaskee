# Python support can be specified down to the minor or micro version
# (e.g. 3.7).
# OS Support also exists for jessie & stretch (slim and full).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.
FROM python:3.7

ENV TZ=Asia/Colombo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

LABEL Name=Flaskee
EXPOSE 5000

RUN mkdir /app
WORKDIR /app
ADD . /app

RUN apt-get update
RUN apt-get install -y apt-utils libpq-dev python-dev

# Install requirements
RUN pip install -r requirements.txt

CMD [ "sh", "serve.sh" ]