#  Docker file to create my Postgres server 
#  Start with the postgres 12 image on alpine Linux

FROM postgres:12-alpine

#  Environment variables in postgres base image
ENV POSTGRES_USER="postgres"
ENV POSTGRES_PASSWORD="postgres"
ENV LANG="en_US.utf8"
ENV POSTGRES_DB="common"
# ENV PGDATA=/opt/app/postgres/data/database
# ENV PGDATA=$(pwd)/data

#  Our environment variables
ENV PGBASE=/opt/app/postgres
ENV PODBASE=/opt/app/pgpods

#  Update the image
# USER root
# RUN apt-get autoclean && apt-get -y update && apt-get -y upgrade
# RUN set -x \
# 	&& chown -vR postgres:postgres $PGBASE \
# 	&& chmod -vR 777 $PGBASE 

#  Copy our code into the image
USER ${POSTGRES_USER}
WORKDIR $PODBASE 
COPY local local

#  Expose the port the image defined
EXPOSE 5432

#  Our startup script
ENTRYPOINT ["local/bin/docker-entrypoint.sh"]




#  ENV POSTGRES_INITDB_XLOGDIR="/opt/pgpods/pg_xlog/pgdb"
#  ENV POSTGRES_INITDB_ARGS=""

#  ENV PGHOME=$PGBASE/product/pgsql-12
#  ENV PGLOCAL=$PGBASE/local
#  ENV PGTABLESPACES=$PGBASE/data/tablespaces
#  ENV PGBACKUP=$PGBASE/backup
#  ENV PGLOG=$PGBASE/log
#  ENV PGXLOG=$PGBASE/pg_xlog/pgdb
#  ENV PGPROPERTIES=$PGBASE/postgres.properties

#  ENV PATH=$PATH:$PGHOME/bin:$PGLOCAL/bin
