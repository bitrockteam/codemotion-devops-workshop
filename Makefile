all: kind lgtm otel-operator otel-instrumentation apps

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

crds:
		helmfile apply -l component=crds

lgtm:
		helmfile apply -l component=lgtm

grafanaAgent:
		helmfile apply -l component=grafanaAgent

otel-operator:
		helmfile apply -l component=otel-operator

otel-instrumentation:
		helmfile apply -l component=otel-instrumentation

apps:
		helmfile apply -l component=apps