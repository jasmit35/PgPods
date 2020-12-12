#  Start with the postgres 12 image on alpine Linux

FROM postgres:12-alpine

#  Environment variables in postgres base image
ENV POSTGRES_USER="postgres"
ENV POSTGRES_PASSWORD="postgres"
ENV LANG="en_US.utf8"
ENV POSTGRES_DB="pgdb"

#  Our environment variables
ENV PGBASE=/opt/app/pgpods
ENV PGDATA=$PGBASE/data/pgdb

#  Setup our init script in the image 
# COPY docker-entrypoint.sh /usr/local/bin/
# RUN set -x \
#     && chmod -R 755 /usr/local/bin/docker-entrypoint.sh \
#    && ln -sf /usr/local/bin/docker-entrypoint.sh / 

#  Expose the port the image defined
EXPOSE 5432

#  Our startup script
# ENTRYPOINT ["/docker-entrypoint.sh"]













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

