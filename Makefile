
VERSION := "v0.3.2"

########################################

ENV := "${ENVIRONMENT}"

ifeq (${ENV}, "devl")
	PODHOME := "/Users/jeff/devl/pgpods"
endif

ifeq (${ENV}, "test")
	PODHOME := "/Users/jeff/test/pgpods"
endif

ifeq (${ENV}, "prod")
	PODHOME := "/home/jeff/prod/pgpods"
endif

DCYAML := "${PODHOME}/docker-compose.yaml"

echo-env:
	echo "Environment ${ENVIRONMENT}"
	echo "PODHOME ${PODHOME}"

storage-create:
	docker volume ls

ifeq (${ENV}, "devl")
	docker volume create --name=pgpods-storage
endif

ifeq (${ENV}, "test")
	docker volume create --name=pgpods-storage
endif

ifeq (${ENV}, "prod")
	docker volume create --driver local \
	--opt type=nfs \
	--opt o=addr=192.168.1.16,nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,rw \
	--opt device=192.168.1.16:/export/postgres/data \
    pgpods-storage	
endif

	docker volume ls

storage-ls:
	docker volume ls

storage-rm:
	docker volume ls
	docker volume rm pgpods-storage 
	docker volume ls

network-create:
	docker network create pgpods-network

network-ls:
	docker network ls 

network-rm:
	docker network rm pgpods-network



########################################

build:
	docker-compose --file=${DCYAML} build

run:
	docker-compose --file=${DCYAML} up -d

ps:
	docker-compose --file=${DCYAML} ps 

log:
	docker-compose --file=${DCYAML} logs database

exec:
	docker exec -it pgpods_database_1 /bin/bash

stop:
	docker-compose --file=${DCYAML} stop database

rm:
	docker-compose --file=${DCYAML} rm database

test-run: build run

push:
	docker tag pgpods_database:latest jasmit/pgpods-server:${VERSION}
	docker image push jasmit/pgpods-server:${VERSION}
