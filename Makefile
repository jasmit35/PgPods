#
ENV := "devl"
# ENV := "test"
# ENV := "prod"

VERSION := "v0.3.0"

########################################

ifeq (${ENV}, "devl")
	PODHOME := "/Users/jeff/devl/pgpods"
	DCYAML := "${PODHOME}/docker-compose-devl.yaml"
endif

ifeq (${ENV}, "test")
	PODHOME := "/Users/jeff/test/pgpods"
	DCYAML := "${PODHOME}/docker-compose-test.yaml"
endif

ifeq (${ENV}, "prod")
	PODHOME := "/home/jeff/prod/pgpods"
	DCYAML := "${PODHOME}/docker-compose-prod.yaml"
endif

########################################

create-volume:
	docker volume create --name=postgres-data

remove-volume:
	docker volume rm db-data

push-image:
	docker image push jasmit/pgpods-server:${VERSION}

########################################

dc-build:
	docker-compose --file=${DCYAML} build
	docker tag pgpods_database:latest jasmit/pgpods-server:${VERSION}

dc-run:
	docker-compose --file=${DCYAML} up -d

dc-ps:
	docker-compose --file=${DCYAML} ps 

dc-log:
	docker-compose --file=$DCYAML log database

dc-exec:
	docker exec -it pgpods_database_1 /bin/bash

dc-stop:
	docker-compose --file=${DCYAML} stop database

dc-rm:
	docker-compose --file=${DCYAML} rm database
