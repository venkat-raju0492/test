#!/bin/bash
yum update -y
yum install wget unzip -y


echo "ïnstalling java"
yum install java -y

echo "installing jenkins" 
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins -y
systemctl start jenkins
systemctl status jenkins

echo "installing maven"
wget http://www-us.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
tar -xvf apache-maven-3.5.4-bin.tar.gz
rm -rf apache-maven-3.5.4-bin.tar.gz
mv apache-maven-3.5.4 mvn
mv mvn /opt/
echo 'export MAVEN_HOME=/opt/mvn' >> ~/.bashrc
echo 'export PATH=/opt/mvn/bin:${PATH}' >> ~/.bashrc
source ~/.bashrc
mvn --version

echo "installing terraform"
wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
unzip terraform_0.11.13_linux_amd64.zip
rm -rf terraform_0.11.13_linux_amd64.zip
mv terraform /usr/local/bin
terraform --version


