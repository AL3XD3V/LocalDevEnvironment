# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "project-vm"
  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.synced_folder "./project", "/var/www/project/"
  config.vm.synced_folder "./Vagrant", "/var/www/config/"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
    vb.cpus = "2"
    vb.name = "ProjectVM"
  end
  config.vm.provision "shell", path: "./Vagrant/preinstall.sh", run: "once"
end