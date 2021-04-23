#
ENV := "devl"
# ENV := "test"
# ENV := "prod"

VERSION := "v0.3.1"

########################################

ifeq (${ENV}, "devl")
	PODHOME := "/Users/jeff/devl/pgpods"
	DCYAML := "${PODHOME}/docker-compose.yaml"
endif

ifeq (${ENV}, "test")
	PODHOME := "/Users/jeff/test/pgpods"
	DCYAML := "${PODHOME}/docker-compose.yaml"
endif

ifeq (${ENV}, "prod")
	PODHOME := "/home/jeff/prod/pgpods"
	DCYAML := "${PODHOME}/docker-compose.yaml"
endif

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

dc-run:
	docker-compose --file=${DCYAML} up -d

dc-ps:
	docker-compose --file=${DCYAML} ps 

dc-log:
	docker-compose --file=${DCYAML} logs database

dc-exec:
	docker exec -it pgpods_database_1 /bin/bash

dc-stop:
	docker-compose --file=${DCYAML} stop database

dc-rm:
	docker-compose --file=${DCYAML} rm database
