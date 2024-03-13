#!/bin/bash

#install utils
sudo apt-get update
sudo ufw disable
export K3S_KUBECONFIG_MODE="644"
export INSTALL_K3S_EXEC="server -i 192.168.56.110 --advertise-address=192.168.56.110"
sudo curl -sfL https://get.k3s.io | sh -
echo "alias k='kubectl'" >> /home/vagrant/.bashrc
sudo modprobe dummy && sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.110/24 dev eth1 && sudo ip link set dev eth1 up && sudo ip link set dev eth1 multicast on
kubectl create configmap app1-html --from-file=/vagrant/confs/app1/app1.html
kubectl create configmap app2-html --from-file=/vagrant/confs/app2/app2.html
kubectl create configmap app3-html --from-file=/vagrant/confs/app3/app3.html
kubectl apply -f /vagrant/confs/deployment.yaml

