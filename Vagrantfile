# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.hostname="kafkacluster"
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "hashicorp/precise32"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.100.100"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
	vb.name = "kafka_cluster"
	vb.memory = "2048"
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
   config.vm.provision "shell", inline: <<-SHELL
	sudo apt-get update
	sudo apt-get -qq install openjdk-7-jre

	wget http://ftp.download-by.net/apache/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz
	tar -zxvf kafka_2.11-0.9.0.1.tgz
	cd kafka_2.11-0.9.0.1
	rm bin/windows -R
	rm site-docs -R
	rm LICENSE
	rm NOTICE
	cd ..
	
	echo "Dirs"
	mkdir /etc/kafka1 -p
	mkdir /etc/kafka1/data -p
	mkdir /etc/kafka1/logs -p
	chown -R root /etc/kafka1
	chmod -R 777 /etc/kafka1

	mkdir /etc/kafka2 -p
	mkdir /etc/kafka2/data -p
	mkdir /etc/kafka2/logs -p
	chown -R root /etc/kafka2
	chmod -R 777 /etc/kafka2

	mkdir /etc/kafka3 -p
	mkdir /etc/kafka3/data -p
	mkdir /etc/kafka3/logs -p
	chown -R root /etc/kafka3
	chmod -R 777 /etc/kafka3

	mkdir /etc/zookeeper1 -p
	mkdir /etc/zookeeper1/data -p
	mkdir /etc/zookeeper1/logs -p
	chown -R root /etc/zookeeper1
	chmod -R 777 /etc/zookeeper1

	mkdir /etc/zookeeper2 -p
	mkdir /etc/zookeeper2/data -p
	mkdir /etc/zookeeper2/logs -p
	chown -R root /etc/zookeeper2
	chmod -R 777 /etc/zookeeper2	

	mkdir /etc/zookeeper3 -p
	mkdir /etc/zookeeper3/data -p
	mkdir /etc/zookeeper3/logs -p
	chown -R root /etc/zookeeper3
	chmod -R 777 /etc/zookeeper3

	echo "Copy"
	cp -R kafka_2.11-0.9.0.1/. /etc/kafka1
	cp -R kafka_2.11-0.9.0.1/. /etc/kafka2
	cp -R kafka_2.11-0.9.0.1/. /etc/kafka3
	cp -R kafka_2.11-0.9.0.1/. /etc/zookeeper1
	cp -R kafka_2.11-0.9.0.1/. /etc/zookeeper2
	cp -R kafka_2.11-0.9.0.1/. /etc/zookeeper3

	rm -f kafka_2.11-0.9.0.1.tgz
	rm kafka_2.11-0.9.0.1 -R

	echo "Ids"
	printf "1" | sudo tee /etc/kafka1/data/myid > /dev/null 2>&1
	printf "2" | sudo tee /etc/kafka2/data/myid > /dev/null 2>&1
	printf "3" | sudo tee /etc/kafka3/data/myid > /dev/null 2>&1
	printf "1" | sudo tee /etc/zookeeper1/data/myid > /dev/null 2>&1
	printf "2" | sudo tee /etc/zookeeper2/data/myid > /dev/null 2>&1
	printf "3" | sudo tee /etc/zookeeper3/data/myid > /dev/null 2>&1

	echo "Remove unneeded files"
	sudo find /etc/kafka1/bin -type f ! -name 'kafka*.*' -delete
	sudo find /etc/kafka2/bin -type f ! -name 'kafka*.*' -delete
	sudo find /etc/kafka3/bin -type f ! -name 'kafka*.*' -delete

	sudo find /etc/kafka1/config -type f ! -name '*.properties' -delete
	sudo find /etc/kafka2/config -type f ! -name '*.properties' -delete
	sudo find /etc/kafka3/config -type f ! -name '*.properties' -delete
	sudo find /etc/zookeeper1/config -type f ! -name '*.properties' -delete
	sudo find /etc/zookeeper2/config -type f ! -name '*.properties' -delete
	sudo find /etc/zookeeper3/config -type f ! -name '*.properties' -delete

	echo "Configs"
	cd /vagrant
	sudo cp zookeeper1.properties /etc/zookeeper1/config/zookeeper.properties
	sudo cp zookeeper2.properties /etc/zookeeper2/config/zookeeper.properties
	sudo cp zookeeper3.properties /etc/zookeeper3/config/zookeeper.properties
	sudo cp zookeeper1.log4j.properties /etc/zookeeper1/config/log4j.properties
	sudo cp zookeeper2.log4j.properties /etc/zookeeper2/config/log4j.properties
	sudo cp zookeeper3.log4j.properties /etc/zookeeper3/config/log4j.properties
	sudo cp kafka1.properties /etc/kafka1/config/server.properties
	sudo cp kafka2.properties /etc/kafka2/config/server.properties
	sudo cp kafka3.properties /etc/kafka3/config/server.properties
	sudo cp kafka.log4j.properties /etc/kafka1/config/log4j.properties
	sudo cp kafka.log4j.properties /etc/kafka2/config/log4j.properties
	sudo cp kafka.log4j.properties /etc/kafka3/config/log4j.properties

	chown -R root /etc/zookeeper1
	chown -R root /etc/zookeeper2
	chown -R root /etc/zookeeper3
	chmod -R 777 /etc/zookeeper1
	chmod -R 777 /etc/zookeeper2
	chmod -R 777 /etc/zookeeper3

	chown -R root /etc/kafka1
	chown -R root /etc/kafka2
	chown -R root /etc/kafka3
	chmod -R 777 /etc/kafka1
	chmod -R 777 /etc/kafka2
	chmod -R 777 /etc/kafka3

	echo "Script files for vagrant"
	mkdir /home/vagrant -p
	sudo cp *.sh /home/vagrant
	chmod -R 777 /home/vagrant

	echo "Cleanup"
	sudo apt-get clean
	sudo cat /dev/null > ~/.bash_history && history -c && exit
   SHELL
end
