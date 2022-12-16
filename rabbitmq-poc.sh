#!/bin/bash
rm -rf ./target
git pull
./mvnw clean install
docker images 
docker rmi registry.hub.docker.com/yannipeng/rabbitmq-spring-app:latest
docker build -t registry.hub.docker.com/yannipeng/rabbitmq-spring-app:latest .
docker push registry.hub.docker.com/yannipeng/rabbitmq-spring-app:latest
kubectl delete deployment spring-app-hub
kubectl create deployment spring-app-hub --image=registry.hub.docker.com/yannipeng/rabbitmq-spring-app:latest
kubectl get pods
