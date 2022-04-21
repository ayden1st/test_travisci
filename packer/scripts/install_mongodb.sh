#!/bin/bash

echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
sleep 30s
apt-get install apt-transport-https ca-certificates
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update
sleep 30s
apt-get install -y mongodb-org
systemctl --now enable mongod
