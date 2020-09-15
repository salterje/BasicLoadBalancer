# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.define "ha-server" do |ha|
    ha.vm.provider "virtualbox" do |v|
      v.name = "ha-loadbalancer"
      v.memory = 1024
      v.cpus = 1
      v.customize ["modifyvm", :id, "--description", "This is a HA LoadBalancer"]
    end  
    ha.vm.hostname = "ha-loadbalancer"
    ha.vm.network "private_network", ip: "192.168.200.201"
    ha.vm.provision "file", source: "./files/haproxy.cfg", destination: "/home/vagrant/haproxy.cfg"
    ha.vm.provision "shell", path: "scripts/setup.sh"
  end 


  config.vm.define "nginx-server-1" do |server1|
    server1.vm.provider "virtualbox" do |v|
      v.name = "nginx-server-1"
      v.memory = 1024
      v.cpus = 1
      v.customize ["modifyvm", :id, "--description", "This is an nginx server 1"]
    end  
    server1.vm.hostname = "nginx-server-1"
    server1.vm.network "private_network", ip: "192.168.200.210"
    server1.vm.provision "file", source: "./files/index.html", destination: "/home/vagrant/index.html"
    server1.vm.provision "shell", path: "scripts/nginx.sh"
  end 

  config.vm.define "nginx-server-2" do |server2|
    server2.vm.provider "virtualbox" do |v|
      v.name = "nginx-server-2"
      v.memory = 1024
      v.cpus = 1
      v.customize ["modifyvm", :id, "--description", "This is an nginx server 2"]
    end  
    server2.vm.hostname = "nginx-server-2"
    server2.vm.network "private_network", ip: "192.168.200.211"
    server2.vm.provision "file", source: "./files/index2.html", destination: "/home/vagrant/index.html"
    server2.vm.provision "shell", path: "scripts/nginx.sh"
  end 
end
