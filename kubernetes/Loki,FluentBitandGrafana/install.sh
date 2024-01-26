#!/bin/bash
#source: https://technotim.live/posts/grafana-loki-kubernetes/
#Own template
namespace="logs"

#Create namespace
kubectl create namespace $namespace

#Deploy StorageClass
kubectl create -f storageclass.yml

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