#  Docker file to create my main Postgres database

FROM postgres:13.2


#  Additional software we need in the image
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nfs-common


#  Environment variables that affect the base image and the db creation
ENV PGBASE=/opt/app/postgres

ENV LANG="en_US.utf8"
ENV PGDATA=$PGBASE/data/database
ENV POSTGRES_USER="postgres"
ENV POSTGRES_PASSWORD="postgres"

 
#  Expose the port the image defined
EXPOSE 5432


#  Copy directory structure and common code to both users 
WORKDIR $PGBASE 
COPY local local

ENV PODBASE=/opt/app/pgpods
WORKDIR $PODBASE 
COPY local local





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
