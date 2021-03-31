#  Start with the postgres 12 image on alpine Linux

FROM postgres:12-alpine

#  Environment variables in postgres base image
ENV LANG="en_US.utf8"

#  Environment variables
ENV PGBASE=/opt/app/postgres
ENV PGDATA=$PGBASE/data/pgdb

# RUN /usr/sbin/apt-get autoclean && apt-get -y update && apt-get -y upgrade && apt-get install -y procps

RUN set -x \
#  Adjust postgres space 
    && mkdir -p $PGDATA \
    && chmod -R 777 $PGDATA
#     && chown -R postgres:postgres $PGDATA \
#         && usermod --shell /bin/bash --home $PGBASE postgres
#  Update /etc/security/limits.conf
#         && echo "@postgres             soft    nofile          65536" >> /etc/security/limits.conf \
#         && echo "@postgres             hard    nofile          65536" >> /etc/security/limits.conf \
#         && echo "@postgres             soft    nproc           16384" >> /etc/security/limits.conf \
#         && echo "@postgres             hard    nproc           16384" >> /etc/security/limits.conf \
#         && echo "@postgres             soft    stack           32768" >> /etc/security/limits.conf \
#         && echo "@postgres             hard    stack           unlimited" >> /etc/security/limits.conf \

#  Expose the port the image defined
EXPOSE 5432


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
