#!/bin/bash

#install utils
sudo apt-get update
sudo ufw disable
echo -e "\e[34mFIREWALL DISABLED.\e[0m"

# installer et configurer k3s
export K3S_KUBECONFIG_MODE="644"
export INSTALL_K3S_EXEC="server -i 192.168.56.110 --advertise-address=192.168.56.110"
sudo curl -sfL https://get.k3s.io | sh -

# copie du token
sudo cp /var/lib/rancher/k3s/server/token /vagrant/token_file

# creation de l'alias pour kubectl 
echo "alias k='kubectl'" >> /home/vagrant/.bashrc

# configurer eth1
sudo modprobe dummy && sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.110/24 dev eth1 && sudo ip link set dev eth1 up && sudo ip link set dev eth1 multicast on