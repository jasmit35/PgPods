#
#  Makefile
#
################################################################################

create-namespace:
	kubectl create namespace pgpods
	kubectl get namespace

delete-namespace:
	kubectl delete namespace pgpods
	kubectl get namespace


################################################################################

create-volume:
	kubectl create -f volume.yaml

delete-volume:
	kubectl delete -f volume.yaml


################################################################################

# create-volume-claim:
# 	kubectl create -f volume-claim.yaml
# 	kubectl get persistentvolumeclaims -A

delete-volume-claim:
	kubectl delete persistentvolumeclaims pgpods-volume-pgpods-statefulset-0 --namespace=pgpods


################################################################################

create-network:
	kubectl create -f network.yaml
	kubectl get networkpolicy -A

delete-network:
	kubectl delete -f network.yaml
	kubectl get networkpolicy -A


################################################################################

create-service:
	kubectl create -f service.yaml

delete-service:
	kubectl delete -f service.yaml


################################################################################

create-statefulset:
	kubectl create -f statefulset.yaml

delete-statefulset:
	kubectl delete -f statefulset.yaml


################################################################################

logs:
	kubectl logs -l app=pgpods --all-containers=true --namespace=pgpods

ps:
	kubectl get statefulset -A
	kubectl get pods --namespace=pgpods
	kubectl describe statefulset --namespace pgpods


################################################################################
