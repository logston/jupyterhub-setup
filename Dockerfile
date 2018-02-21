FROM jupyterhub/singleuser:latest
MAINTAINER Paul Logston <paul.logston@gmail.com>

USER root

RUN apt-get -y update
RUN apt-get install -y \
        postgresql \
        postgresql-contrib

