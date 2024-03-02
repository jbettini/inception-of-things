#!/bin/bash

#install utils
sudo apt-get update &&
sudo apt-get install -y curl net-tools &&
# install k3s   
sudo curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server --node-ip 192.168.56.110" sh -s - &&
#alias pour kubectl
sudo echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh &&
#copie du token pour le worker
sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/.
