# ex-server-deploy

This script will remotely install nginx, apache and webmin, configure them and start the services.
It will also configure the firewall to allow connections on the ports:

- Nginx: 80 and 443
- Apache: 8080
- Webmin: 10000

## Requeriments

### In local:

- Python 3.
- A Unix shell.
- SSH Public Key generated.

### In server:

- An os based on debian (debian, ubuntu, mint...)
- Port SSH (22) open.
- SSH Public Key generated in local machine copied in server.
- An admin user (sudoer).

To install python 3: https://realpython.com/installing-python/

To generate a SSH Public Key:

```bash
ssh-keygen -t rsa
```

To copy a SSH Public Key to the server:

```bash
ssh-copy-id user@serverip
```

## Usage

```bash
git clone https://github.com/mjose-portfolio/ex-server-deploy.git && cd ex-server-deploy.git && sh setup.sh
```

The script will ask for:

- The ip or the name of the server to be deployed.
- The user to be used for ssh connections.
- The password to be used when the sudo command is required.

## Test:

In a local web browser go to:

- Nginx: http://server_ip:80/
- Apache: http://server_ip:8080
- Webmin: https://server_ip:10000/ (To login we will use a server admin user)

