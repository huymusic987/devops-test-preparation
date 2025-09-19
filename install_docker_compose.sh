#!/bin/bash

# Download the latest version of Docker Compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

# Make the downloaded file executable
sudo chmod +x /usr/local/bin/docker-compose

# Confirm installation
docker-compose --version
