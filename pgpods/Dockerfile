#  Docker file to create my main Postgres database
#  Start with the postgres 12 image on alpine Linux

FROM postgres:12-alpine

#  Environment variables in postgres base image
ENV POSTGRES_USER="postgres"
ENV POSTGRES_PASSWORD="postgres"
ENV LANG="en_US.utf8"
ENV POSTGRES_DB="common"
ENV PGDATA=/opt/app/postgres/data/database

#  Our environment variables
ENV PGBASE=/opt/app/postgres
ENV PODBASE=/opt/app/pgpods

#  Copy our code into the image
WORKDIR $PODBASE 
COPY local local

#  Expose the port the image defined
EXPOSE 5432





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
