#!/bin/bash

while [ ! -f /vagrant/node-token ]; do
  echo "En attente du token du serveur..."
  sleep 5
done
echo "Token trouvé."

TOKEN=$(cat /vagrant/node-token)
sudo apt-get update &&
sudo apt-get install -y curl net-tools &&

# installer k3s   
sudo curl -sfL https://get.k3s.io | K3S_URL="https://192.168.56.110:6443" K3S_TOKEN=${TOKEN} K3S_KUBECONFIG_MODE="644" sh -s - &&
sudo echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh 
