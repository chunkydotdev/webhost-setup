#!/bin/bash
# Install nginx webhost and a domain on debian 

echo "updating apt"
sudo apt update
sudo apt upgrade -y
sudo apt install subversion make ufw nginx -y

echo "packages are updated"
read -p "do you want to set up a dev user? (y/n) " 
if [[ $REPLY -eq "y" ]]
then 
	adduser dev
	usermod -aG sudo dev
	getent group sudo
	cp -rf ~/.ssh /home/dev
	chown -R dev:dev /home/dev/.ssh
fi
echo "done"
