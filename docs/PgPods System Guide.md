# PgPods System Guide
# Development Cycle
## Startup

### Shutdown the previous version (if running)

`make dc-ps`

`make dc-stop`

`make dc-rm`

### Remove the existing storage (think first! Bye Bye data)

`make remove-volume`

### Create new persistant storage

`make create-volume`

### Build a new version of the Docker image

`make dc-build`

### Start the server container

`make dc-run`

### Check the status

`make dc-ps`

## Debugging

## Validation

`make dc-exec`

## Shutdown

### Finalizing the version in development.
Finsh the commit and pushes to the git repositories:

`git add --all`

`git commit -m ''`

`git push github master`

`git push woz master`

Upload the new image to docker hub:

`make push-image`


##  Deployment in test

Complete the normal git and auto_update steps from Fire-Starter.

Create the file pgpods/.secrets-db-data that holds the Postgres account's password. This file does not get saved to Git Hub (on purpose) and must be recreated each time.

Edit pgpods/Makefile to insure the corrrect environment is being set.
