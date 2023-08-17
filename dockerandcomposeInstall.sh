#!/bin/bash
echo -e "\n"
echo "Install docker"
sudo dnf install docker -y
echo -e "\n"
echo "Start docker service"
sudo systemctl start docker
echo -e "\n"
echo "Download docker-compose"
echo -e "\n"
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
echo "Fix permissions after download"
sudo chmod +x /usr/local/bin/docker-compose
echo -e "\n"
echo "###############################################################################################"
echo "###                                                                                         ###"
echo "### If you also want Docker to start automatically with system boot then use this command:  ###"
echo "###                               sudo systemctl enable docker                              ###"
echo "###                                                                                         ###"
echo "###############################################################################################"
echo -e "\n"
echo "Verify success:"
docker --version
docker-compose version
echo "Docker and docker compose installed successfully."
echo -e "\n"