FROM jupyterhub/singleuser:latest
MAINTAINER Paul Logston <paul.logston@gmail.com>

USER root

RUN wget https://github.com/logston/py-for-or/raw/master/data/bank.sql

RUN apt-get -y update
RUN apt-get install -y \
        postgresql \
        postgresql-contrib

RUN echo "local all all trust" > /etc/postgresql/9.5/main/pg_hba.conf

RUN service postgresql start && \
      psql -U postgres -c "CREATE ROLE jovyan CREATEDB LOGIN ENCRYPTED PASSWORD 'supersecret';" && \
      psql -U jovyan -d postgres -c "CREATE DATABASE jovyan;" && \
      psql -U jovyan -c "CREATE DATABASE bank;" && \
      psql -U jovyan -d bank -f bank.sql

RUN rm bank.sql
RUN rm -rf work

RUN echo "service postgresql start" > start-notebook.sh.new
RUN cat /usr/local/bin/start-notebook.sh >> start-notebook.sh.new
RUN mv start-notebook.sh.new /usr/local/bin/start-notebook.sh

RUN rm -rf start-notebook.sh.new

