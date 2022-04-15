#
#  Makefile
#

VERSION := "v0.3.1"

.PHONY: create-volume delete-volume create-network delete-network

################################################################################

create-volume:
	docker volume create --name=pgpods-data
	docker volume ls

delete-volume:
	docker volume rm pgpods-data
	docker volume ls

################################################################################

create-network:
	docker network create pgpods-network
	docker network ls

delete-network:
	docker network rm pgpods-network
	docker network rm pgpods_pgpods-network
	docker network ls

################################################################################

create-image:
	docker-compose build
	docker tag pgpods_server:latest jasmit/pgpods-server:${VERSION}

run-image:
	docker-compose up -d
	docker-compose ps 

stop-image:
	docker-compose stop server
	docker-compose ps 

remove-image:
	docker-compose rm server
	docker-compose ps 

push-image:
	docker push jasmit/pgpods-server:${VERSION}

################################################################################

ps:
	docker-compose ps 

exec:
	docker-compose exec -it server /bin/bash

logs:
	docker-compose logs server 

kompose:
	kompose convert --out ../test

################################################################################

clean: stop-image remove-image

clean-all: stop-image remove-image delete-volume delete-network
	
################################################################################


