# Wordpress Installation

Main source

## Install Dependencies

To install PHP and Apache, use following command:

```shell
sudo apt update
sudo apt install apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 mysql-server \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip
```

## Install WordPress

!> We will use the release from WordPress.org rather than the APT package 

```shell
sudo mkdir -p /srv/www
sudo chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
```

!> Note that this sets the ownership to the user www-data, which is potentially insecure, such as when your server hosts multiple sites with different maintainers. You should investigate using a user per website in such scenarios and make the files readable and writable to only those users. This will require configuring PHP-FPM to launch a separate instance per site each running as the site’s user account. In such setup the wp-config.php should (read: if you do it differently you need a good reason) be readonly to the site owner and group and other permissions set to no-access (chmod 400). This is beyond the scope of this guide, however.


## Configure Apache for WordPress

Create Apache site for WordPress.

```shell
sudo vi /etc/apache2/sites-available/wordpress.conf
```

then, add the following content

```xml
<VirtualHost *:80>
    DocumentRoot /srv/www/wordpress
    <Directory /srv/www/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>
    <Directory /srv/www/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
```

#### Enable the site with:

```shell
sudo a2ensite wordpress
```
#### Enable URL rewriting with:

```shell
sudo a2enmod rewrite
```
#### Disable the default “It Works” site with:

```shell
sudo a2dissite 000-default
```

OR

Instead of disabling the “it works” page, you may edit our configuration file to add a hostname that the WordPress installation will respond to requests for. This hostname must be mapped to your box somehow, e.g. via DNS, or edits to the client systems’ /etc/hosts file. Add ServerName as below:

```xml
<VirtualHost *:80>
    ServerName hostname.example.com
    ... # the rest of the VHost configuration
</VirtualHost>
```

## Configure database

To configure WordPress, we need to create `MySQL` database. 

```shell
ubuntu@ip-172-31-46-25:~$ sudo mysql -u root
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.36-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE wordpress;
Query OK, 1 row affected (0.01 sec)

mysql> CREATE USER wordpress@localhost IDENTIFIED BY '<YOUR PASSWORD>';
Query OK, 0 rows affected (0.02 sec)

mysql> GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;
Query OK, 0 rows affected (0.01 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.01 sec)

mysql> quit
Bye

```


Enable `MySQL` with 

```shell
sudo service mysql start
```

## Configure WordPress to connect to the database

Now, let’s configure WordPress to use this database. First, copy the sample configuration file to wp-config.php:

```shell
sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
```

Next, set the database credentials in the configuration file (do not replace database_name_here or username_here in the commands below. Do replace <your-password> with your database password.):

```shell
sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/<your-password>/' /srv/www/wordpress/wp-config.php
```

Finally, in a terminal session open the configuration file in nano:

```shell
sudo -u www-data vi /srv/www/wordpress/wp-config.php
```

Find the following:

```shell
define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );
```

Delete the above lines, Then replace with the content of https://api.wordpress.org/secret-key/1.1/salt/. (This address is a randomiser that returns completely random keys each time it is opened.) This step is important to ensure that your site is not vulnerable to “known secrets” attacks.


