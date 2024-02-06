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