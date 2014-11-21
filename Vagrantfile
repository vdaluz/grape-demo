# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.box = "hashicorp/precise64"
  config.vm.hostname = "grape-demo"
  config.vm.provision "shell", path: "provision/provision.sh"
  config.vm.network "forwarded_port", guest: 3000, host: 3333

end
