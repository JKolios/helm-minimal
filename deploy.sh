#! /bin/bash
helm tiller start

helm del --purge redis
helm install stable/redis --name redis --set usePassword=false

helm del --purge helm-minimal
helm install -f infra/config.yaml --name helm-minimal ./infra

minikube service helm-minimal

