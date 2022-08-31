#!/bin/bash
# Install nginx webhost and a domain on debian 

echo "updating apt"
sudo apt update
sudo apt install subversion make -y

echo "downloading webhost repo..."
svn export https://github.com/Storken/webhost-setup.git/trunk/debian-11
cd debian-11
echo "done"
echo "creating user 'dev'..."
make create_user
rm -rf debian-11
logout