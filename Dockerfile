FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

# Build instructions..
RUN apt-get -y update
RUN apt-get install -y gcc python3 python3-pip git python3-psycopg2 
RUN pip3 install uwsgi boto3 flask
RUN git clone "https://github.com/cjn0019/python-image-gallery.git"


# Boot command


# start/enable services
WORKDIR "/python-image-gallery"
# ENV FLASK_APP=app.py
# ENV FLASK_ENV=development
# CMD ["uwsgi", "--http", ":5555", "--module", "app:app", "--master", "--processes", "4", "--threads", "2"]
CMD ["uwsgi", "-s", "localhost:5555", "--manage-script-name", "--mount", "/=gallery.ui.app:app"]