#!/bin/bash
#source: https://technotim.live/posts/grafana-loki-kubernetes/
#Own template
namespace="logs"

#Create namespace
kubectl create namespace $namespace

#Deploy StorageClass
kubectl create -f storageclass.yml

#Validate helm installation
if ! command -v helm &> /dev/null; then
    echo "Helm is not installed. Please install Helm first"
    exit 1
fi

#Validate installation of the grafana repository
if ! helm repo list | grep -q "grafana"; then
    echo "Adding the Grafana repository..."
    helm repo add grafana https://grafana.github.io/helm-charts
fi

helm repo update

#Grafana deployment
echo ""
echo "Deploy Loki, Grafana and Fluent Bit..."
helm install loki grafana/loki-stack --set grafana.enabled=true,promtail.enabled=false,prometheus.enabled=false,loki.persistence.enabled=false,loki.persistence.storageClassName="standard",loki.service.enabled=true,fluent-bit.enabled=true -n $namespace

sleep 3
echo ""
echo "Grafana username and password:"
echo ""
echo "User:"
echo "admin"
echo ""
echo "Password:"
kubectl get secret --namespace $namespace loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
echo ""

echo "Finished."
