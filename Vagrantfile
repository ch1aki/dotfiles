# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.synced_folder "./", "/home/vagrant/dotfiles"
  config.vm.provision "shell", inline: "sudo apt-get update"
end

