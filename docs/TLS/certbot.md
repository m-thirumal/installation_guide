## Install CertBot for Auto Renewal of SSL/TLS

### Instal PIP

```bash
sudo apt install python3 python3-venv libaugeas0
```

### Set up a virtual environment:

```bash
sudo python3 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
```

### Install Certbot on Apache or NGINX:

```bash
sudo /opt/certbot/bin/pip install certbot certbot-apache
```

OR

```bash
sudo /opt/certbot/bin/pip install certbot certbot-nginx
```

### Create a symlink to ensure Certbot runs:

```bash
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
```

## Create an SSL Certificate with Certbot

### Create SSL certs for all domains and configure redirects in the web server:

For Apache

```bash
sudo certbot --apache
```

For Nginx

```bash
sudo certbot --nginx
```

### Create SSL certs for a specified domain (recommended if you’re using your system hostname):


```bash
sudo certbot --apache -d example.com -d www.example.com
```

### Only install SSL certs:

```bash
sudo certbot certonly --apache
```

```bash
sudo certbot certonly --nginx
```

## Troubleshooting


The certificate files for each domain is stored in:

`cd /etc/letsencrypt/live`

Let’s Encrypt certificates expire after 90 days. To prevent SSLs from expiring, Certbot checks your SSL status twice a day and renews certificates expiring within thirty days. You can view settings with Systemd or cron.d.

`systemctl show certbot.timer`

`cat /etc/cron.d/certbot`

Ensure the renewal process works:

`sudo certbot renew --dry-run`
