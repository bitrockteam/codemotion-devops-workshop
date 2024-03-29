# Codemotion

## Setup local environment

Required software:
- Docker
- kubectl
- kind
- helmfile
- helm
- helm-diff

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

# Making some traffic

benchmark springboot health check

```bash
ab -n 100 http://localhost:30000/springboot/hello
```

benchmark express health check

```bash
ab -n 100 http://localhost:30000/express/health
```

create an order

```bash
curl http://localhost:30000/springboot/orders -d '{"customer":"simoexpo", "product":"banana", "quantity": 10}' -H "Content-Type: application/json"
```

get orders

```bash
curl http://localhost:30000/springboot/orders
```


