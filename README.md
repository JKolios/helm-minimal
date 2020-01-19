# Helm Minimal Example

This repo demonstrates a minimal Helmfile -> Helm v3 stack that can deploy a "Hello World" app to a kubernetes cluster.

The app connects to a redis cluster and persists the amount of times it has been accessed. The point of this was to demonstrate some basic cross-pod connectivity and working with external helm charts.

## Requirements

* helm ``` version.BuildInfo{Version:"v3.0.2", GitCommit:"19e47ee3283ae98139d98460de796c1be1e3975f", GitTreeState:"clean", GoVersion:"go1.13.5"}```
* helmfile ``` helmfile version v0.98.2 ```
* minikube  ``` minikube version: v1.6.2 commit: 54f28ac5d3a815d1196cd5d57d707439ee4bb392 ```
* docker  ``` Docker version 19.03.5-ce, build 633a0ea838 ```
* A [trow](https://github.com/ContainerSolutions/trow) docker repo installed on the minikube cluster.  Tested with commit `2902636`.  Must be accessible on `trow.kube-public`.

## Usage

`./deploy.sh` and hope for the best. If the script runs successfully it will print out the NodePort url for the Hello World app.
