#!/bin/bash
echo -e "\n"
echo "Installing java"
echo -e "\n"
sudo yum install java-17-amazon-corretto-devel -y
echo "Downloading maven"
wget https://dlcdn.apache.org/maven/maven-3/3.9.0/binaries/apache-maven-3.9.0-bin.tar.gz
sleep 10
echo -e "\n"
echo "Installing maven"
sudo tar xvf apache-maven-3.9.0-bin.tar.gz -C /opt
sleep 2
sudo ln -s /opt/apache-maven-3.9.0 /opt/maven
sleep 1
echo -e "\n"
echo "Add Maven folder to system path"
echo "To access the mvn command systemwide, you need to either set the M2_HOME environment variable or add /opt/maven to the system PATH."
echo -e "\n"
echo "Step 1: Create a script file named maven.sh in the profile.d folder."
echo "sudo vi /etc/profile.d/maven.sh"
echo -e "\n"
echo "Step 2: Add the following to the script and save the file."
echo "export M2_HOME=/opt/maven"
echo "export PATH=${M2_HOME}/bin:${PATH}"
echo -e "\n"
echo "Then run maveninstall-2.sh"
echo -e "\n"


#!/bin/bash
echo -e "\n"
echo "Add execute permission to the maven.sh script."
echo -e "\n"
sudo chmod +x /etc/profile.d/maven.sh
echo "Source the script for changes to take immediate effect"
source /etc/profile.d/maven.sh
echo -e "\n"
echo "Verify maven installation"
sudo mvn -version
echo -e "\n"