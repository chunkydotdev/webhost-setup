#!/bin/bash
# Install nginx webhost and a domain on debian 

echo "downloading webhost repo..."
svn export https://github.com/Storken/webhost-setup.git/trunk/debian-11 ~/.wbh
cd ~/.wbh
echo "done"
echo "starting make script"
make install_hosting
