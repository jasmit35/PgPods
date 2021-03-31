#
ENV := "devl"
# ENV := "test"
# ENV := "prod"

VERSION := "v0.1.7"

########################################

ifeq (${ENV}, "devl")
	PODHOME := "/Users/jeff/devl/pgpods"
endif

ifeq (${ENV}, "test")
	PODHOME := "/Users/jeff/test/pgpods"
endif

ifeq (${ENV}, "prod")
	PODHOME := "/home/jeff/prod/pgpods"
endif


dbc-build:
	docker-compose build
	docker tag pgpods_database:latest jasmit/pgpods-database:${VERSION}

db-build:
	cd $PODHOME/pgpods
	docker build --tag jasmit/pgpods-database:${VERSION} .

dbc-run:
	docker-compose up -d

dbc-stop:
	docker-compose stop database 

dbc-logs:
	docker-compose log database

dbc-volume:
	docker volume create --name=db-data

push-image:
	docker image push jasmit/pgpods-server:${VERSION}



create-storage:
	kubectl create -f ${PGHOME}/local/etc/volume.yaml
	kubectl create -f ${PGHOME}/local/etc/claim.yaml
	sleep 3
	kubectl get pv -o wide
	kubectl get pvc -o wide

create-server:
	kubectl create -f ${PGHOME}/local/etc/server.yaml
	sleep 3
	kubectl get all

delete-server:
	kubectl delete -f ${PGHOME}/local/etc/server.yaml
	sleep 3
	kubectl get all



connect-pod:
	kubectl exec -it pgpods-server --namespace com-jasmit-pgpods -- /bin/bash
