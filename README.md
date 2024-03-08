# Codemotion

## Setup Kubernetes Cluster

```bash
kind create cluster \
  --name workshop \
  --image kindest/node:v1.29.1 \
  --config kind.yaml
  
kubectl cluster-info \
  --context kind-workshop
  
kubectl config use-context kind-workshop
```

## Setup the stack

```bash
helmfile sync
```

## Get in Grafana

```bash
kubectl get secrets -n monitoring lgtm-grafana -o yaml | yq .data.admin-user | base64 -d
kubectl get secrets -n monitoring lgtm-grafana -o yaml | yq .data.admin-password | base64 -d

# open localhost:30000/grafana
```

# Demo

```bash
make kind
make base
make lgtm
make otel-operator
make otel-instrumentation
make apps
```
