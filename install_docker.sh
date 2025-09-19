#!/bin/bash

sudo su -

yum install -y docker

systemctl enable docker

systemctl start docker