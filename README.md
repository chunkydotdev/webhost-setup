# Webhost

## Debian 11

### Create a dev user
To create user:</br>
`adduser dev`</br>
You'll be prompted for a password and user info.

To give user permissions:</br>
	`usermod -aG sudo dev &&
	getent group sudo &&
	cp -rf ~/.ssh /home/dev &&
	chown -R dev:dev /home/dev/.ssh`

### Set up nginx and a domain
`curl -s -L https://raw.githubusercontent.com/Storken/webhost-setup/main/install.sh | bash`
