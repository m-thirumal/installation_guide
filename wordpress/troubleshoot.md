# Website URL/IP address Migration

When there is a change in website domain name change or IP address change, wordpress will break, to rectify that we nedd to modify the URL in many files and db.

We can also use the below script to fix,

```shell
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
```

Download the above script and run the below command by replacing the website url/ip address

```shell
php wp-cli.phar search-replace 'old_site_url' 'new_site_url' --path=/path/to/wordpress/installation --skip-columns=guid
```
