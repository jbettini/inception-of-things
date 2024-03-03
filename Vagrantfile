# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|

  config.vm.define "jbettiniS" do |master|
    master.vm.box = "ubuntu/bionic64"
    master.vm.hostname = "jbettiniS"
    master.vm.network "private_network", ip: "192.168.56.110"
    master.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
      vb.name = "P1 - MASTER"
    end
    master.vm.provision "shell", path: "bootMaster.sh"
  end

  config.vm.define "jbettiniSW" do |worker|
    worker.vm.box = "ubuntu/bionic64"
    worker.vm.hostname = "jbettiniSW"
    worker.vm.network "private_network", ip: "192.168.56.111"
    worker.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
      vb.name = "P1 - WORKER"
    end
    worker.vm.provision "shell", path: "bootWorker.sh"
  end

end

# #CMD interressante : ssh vagrant@localhost -p 2222 -i .vagrant/machines/"machineName"/virtualbox/private_key



