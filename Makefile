#
ENV := "devl"
# ENV := "test"
# ENV := "prod"

VERSION := "v0.2.0"

########################################

ifeq (${ENV}, "devl")
	PODHOME := "/Users/file==/devl/pgpods"
endif

ifeq (${ENV}, "test")
	PODHOME := "/Users/file==/test/pgpods"
endif

ifeq (${ENV}, "prod")
	PODHOME := "/home/file==/prod/pgpods"
endif

########################################

create-volume:
	docker volume create --name=db-data

push-image:
	docker image push jasmit/pgpods-server:${VERSION}

########################################

dc-build:
	docker-compose --file=docker-compose-${ENV}.yaml build
	docker tag pgpods_database:latest jasmit/pgpods-database:${VERSION}

dc-run:
	docker-compose --file=docker-compose-${ENV}.yaml up -d

dc-ps:
	docker-compose --file=docker-compose-${ENV}.yaml ps 

dc-log:
	docker-compose --file=docker-compose-${ENV}.yaml log database

dc-stop:
	docker-compose --file=docker-compose-${ENV}.yaml stop database
