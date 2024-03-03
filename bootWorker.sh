#!/bin/bash

while [ ! -f /vagrant/token.env ]; do
  echo "En attente du token du serveur..."
  sleep 5
done
echo "Token trouvé."

export INSTALL_K3S_EXEC="agent --node-ip=192.168.56.111"
export K3S_TOKEN="-t $(cat /vagrant/token.env)"
export K3S_KUBECONFIG_MODE="644"
export K3S_URL="https://192.168.56.110:6443"

sudo apt-get update &&
sudo apt-get install -y curl net-tools &&

# installer k3s   
sudo curl -sfL https://get.k3s.io | sh -s - &&
sudo echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh 