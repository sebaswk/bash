#!/bin/bash
#source: https://technotim.live/posts/kube-grafana-prometheus/
#Own template
namespace="monitoring"

#Install helm chart
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

#Create namespace
kubectl create namespace $namespace

sleep 1
echo "Grafana username and password:"
echo -n 'admin' > ./admin-user # change your username
echo -n 'p@ssword!' > ./admin-password # change your password

#Create secret
kubectl create secret generic grafana-admin-credentials --from-file=./admin-user --from-file=admin-password -n $namespace
echo ""

sleep 1
echo ""
echo "Grafana username and password:"
echo ""
echo "User:"
kubectl get secret -n $namespace grafana-admin-credentials -o jsonpath="{.data.admin-user}" | base64 --decode
echo ""
echo "Password:"
kubectl get secret -n $namespace grafana-admin-credentials -o jsonpath="{.data.admin-password}" | base64 --decode
#Remove username and password file from filesystem
rm admin-user && rm admin-password
echo ""

echo ""
#Copy values.yaml
git clone https://github.com/techno-tim/launchpad.git
echo ""

sleep 1
cp launchpad/kubernetes/kube-prometheus-stack/values.yml .
mv values.yml values.yaml
rm -rf launchpad/
echo""

echo "Installing prometheus..."
helm install -n $namespace prometheus prometheus-community/kube-prometheus-stack -f values.yaml
echo ""