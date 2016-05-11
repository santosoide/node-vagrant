# encoding: utf-8
# This file originally created at http://rove.io/e11ba7512de78237301dfd0267112ae1

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.ssh.forward_agent = true

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 8000, host: 8000
  config.vm.network :forwarded_port, guest: 9000, host: 9000
  config.vm.network :forwarded_port, guest: 9001, host: 9001

  config.vm.synced_folder "app", "/home/vagrant/app"

  config.vm.provision :shell, :inline => "sudo apt-get install -y build-essential --no-install-recommends"
  config.vm.provision :shell, :inline => "sudo apt-get install gcc-4.8"
  config.vm.provision :shell, :inline => "sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50"
  config.vm.provision :shell, :path => "provision.sh", privileged: false

end
