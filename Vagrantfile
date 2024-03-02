# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Vagrant.configure("2") do |config|

#   config.vm.define "server" do |server|
#     server.vm.box = "debian/buster64"
#     server.vm.hostname = "server"
#     server.vm.network "private_network", ip: "192.168.56.110"  do |vbmaster|
#       # vbmaster.name = "Master"
#       # vbmaster.memory = "1024"
#       # vbmaster.cpus = 1
#     end 
#     config.vm.provision "shell", run: "once", path: "bootMaster.sh"
#   end

#   config.vm.define "server_worker" do |server_worker|
#     server_worker.vm.box = "debian/buster64"
#     server_worker.vm.hostname = "server-worker"
#     server_worker.vm.network "private_network", ip: "192.168.56.111" do |vbworker|
#       # vbworker.name = "Worker"
#       # vbworker.memory = "1024"
#       # vbworker.cpus = 1
#     end 
#     config.vm.provision "shell", run: "once", path: "bootWorker.sh"
#   end

# end


Vagrant.configure("2") do |config|

  config.vm.define "master" do |master|
    master.vm.box = "debian/buster64"
    master.vm.hostname = "master"
    master.vm.synced_folder ".", "/vagrant", type: "rsync"
    master.vm.network "private_network", ip: "192.168.56.110"
    master.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end
    master.vm.provision "shell", path: "bootMaster.sh"
  end

  config.vm.define "worker" do |worker|
    worker.vm.box = "debian/buster64"
    worker.vm.hostname = "worker"
    worker.vm.synced_folder ".", "/vagrant", type: "rsync"
    worker.vm.network "private_network", ip: "192.168.56.111"
    worker.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end
    worker.vm.provision "shell", path: "bootWorker.sh"
  end

end

# #CMD interressante : ssh vagrant@localhost -p 2222 -i .vagrant/machines/"machineName"/virtualbox/private_key



