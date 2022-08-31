#!/bin/bash
# Install add a domain

read -p "What domain do you want to use (without http/https): " DOMAIN
make setup_website setup_cert domain=$DOMAIN