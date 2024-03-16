#!/bin/bash

TOKEN_FILE="/vagrant/token_file"
while [ ! -f "$TOKEN_FILE" ]; do
  echo -e "\e[33mEn attente de la création de $TOKEN_FILE...\e[0m"
  sleep 5 
done
echo -e "\e[33m$TOKEN_FILE trouvé !\e[0m"
echo -e "\e[34mWORKER START K3S DL.\e[0m"
export K3S_TOKEN=$(cat /vagrant/token_file)
export K3S_URL="https://192.168.56.110:6443"
export INSTALL_K3S_EXEC="agent -i 192.168.56.111"
curl -sfL https://get.k3s.io | sh -
echo -e "\e[34mWORKER END K3S DL.\e[0m"
echo "alias k='kubectl'" >> /home/vagrant/.bashrc
echo -e "\e[34mWORKER SET ALIAS.\e[0m"
#sudo modprobe dummy && sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.111/24 dev eth1 && sudo ip link set dev eth1 up && sudo ip link set dev eth1 multicast on