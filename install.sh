#!/bin/bash
# Install nginx webhost and a domain on debian 

echo "downloading webhost repo..."
git pull origin https://github.com/Storken/webhost-setup/ -o .webhost-setup
cd .webhost-setup/debian-11
echo "done"
echo "starting make script"
make