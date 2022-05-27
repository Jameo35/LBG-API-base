#!/bin/bash
docker rmi -f $(docker images -q)
docker build -t ${DOCKERHUB_USER}/${APP_NAME}:${TAG}-${BUILD_ID} .
docker tag ${DOCKERHUB_USER}/${APP_NAME}:${TAG}-${BUILD_ID} ${DOCKERHUB_USER}/${APP_NAME}:${TAG}-latest
docker push ${DOCKERHUB_USER}/${APP_NAME}:$TAG-${BUILD_ID}
docker push ${DOCKERHUB_USER}/${APP_NAME}:${TAG}-latest
kubectl apply -f kubernetes
kubectl get pods
kubectl get deployments
kubectl get svc
docker system prune -f