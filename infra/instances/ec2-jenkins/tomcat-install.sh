#!/bin/bash
yum update –y
yum install wget -y
sudo wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz
sudo tar -xzvf apache-tomcat-8.5.69.tar.gz
sudo mv apache-tomcat-8.5.69 tomcat && sudo mv tomcat /opt/
sudo mv /tmp/users/tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml
sudo mv /tmp/manager/context.xml /opt/tomcat/webapps/manager/META-INF/context.xml
sudo mv /tmp/hosts/context.xml /opt/tomcat/webapps/host-manager/META-INF/context.xml
#sudo /opt/tomcat/bin/startup.sh