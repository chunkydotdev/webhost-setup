all: install_nginx setup_firewall setup_website setup_cert end

install_nginx:
	sudo apt update 
	sudo apt install nginx -y

setup_firewall:
	sudo apt install ufw -y
	sudo ufw app list
	sudo ufw allow 'Nginx FULL'
	sudo ufw allow 'OpenSSH'
	sudo ufw enable -y
	sudo systemctl start nginx
	sudo systemctl enable nginx

setup_website:
	read -p "Enter domain without http/https: " domain; \
	sudo mkdir -p /var/www/$$domain/html; \
	sudo chown -R ${USER}:${USER} /var/www/$$domain/html; \
	sudo chmod -R 755 /var/www/$$domain; \
	cp domain.conf /etc/nginx/sites-available/$$domain; \
	sed -i "s/domain/$$domain/g" /etc/nginx/sites-available/$$domain; \
	sudo ln -s /etc/nginx/sites-available/$$domain /etc/nginx/sites-enabled/;
	sudo cp nginx.conf /etc/nginx/nginx.conf
	sudo nginx -t
	sudo systemctl restart nginx

setup_cert:
	sudo apt install snapd -y
	sudo snap install core -y
	sudo snap install --classic certbot -y
	sudo ln -s /snap/bin/certbot /usr/bin/certbot
	sudo certbot --nginx --register-unsafely-without-email

end:
	echo "Your ssh capabilities have been copied to user 'dev'"
	echo "For further changes, sign out of $USER and sign in with 'dev'"
