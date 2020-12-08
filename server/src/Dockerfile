#  Start with the postgres 12 image on alpine Linux

FROM postgres:12-alpine

#  Environment variables in postgres base image
ENV POSTGRES_USER="postgres"
ENV POSTGRES_PASSWORD="postgres"

# ENV PGHOST=localhost
ENV LANG="en_US.utf8"
ENV POSTGRES_DB="pgdb"

ENV PGBASE=/opt/app/pgpods
ENV PGDATA=$PGBASE/data/pgdb
 













# ENV POSTGRES_INITDB_XLOGDIR="/opt/pgpods/pg_xlog/pgdb"
# ENV POSTGRES_INITDB_ARGS=""

# ENV PGHOME=$PGBASE/product/pgsql-12
# ENV PGLOCAL=$PGBASE/local
# ENV PGTABLESPACES=$PGBASE/data/tablespaces
# ENV PGBACKUP=$PGBASE/backup
# ENV PGLOG=$PGBASE/log
# ENV PGXLOG=$PGBASE/pg_xlog/pgdb
# ENV PGPROPERTIES=$PGBASE/postgres.properties

# ENV PATH=$PATH:$PGHOME/bin:$PGLOCAL/bin

#  Expose the port the image defined, we will remap it with the run command
# EXPOSE 5432

