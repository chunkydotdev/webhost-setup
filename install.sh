#!/bin/bash
# Install nginx webhost and a domain on debian 

echo "downloading webhost repo..."
svn checkout https://github.com/Storken/webhost/trunk/debian-11
cd debian-11
echo "done"
echo "starting make script"
make