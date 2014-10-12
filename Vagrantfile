# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "jukeboxRuby"
  config.vm.box_url = "file://package.box"
  config.vm.network "private_network", ip: "33.33.33.25"
  config.vm.network "public_network", bridge: "en1: Wi-Fi (AirPort)"
  config.ssh.forward_agent = true
  config.vm.synced_folder "./", "/srv/jukebox", type: "nfs"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048, "--name", 'ruby',"--cpus", 2]
  end
end
