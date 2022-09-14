#!/bin/bash
# Install add a domain

IP=$(hostname -I | cut -d' ' -f1)
echo "Make sure you've pointed an A Record with Host '@' and value $IP"
cd ~/.wbh

read -p "Enter a domain (for example 'example.com'): " DOMAIN

read -p "Do you want to set up domain hosting (you can skip to just set up a certificate)? (y/n) " 
if [[ $REPLY -eq "y" ]]
then 
    make add_domain_cert domain=$DOMAIN
fi
echo "done"

read -p "Do you want to set up an ssl certificate for $DOMAIN? (y/n) " 
if [[ $REPLY -eq "y" ]]
then 
    make add_domain_cert domain=$DOMAIN
fi
echo "done"