#!/bin/bash
echo -e "\n"
echo "Install postgres"
sudo yum install postgresql15 -y
echo -e "\n"
echo "Verify success:"
psql --version
echo "Postgres installed successfully."
echo -e "\n"