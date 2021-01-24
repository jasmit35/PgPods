#
ENV := "prod"
PGHOME := "/home/jeff/prod/pgpods"


create-image:
	cd ${PGHOME}/local/etc
	docker build --tag pgpods-server:0.1.0 .

push-image:
	docker push jasmit/pgpods:pgpods-server:0.1.0
	# docker tag ea62acceb9cf jasmit/pgpods:0.1.0
	# docker push jasmit/pgpods:0.1.0



create-storage:
	kubectl create -f ${PGHOME}/local/etc/volume.yaml
	sleep 3
	kubectl get pv -o wide
	kubectl create -f ${PGHOME}/local/etc/claim.yaml
	sleep 3
	kubectl get pvc -o wide

delete-storage:
	kubectl delete -f ${PGHOME}/local/etc/claim.yaml
	sleep 3
	kubectl get pvc -o wide
	kubectl delete -f ${PGHOME}/local/etc/volume.yaml
	sleep 3
	kubectl get pv -o wide



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
