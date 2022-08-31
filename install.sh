#!/bin/bash
# Install nginx webhost and a domain on debian 

echo "updating apt"
sudo apt update
sudo apt install subversion make -y

echo "downloading webhost repo..."
svn export https://github.com/Storken/webhost-setup.git/trunk/debian-11
cd debian-11
echo "done"
echo "starting make script"
make install_nginx setup_firewall 
read -p "What domain do you want to use (without http/https): " DOMAIN
make setup_website setup_cert domain=$DOMAIN