#!/bin/bash
echo -e
read -p "Namespace name:" namespace
echo "Cleaning pods in the $namespace namespace:"
echo -e
kubectl get pod -n $namespace | grep Evicted | awk '{print $1}' | xargs kubectl delete pod -n $namespace
kubectl get pod -n $namespace | grep ContainerStatusUnknown | awk '{print $1}' | xargs kubectl delete pod -n $namespace
kubectl get pod -n $namespace | grep Error | awk '{print $1}' | xargs kubectl delete pod -n $namespace
kubectl get pod -n $namespace | grep Completed | awk '{print $1}' | xargs kubectl delete pod -n $namespace
kubectl get pod -n $namespace | grep OOMKilled | awk '{print $1}' | xargs kubectl delete pod -n $namespace
echo -e
echo "Clean namespace."
echo -e