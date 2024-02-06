# Import

Install `All-in-One WP Migration` plugin

?> by default the plugin will allow only 2Mb to upload. 

?> _TODO_ Modify file upload size in `/srv/www/wordpress/.htaccess` by adding the following lines

```xml
# Adjust upload file size limit
php_value upload_max_filesize 600M
php_value post_max_size 500M
php_value max_execution_time 300
php_value max_input_time 300
```

then, restart apache1

```shell
sudo service apache2 restart
```

