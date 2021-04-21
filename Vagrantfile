Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/8"
  config.vm.hostname = "bento"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 4043
  config.vm.network "forwarded_port", guest: 22, host: 2222
  config.vm.provider "virtualbox" do |virtualbox|
    virtualbox.name = "bento"
    virtualbox.customize [
                           "modifyvm", :id,
                           "--nicpromisc2", "allow-vms",
                           "--natdnshostresolver1", "on"
                         ]
    end
  config.vm.synced_folder ".", "/var/www/modules"
  config.vm.provision :shell, path: "./install.sh"
end
