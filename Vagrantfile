# -*- mode: ruby -*-
# vi: set ft=ruby :

# See README.md for details
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.define "puppetmaster" do |puppetmaster|
  config.vbguest.auto_update = true
    puppetmaster.vm.hostname = "puppetmaster"
    puppetmaster.vm.network "private_network", ip: "172.31.0.201"
    puppetmaster.vm.provision "shell", path: "./puppetmaster/strap_master"
    puppetmaster.vm.provision "file", source: "./puppetmaster/nodes.pp", destination: "/etc/puppet/environments/production/manifests/nodes.pp"
  end
  config.vm.box = "centos/7"
  config.vm.define "agent1" do |agent1|
  config.vbguest.auto_update = true
   agent1.vm.hostname = "agent1"
   agent1.vm.network "private_network", ip: "172.31.0.202"
   agent1.vm.provision "shell", path: "./agent1/strap_agent1"
   agent1.vm.network "forwarded_port", guest: 80, host: 8080
   agent1.vm.provision :reload
  end
#  config.vm.box = "centos/7"
#  config.vm.define "agent2" do |agent2|
#  config.vbguest.auto_update = true
#    agent2.vm.hostname = "agent2"
#    agent2.vm.network "private_network", ip: "172.31.0.203"
#    agent2.vm.provision "shell", path: "./agent2/strap_agent2"
#    agent2.vm.network "forwarded_port", guest: 80, host: 8081
#  end
end
