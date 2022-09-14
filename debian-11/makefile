all: install_nginx setup_firewall

install_hosting:
	sudo ufw app list
	sudo ufw allow 'Nginx FULL'
	sudo ufw allow 'OpenSSH'
	echo "y" | sudo ufw enable
	sudo systemctl start nginx
	sudo systemctl enable nginx

add_domain:
	sudo mkdir -p /var/www/$(domain)/html; \
	sudo chown -R ${USER}:${USER} /var/www/$(domain)/html; \
	sudo chmod -R 755 /var/www/$(domain); \
	sudo cp domain.conf /etc/nginx/sites-available/$(domain); \
	sudo sed -i "s/domain/$(domain)/g" /etc/nginx/sites-available/$(domain); \
	sudo ln -s /etc/nginx/sites-available/$(domain) /etc/nginx/sites-enabled;
	sudo cp nginx.conf /etc/nginx/nginx.conf
	sudo nginx -t
	sudo systemctl restart nginx

add_domain_cert:
	sudo apt install snapd -y
	sudo snap install core
	sudo snap install --classic certbot
	sudo ln -s /snap/bin/certbot /usr/bin/certbot
	echo "Y" | sudo certbot --nginx --register-unsafely-without-email -d $(domain)
