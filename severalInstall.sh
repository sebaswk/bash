#!/bin/bash
echo -e "\n"
echo "Install nc"
sudo yum install nc -y
echo "Install git"
sudo yum install git-all -y
echo -e "\n"
nc --version
git --version
echo -e "\n"