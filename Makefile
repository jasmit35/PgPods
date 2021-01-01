#
ENV := "devl"
STORAGE := "/Users/jeff/devl/pgpods3/src/storage"

create-image:
	cd /Users/jeff/${ENV}/pgpods/local/etc
	docker build --tag com-jasmit-pgpods/pgpods-server:0.1.0 .


create-storage:
	kubectl create -f /Users/jeff/${ENV}/pgpods/local/etc/volume.yaml
	sleep 3
	kubectl get pv -o wide
	kubectl create -f /Users/jeff/${ENV}/pgpods/local/etc/claim.yaml
	sleep 3
	kubectl get pvc -o wide

delete-storage:
	kubectl delete -f /Users/jeff/${ENV}/pgpods/local/etc/claim.yaml
	sleep 3
	kubectl get pvc -o wide
	kubectl delete -f /Users/jeff/${ENV}/pgpods/local/etc/volume.yaml
	sleep 3
	kubectl get pv -o wide


delete-volume:
	kubectl delete -f /Users/jeff/${ENV}/pgpods/local/etc/volume.yaml
	sleep 3
	kubectl get pv -o wide


create-server:
	kubectl create -f /Users/jeff/${ENV}/pgpods/local/etc/server.yaml
	sleep 3
	kubectl get all

delete-server:
	kubectl delete -f /Users/jeff/${ENV}/pgpods/local/etc/server.yaml
	sleep 3
	kubectl get all








connect-pod:
	kubectl exec -it pgpods-server --namespace com-jasmit-pgpods -- /bin/bash
