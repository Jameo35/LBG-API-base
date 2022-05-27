#!/bin/bash
kubectl apply -f kubernetes
kubectl get pods
kubectl get deployments
kubectl get svc
docker system prune -f
