# Configure Nginx to Host Multiple Websites

1. [Create Directory Structure](#create-directory-structure)
2. [Upload Website Content](#upload-website-content)
3. [Create Virtual Configuration](#create-virtual-configuration)
4. [Test Websites](#test-websites)

#### Create Directory Structure

To `host multiple websites` is to create a separate document root directory and configuration file for each website. So, you will need to create a `directory structure` for all websites inside Nginx web root:

To do so, run the following command for each website:

```bash
mkdir /var/www/html/docs.thirumal.com
mkdir /var/www/html/app.thirumal.com
```

#### Upload Website Content

Upload the website content for each website

#### Create Virtual Configuration

Create a `virtual host configuration file`` for each website that indicate how the Nginx web server will respond to various `domain requests``.

First, create a virtual host configuration file for the `docs.thirumal.com` website:

```bash
nano /etc/nginx/sites-available/docs.thirumal.com.conf
```

Add the following lines

```bash
server {
       listen 80;
        listen [::]:80;
       root /var/www/html/docs.thirumal.com;
       index index.html index.htm;
       server_name docs.thirumal.com;

  location / {
      try_files $uri $uri/ =404;
  }

}
```

Create `link` for `site-enabled`

```bash
ln -s /etc/nginx/sites-available/docs.thirumal.com.conf /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/app.thirumal.com.conf /etc/nginx/sites-enabled/
```

Repeat the [Create Virtual Configuration](#create-virtual-configuration) steps for as many as website, you need to host

#### Test Websites

Check Nginx for any syntax error with the following command:

```bash
nginx -t
```

If everything goes fine, you should get the following output:

```bash
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

Finally, restart the Nginx service to apply the configuration changes:

```bash
systemctl restart nginx
```

