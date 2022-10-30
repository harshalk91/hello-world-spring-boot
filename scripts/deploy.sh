#!/bin/bash

container_name="hello-world-spring-boot"

## Check if docker exists
which docker > /dev/null
retVal=$?
if [ $retVal -eq 0 ]
then
  echo "Docker exists"
else
  echo "Kindly install docker first and come back again"
  exit 1
fi

container_id=$(docker ps -aqf "name=$container_name")
if [ "$( docker container inspect -f '{{.State.Running}}' $container_name )" == "true" ]
then
   echo "Stopping existing container"
   docker stop $container_id > /dev/null || true
   docker rm -f $container_id > /dev/null || true
else
   docker rm -f $container_id > /dev/null || true
fi

echo "Deploying latest image of $container_name"
new_container_id=$(docker run -dit -p 8080:8080 --name $container_name harshalk91/$container_name:latest)
sleep 10
status_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080)
if [ "$status_code" == 200 ]
then
   echo "New container deployed successfully"
fi