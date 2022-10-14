#!/bin/bash
# Install nginx webhost and a domain on debian 

echo "updating apt"
sudo apt update
sudo apt upgrade -y
sudo apt install subversion make ufw nginx -y
sudo groupadd developers
	
echo "packages are updated"
read -p "do you want to set up a dev user? (y/n) " 
if [[ $REPLY -eq "y" ]]
then 
	adduser dev
	usermod -aG sudo dev
	getent group sudo
	gpasswd -a dev developers
	cp -rf ~/.ssh /home/dev
	sudo chown -R dev:dev /home/dev/.ssh
	sudo chown -R dev:developers /var/www/
	sudo chmod -R g+w /var/www/
fi

read -p "do you want to set up a git ci user? (y/n) " 
if [[ $REPLY -eq "y" ]]
then 
	adduser gitci
	gpasswd -a gitci developers
	cp -rf ~/.ssh /home/dev
	sudo chown -R gitci:developers /home/dev/.ssh	
	sudo chown -R gitci:developers /var/www/
	sudo chmod -R g+w /var/www/
fi
echo "done"
