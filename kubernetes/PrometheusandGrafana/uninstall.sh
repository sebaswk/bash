#!/bin/bash
namespace="monitoring"

#Delete helm
helm uninstall -n $namespace prometheus

sleep 1
#Delete files
rm -rf values.yaml

#Delete secret
kubectl delete secret -n $namespace grafana-admin-credentials

echo ""
#Validations
echo "Now Prometheus is uninstall, but I will run something validations and if necessary you must delete the specify resources."
echo ""
sleep 1

echo "Helm:"
helm ls -n $namespace
echo ""
echo "Deploy:"
kubectl get deploy -n $namespace
echo ""
echo "Secrets:"
kubectl get secret -n $namespace
echo ""
echo "DaemonSet:"
kubectl get daemonset -n $namespace
echo ""
echo "StatefulSet:"
kubectl get StatefulSet -n $namespace
echo ""
echo "Pods:"
kubectl get pods -n $namespace
echo ""
echo "Services:"
kubectl get svc -n $namespace
echo ""