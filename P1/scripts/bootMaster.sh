#!/bin/bash

sudo apt-get update
sudo apt-get install nfs-common
sudo ufw disable
echo -e "\e[34mFIREWALL DISABLED.\e[0m"
echo -e "\e[34mMASTER START K3S DL.\e[0m"
export K3S_KUBECONFIG_MODE="644"
export INSTALL_K3S_EXEC="server -i 192.168.56.110 --advertise-address=192.168.56.110"
sudo curl -sfL https://get.k3s.io | sh -
echo -e "\e[34mMASTER END K3S DL.\e[0m"
sudo cp /var/lib/rancher/k3s/server/token /vagrant/token_file
echo -e "\e[34mMASTER TOKEN COPIED.\e[0m"
echo "alias k='kubectl'" >> /home/vagrant/.bashrc
echo -e "\e[34mMASTER ALIAS SET.\e[0m"

# sudo modprobe dummy && sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.110/24 dev eth1 && sudo ip link set dev eth1 up && sudo ip link set dev eth1 multicast on