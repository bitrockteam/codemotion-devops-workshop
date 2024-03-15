all: kind base lgtm otel-operator otel-instrumentation apps

kind:
		kind create cluster \
		  --name workshop \
		  --image kindest/node:v1.29.1 \
		  --config kind.yaml
		kubectl cluster-info \
		  --context kind-workshop
		kubectl config use-context kind-workshop

clean:
		 kind delete cluster \
 			--name workshop

base:
		helmfile apply -l component=base

lgtm:
		helmfile apply -l component=lgtm

otel-operator:
		helmfile apply -l component=otel-operator

otel-instrumentation:
		helmfile apply -l component=otel-instrumentation

apps:
		helmfile apply -l component=apps
