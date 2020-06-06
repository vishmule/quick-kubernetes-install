
# -*- mode: ruby -*-

# vi: set ft=ruby :



VAGRANTFILE_API_VERSION = "2"



Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # General Vagrant VM configuration.

  config.vm.box = "centos/7"

  config.ssh.insert_key = false

  config.vm.synced_folder ".", "/vagrant", disabled: true

#end


# KubeMaster

 config.vm.define "kubemaster" do |master|

   master.vm.hostname = "kubemaster"

   master.vm.network :private_network, ip: "192.168.56.2"

   master.vm.provider :virtualbox do |v|

     v.memory = 6144
     v.cpus = 4
     v.linked_clone = true

   end

 end



# Worker1

 config.vm.define "worker1" do |node|

   node.vm.hostname = "worker1"

   node.vm.network :private_network, ip: "192.168.56.3"

   node.vm.provider :virtualbox do |v|

     v.memory = 2048
     v.cpus = 2
     v.linked_clone = true

   end


 end



# Worker2

 config.vm.define "worker2" do |node|

   node.vm.hostname = "worker2"

   node.vm.network :private_network, ip: "192.168.56.4"

   node.vm.provider :virtualbox do |v|

     v.memory = 2048
     v.cpus = 2
     v.linked_clone = true

   end

 end


# Worker3

 config.vm.define "worker3" do |node|

   node.vm.hostname = "worker3"
   node.vm.network :private_network, ip: "192.168.56.5"

   node.vm.provider :virtualbox do |v|

     v.memory = 2048
     v.cpus = 2
     v.linked_clone = true

   end

 end

end
