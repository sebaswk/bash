#!/bin/bash
echo ""
echo "Names of containers you want to compress"

read -p "Docker 1: " docker1
read -p "Docker 2: " docker2
read -p "Docker 3: " docker3
read -p "Docker 4: " docker4
read -p "Docker 5: " docker5
read -p "User of the instance that will receive the containers: " user
read -p "Instance IP: " instance
read -p "Path where you want to leave the files: " path

echo "Compress dockers"
cd /home/

docker save $docker1 > $docker1.tar
docker save $docker2 > $docker2.tar
docker save $docker3 > $docker3.tar
docker save $docker4 > $docker4.tar
docker save $docker5 > $docker5.tar

echo "Loading images"

scp $docker1.tar $docker2.tar $docker3.tar $docker4.tar $docker5.tar $user@$instance:$path

echo "Images uploaded successfully."