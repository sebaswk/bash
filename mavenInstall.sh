#!/bin/bash
echo -e "\n"
echo "Installing java"
echo -e "\n"
sudo yum install java-17-amazon-corretto-devel -y
echo "Downloading maven"
wget https://dlcdn.apache.org/maven/maven-3/3.9.0/binaries/apache-maven-3.9.0-bin.tar.gz
sleep 8
echo -e "\n"
echo "Installing maven"
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sleep 1
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
sleep 2
echo "Verify success:"
mvn --version
echo -e "\n"