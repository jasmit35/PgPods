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


dc-build:
	docker-compose build --file=docker-compose-${ENV}.yaml
	docker tag pgpods_database:latest jasmit/pgpods-database:${VERSION}

db-build:
	cd $PODHOME/pgpods
	docker build --tag jasmit/pgpods-database:${VERSION} .

dc-run:
	docker-compose up -d --file=docker-compose-${ENV}.yaml

dc-stop:
	docker-compose stop database --file=docker

dc-logs:
	docker-compose log database --file=docker

dc-volume:
	docker volume create --name=db-data

push-image:
	docker image push jasmit/pgpods-server:${VERSION}


########################################

create-server:
	kubectl create -f ${PGHOME}/local/etc/server.yaml
	sleep 3
	kubectl get all

delete-server:
	kubectl delete -f ${PGHOME}/local/etc/server.yaml
	sleep 3
	kubectl get all
