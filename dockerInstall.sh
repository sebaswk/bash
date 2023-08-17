#!/bin/bash
echo -e "\n"
echo "Install docker"
sudo dnf install docker -y
echo -e "\n"
echo "Start docker service"
sudo systemctl start docker
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
echo "Docker installed successfully."
echo -e "\n"