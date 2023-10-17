[Open Project](https://www.openproject.org/) is a good open source alternative to JIRA and confluence. 

# Installation

The site [https://www.openproject.org/docs/installation-and-operations/installation/packaged/](https://www.openproject.org/docs/installation-and-operations/installation/packaged/) has well documentation for installation and configuration 

## Prerequisite Knowledge

* [PostgreSQL](../PostgreSQL/Install_PostgresQL_in_Ubuntu.md)
* Apache2
* TLS using [Let's Encrypt](../TLS/let's_encrypt.md)
* [Git](../git/commands.md)
* Memcached server
* Host name, Domain name and Protocol



## Intial Configuration

* Follow the offical documentation, to configure, you might face a difficulty only on the Database reuse

### Re-Use Database

* Make sure the connections are proper and create `database` and give the same name here.

* Enter correct database `user name`, `passwords`, `database name`, `ip address`, and `port`.

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

### Email


### Troubleshoot
   1. To check database configuration - `vi /etc/openproject/conf.d/00_addon_postgres`

##### Trouble during update
   1. Reconfigure the `openproject`
         ```sudo openproject reconfigure```

