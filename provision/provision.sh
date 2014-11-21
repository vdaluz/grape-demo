#!/bin/bash
# Provisioning script for Grape Demo project

apt-get update

# Install prerequisites
apt-get -y install curl nodejs git unzip tcl8.5 build-essential

# Install MongoDB
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
apt-get update
apt-get -y install mongodb-org

# Switch to the vagrant user in order to install RVM with Ruby 2.0.0
su vagrant << EOF

	cd /vagrant
	gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
	\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.3
	source /home/vagrant/.rvm/scripts/rvm
	rvm use 2.1.3

	# Bundle install bundler and rails
	cd /vagrant
	gem install bundler --no-document
	gem install rails --no-document

EOF
