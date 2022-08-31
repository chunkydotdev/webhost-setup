#!/bin/bash
# Install nginx webhost and a domain on debian 

echo "downloading webhost repo..."
svn checkout https://github.com/Storken/webhost/trunk/debian-11 -o .webhost-setup
cd .webhost-setup
echo "done"
echo "starting make script"
make