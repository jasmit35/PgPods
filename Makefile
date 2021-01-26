#
ENV := "devl"
# ENV := "test"
# ENV := "prod"

VERSION := "0.1.1"

########################################

ifeq (${ENV}, "devl")
	PGHOME := "/Users/jeff/devl/pgpods"
endif

ifeq (${ENV}, "test")
	PGHOME := "/Users/jeff/test/pgpods"
endif

ifeq (${ENV}, "prod")
	PGHOME := "/home/jeff/prod/pgpods"
endif


create-image:
	cd ${PGHOME}/local/etc
	docker build --tag jasmit/pgpods-server:${VERSION} .

push-image:
	docker image push jasmit/pgpods-server:${VERSION}



create-storage:
	kubectl create -f ${PGHOME}/local/etc/volume.yaml
	kubectl create -f ${PGHOME}/local/etc/claim.yaml
	sleep 3
	kubectl get pv -o wide
	kubectl get pvc -o wide

delete-storage:
	kubectl delete -f ${PGHOME}/local/etc/claim.yaml
	kubectl delete -f ${PGHOME}/local/etc/volume.yaml
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
