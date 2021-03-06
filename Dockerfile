FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

# Build instructions..
RUN apt-get -y update
RUN apt-get install -y gcc python3 python3-pip git python3-psycopg2 libpcre3 libpcre3-dev
RUN pip3 install uwsgi boto3 flask
RUN git clone "https://github.com/cjn0019/python-image-gallery.git"
RUN useradd -m pyserver
RUN echo '(9!1bT=*lgmKkeFu#8<HlxyXJ&|W$Y]G'> /password

EXPOSE 5555
USER pyserver

# Boot command


# start/enable services
WORKDIR "/python-image-gallery"
# ENV FLASK_APP=app.py
# ENV FLASK_ENV=development
# CMD ["uwsgi", "--http", ":5555", "--module", "app:app", "--master", "--processes", "4", "--threads", "2"]
CMD ["uwsgi", "--http", ":8888", "--manage-script-name", "--mount", "/=gallery.ui.app:app"]