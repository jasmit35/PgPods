#
#  Makefile
#

OLD_VERSION := "v0.3.1"
NEW_VERSION := "v0.3.2"

################################################################################

.PHONY: create-image push-image remove-image list-image


create-image:
	docker build .
	docker tag pgpods_server:latest jasmit/pgpods-server:${NEW_VERSION}

push:
	docker push jasmit/pgpods-server:${NEW_VERSION}

remove:
	docker image rm jasmit/pgpods-server:${OLD_VERSION}

list:
	docker images | grep pgpods


################################################################################
