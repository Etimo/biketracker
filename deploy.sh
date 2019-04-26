#!/usr/bin/env bash
set -euo pipefail

export TILLER_NAMESPACE=biketracker
export KUBECONFIG=deploy/kubeconfig

docker_tag=registry.kubernetes.etimo.se/biketracker-server:$(git rev-parse HEAD)

export HELM_TLS_ENABLE=true
export HELM_TLS_VERIFY=true
export HELM_TLS_CA_CERT=deploy/tiller-keys/ca.crt
export HELM_TLS_CERT=deploy/tiller-keys/tls.crt
export HELM_TLS_KEY=deploy/tiller-keys/tls.key

mkdir -p deploy/tiller-keys
kubectl get secret/tiller-secret --output=go-template='{{index .data "ca.crt"}}' | base64 -d > $HELM_TLS_CA_CERT
kubectl get secret/tiller-secret --output=go-template='{{index .data "tls.crt"}}' | base64 -d > $HELM_TLS_CERT
kubectl get secret/tiller-secret --output=go-template='{{index .data "tls.key"}}' | base64 -d > $HELM_TLS_KEY

docker build . -f Dockerfile.server -t $docker_tag
docker push $docker_tag
helm init --client-only
helm upgrade biketracker charts/biketracker --install --namespace biketracker --set-string image=$docker_tag
