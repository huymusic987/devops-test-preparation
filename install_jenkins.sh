#!/bin/bash

sudo su -

echo "tmpfs /tmp tmpfs defaults,size=5G 0 0" | sudo tee -a /etc/fstab

mount -o remount /tmp

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

yum install -y fontconfig java-17-amazon-corretto jenkins docker git

usermod -aG docker jenkins

systemctl daemon-reload

systemctl enable docker

systemctl enable jenkins

systemctl daemon-reload

systemctl start docker

systemctl start jenkins

# Download the latest version of Docker Compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

# Make the downloaded file executable
sudo chmod +x /usr/local/bin/docker-compose

# Confirm installation
docker-compose --version

echo "Jenkins, Docker, Docker Compose installed"

