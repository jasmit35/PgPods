#
STORAGE := "/Users/jeff/devl/pgpods3/src/storage"

create-storage:
	@echo "Creating persistant storage"
	${STORAGE}/pv_create

remove-storage:
	@echo "Removing persistant storage"
	${STORAGE}/pv_remove

create-image:
	cd /Users/jeff/Devl/pgpods/server/src
	docker build --tag com-jasmit-pgpods/pgpods-server .

create-pod:
	kubectl create -f /Users/jeff/devl/pgpods/src/server/local/etc/pgpods-server.yaml
	sleep 5
	kubectl get pods -o wide --all-namespaces

delete-pod:
	kubectl delete pod pgpods-server --namespace com-jasmit-pgpods

connect-pod:
	kubectl exec -it pgpods-server --namespace com-jasmit-pgpods -- /bin/bash
