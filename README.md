# Webhost
This setup assumes you're using the server through ssh

## Debian 11, Ubuntu 22, Ubuntu 20
For a new server go through the following steps:
    1. Create a user, the scripts are made for a 'dev' user, unless a certain reason i suggest just going along with that
    2. Once the dev user is created, sign out of root and ssh back in with the dev user (`ssh dev@IP-ADDRESS`)
    3. Set up nginx for hosting your websites
    4. Add a domain


### Create a dev user
To create user:
```sh
curl -s -L https://raw.githubusercontent.com/Storken/webhost-setup/main/create-user.sh -o create-user.sh && bash create-user.sh && rm create-user.sh
```
You'll be prompted for a password and user info.

### Set up nginx
```sh
curl -s -L https://raw.githubusercontent.com/Storken/webhost-setup/main/install.sh -o install.sh && bash install.sh && rm install.sh
```


### Add a domain
```sh
curl -s -L https://raw.githubusercontent.com/Storken/webhost-setup/main/add-domain.sh -o add-domain.sh && bash add-domain.sh && rm add-domain.sh
```