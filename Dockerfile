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

COPY start-notebook.sh /usr/local/bin/
RUN chown $NB_UID:$NB_GID /usr/local/bin/start-notebook.sh
RUN chmod 700 /usr/local/bin/start-notebook.sh

RUN echo "$NB_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/notebook

# Configure container startup
ENTRYPOINT ["tini", "--"]
CMD ["start-notebook.sh"]

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

