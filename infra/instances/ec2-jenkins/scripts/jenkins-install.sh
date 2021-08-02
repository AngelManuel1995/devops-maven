#!/bin/bash
yum update –y
yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo tar -xvzf apache-maven-3.8.1-bin.tar.gz
sudo mv apache-maven-3.8.1 /opt/maven
sudo yum upgrade -y
sudo yum install jenkins -y
sudo yum install git -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins