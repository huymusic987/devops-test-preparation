#!/bin/bash

sudo -i

yum install git -y

ssh-keygen -t rsa -b 4096 -C "huymarky05@gmail.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

cat ~/.ssh/id_rsa.pub

ssh -T git@github.com
