#!/bin/bash

#install utils
sudo apt-get update &&
sudo apt-get install -y curl net-tools &&

# install and config k3s
#export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san jbettiniS --node-ip 192.168.56.110 --bind-address=192.168.56.110 --advertise-address=192.168.56.110 " && 
sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san jbettiniS --node-ip 192.168.56.110 --bind-address=192.168.56.110 --advertise-address=192.168.56.110 " sh -s - &&

#alias pour kubectl
sudo echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh &&

#copie du token pour le worker
sudo cat /var/lib/rancher/k3s/server/token >> /vagrant/token.env
