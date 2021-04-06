# Development Cycle
## Startup

### Create the persistant storage
`/Users/jeff/devl/PgPods/src/storage/local/bin/pv_create`

### Build a new version of the Docker image
`cd /Users/jeff/devl/PgPods/src/server/local/docker`

`docker build --tag com.jasmit.pgpods/server:0.0.0 .`

### Use K8s to start the server pod
`kubectl apply -f '/Users/jeff/devl/PgPods/src/server/local/docker/pgpods.yaml'`

### Check the status
`kubectl get pods -o wide`

If the startup failed, perform the "Startup debugging" section.
If the pod is running, perform the "Validation" section. 

## Startup Debugging
Pods status stays "pending".

Describe the pod to see if anything appears amiss.

`kubectl describe pod pgpods-server`

## Validation
Connect into the running pod:

`kubectl exec -it pgpods-server -- /bin/bash`






## Shutdown
`kubectl delete pod pgpods-server`

Remove the persistant storage (optional)

`/Users/jeff/devl/PgPods/src/storage/local/bin/pv_remove`

### Complete the cycle
`cd /Users/jeff/devl/PgPods`

`git status`

`git add --all`

`git commit`

`git push woz` *branch*



# Again #
`cd /Users/jeff/devl/pgpods2/server/local/etc`

`vi postgres-configmap.yaml`

`kubectl create -f postgres-configmap.yaml`

`vi postgres-storage.yaml`

`kubectl create -f postgres-storage.yaml`

`vi postgres-deployment.yaml`

`kubectl create -f postgres-deployment.yaml`

`kubectl get pods`

`kubectl exec -it postgres-84ff4497db-dqzx2 -- /bin/bash`

`vi postgres-service.yaml`

`kubectl create -f postgres-service.yaml`

`psql -U postgresadmin -d postgresdb`

#  Again 2 #
## Create a name space for the project

`kubectl create namespace com-jasmit-pgpods`

## Create the persistant storage

`cd /Users/jeff/devl/pgpods`

`make create-storage`

## Build the image

`cd /Users/jeff/devl/pgpods/server/src`

`docker build --tag com-jasmit-pgpods/pgpods-server:0.0.0 .`

## Create the pod

`cd /Users/jeff/devl/pgpods/src/server/local/etc`

Correct the version of the image.

`vi pgpods-server.yaml`

`kubectl create -f pgpods-server.yaml`

`kubectl get pods -o wide  --all-namespaces`


## Shut down
Stop the pod.

`make delete-pod`


Remove the persistant storage (optional)

`/Users/jeff/devl/pgpods/src/storage/pv_remove`


## Debugging

`kubectl get pods -o wide --all-namespaces`

`kubectl describe pod pgpods-server --namespace com-jasmit-pgpods`

`kubectl logs pgpods-server --namespace com-jasmit-pgpods -p --previous`

`kubectl exec -it pgpods-server --namespace com-jasmit-pgpods -- /bin/bash`






could not access the server configuration file "/opt/app/postgres/data/pgdb/postgresql.conf": No such file or directory

---  entry_start_0  ----------------------------------------
entry_end_0
