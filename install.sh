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
	sudo adduser dev
	sudo usermod -aG sudo dev
	sudo getent group sudo
	sudo gpasswd -a dev developers
	sudo cp -rf ~/.ssh /home/dev
	sudo chown -R dev:dev /home/dev/.ssh
	sudo chown -R dev:developers /var/www/
	sudo chmod -R g+w /var/www/
fi

read -p "do you want to set up a git ci user? (y/n) " 
if [[ $REPLY -eq "y" ]]
then 
	sudo adduser gitci
	sudo gpasswd -a gitci developers
	sudo cp -rf ~/.ssh /home/gitci
	sudo chown -R gitci:developers /home/dev/.ssh	
	sudo chown -R gitci:developers /var/www/
	sudo chmod -R g+w /var/www/
fi
echo "done"
