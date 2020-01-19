#! /bin/bash
export IMAGE_TAG=$(date +%s)
export HELMFILE_HELM3=1

docker build . -t trow.kube-public:31000/helm-minimal:$IMAGE_TAG --network=host
docker push trow.kube-public:31000/helm-minimal:$IMAGE_TAG

helmfile apply

minikube service helm-minimal -n default

