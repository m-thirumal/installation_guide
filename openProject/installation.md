[Open Project](https://www.openproject.org/) is a good alternative open source to JIRA and confluence. 

# Installation

The site [https://www.openproject.org/docs/installation-and-operations/installation/packaged/](https://www.openproject.org/docs/installation-and-operations/installation/packaged/) has well documentation for installation and configuration 

## Prerequisite Knowledge

* [PostgreSQL](../PostgreSQL/Install_PostgresQL_in_Ubuntu.md)
* Apache2/Nginx
* TLS using [Let's Encrypt](../TLS/let's_encrypt.md)
* [Git](../git/commands.md)
* Memcached server
* Host name, Domain name and Protocol

## Intial Configuration

* Follow the offical documentation, to configure, you might face a difficulty only on the Database reuse

### Re-Use Database

* Make sure the connections are proper and create `database` and give the same name here.

* Enter correct database `user name`, `passwords`, `database name`, `ip address`, and `port`.

### Webserver

* Skip `Apache 2` installation.
* Install `Nginix` and re-direct the URL to `http://127.0.0.1:6000`

```bash
location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                #try_files $uri $uri/ =404;
            proxy_pass http://127.0.0.1:6000; # Forward to another Domain/PORT
            proxy_http_version 1.1;
            proxy_set_header Cookie $http_cookie;
            proxy_set_header X-Forwarded-Proto $scheme; # To avoid csrf error, it's must
            proxy_set_header Host $host; # Preserve Actual Header
            proxy_set_header X-Real-IP $remote_addr; # Preserve Actual client Ip
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            client_max_body_size 1025M; # Maximum size of files that they can upload
        }
```

### TLS/SSL

* When you install select `NO` for SSL option and then,

* Run `certbot` to create SSL certificate in `/etc/letsencrypt/live/`

* Then, reconfigure

```bash
sudo openproject reconfigure
```

* and, enter the certificate location,
* Enter the `/etc/letsencrypt/live/openproject.mydomain.com/fullchain.pem` path when asked for the `server/ssl_cert` detail.
* Enter the `/etc/letsencrypt/live/openproject.mydomain.com/privkey.pem` path when asked for the `server/ssl_key` detail.
* Enter the `/etc/letsencrypt/live/openproject.mydomain.com/fullchain.pem` path (same as `server/ssl_cert`) when asked for the `server/ssl_ca` detail.

### Renew SSL

```bash
 sudo certbot --nginx
```

### Email

### [Troubleshoot](openProject/troubleshoot.md)

