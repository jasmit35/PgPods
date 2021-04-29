
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

########################################

echo-env:
	echo "Environment ${ENVIRONMENT}"
	echo "PODHOME ${PODHOME}"

volume-create:
	docker volume ls
	ifeq (${ENV}, "devl")
		docker volume create --name=postgres-data
	endif
	ifeq (${ENV}, "test")
		docker volume create --name=postgres-data
	endif
	ifeq (${ENV}, "prod")
		docker volume create --driver local \
		  --opt type=nfs \
		  --opt o=addr=192.168.1.16,nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,rw \
		  --opt device=192.168.1.16:/export/postgres/data \
		postgres-data
	endif
	docker volume ls

volume-ls:
	docker volume ls

volume-rm:
	docker volume ls
	docker volume rm postgres-data
	docker volume ls

########################################

build-image:
	docker-compose --file=${DCYAML} build
	docker tag pgpods_database:latest jasmit/pgpods-server:${VERSION}

push-image:
	docker image push jasmit/pgpods-server:${VERSION}

########################################

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
