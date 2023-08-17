#!/bin/bash
echo -e "\n"
echo "Download docker-compose"
echo -e "\n"
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
echo "Fix permissions after download"
sudo chmod +x /usr/local/bin/docker-compose
echo -e "\n"
echo "Verify success:"
docker-compose version
echo "Installation completed"
echo -e "\n"