# Webhost

## Debian 11

### Create a dev user
To create user:
```sh 
adduser dev
```
You'll be prompted for a password and user info.

And then give the user permissions:
```sh 
usermod -aG sudo dev
getent group sudo
cp -rf ~/.ssh /home/dev
chown -R dev:dev /home/dev/.ssh
```

### Set up nginx and a domain
```sh
curl -s -L https://raw.githubusercontent.com/Storken/webhost-setup/main/install.sh | bash
```
