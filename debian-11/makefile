
create_user:
	adduser dev
	usermod -aG sudo dev
	getent group sudo
	cp -rf ~/.ssh ../home/dev
	chown -R dev:dev ../home/dev/.ssh

install_nginx:
	sudo apt update 
	sudo apt install nginx -y

setup_firewall:
	sudo apt install ufw -y
	sudo ufw app list
	sudo ufw allow 'Nginx FULL'
	sudo ufw allow 'OpenSSH'
	sudo ufw enable
	sudo systemctl start nginx
	sudo systemctl enable nginx

setup_website:
	@read -p "Enter domain (without http/https)" domain; \
	sudo mkdir -p /var/www/$$domain/html; \
	sudo chown -R $USER:$USER /var/www/$$domain/html; \
	sudo chmod -R 755 /var/www/$$domain; \
	cp ~/.webhost-server-setup/domain.conf /etc/nginx/sites-available/$$domain; \
	sed -i 's/\{domain\}/$$domain/g' /etc/nginx/sites-available/$$domain; \
	sudo ln -s /etc/nginx/sites-available/$$domain /etc/nginx/sites-enabled/; \
	sudo cp ~/.webhost-server-setup/nginx.conf /etc/nginx/nginx.conf
	sudo nginx -t
	sudo systemctl restart nginx

setup_cert:
	sudo apt install snapd -y
	sudo snap install core -y
	sudo snap install --classic certbot -y
	sudo ln -s /snap/bin/certbot /usr/bin/certbot
	sudo certbot --nginx --register-unsafely-without-email
