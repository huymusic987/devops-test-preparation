#!/bin/bash

echo "tmpfs /tmp tmpfs defaults,size=5G 0 0" | sudo tee -a /etc/fstab

mount -o remount /tmp

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

yum install -y fontconfig java-17-amazon-corretto jenkins docker git ansible

usermod -aG docker jenkins

systemctl daemon-reload

systemctl enable docker

systemctl enable jenkins

systemctl daemon-reload

systemctl start docker

systemctl start jenkins

echo "Maven, Jenkins, Docker installed"

cat /var/lib/jenkins/secrets/initialAdminPassword


