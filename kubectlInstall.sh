#!/bin/bash
echo -e "\n"
echo "Download kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
echo -e "\n"
echo "Validate the binary"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
echo -e "\n"
echo "Install kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo -e "\n"
kubectl version --client
echo -e "\n"