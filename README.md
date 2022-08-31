# Webhost

## Debian 11

### Create a dev user
`adduser dev; \
usermod -aG sudo dev; \
getent group sudo; \
cp -rf ~/.ssh /home/dev; \
chown -R dev:dev /home/dev/.ssh;
`

### Set up nginx and a domain
`curl -s -L https://raw.githubusercontent.com/Storken/webhost-setup/main/install.sh | bash`
