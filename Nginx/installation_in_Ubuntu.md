# Nginx (pronounced as “Engine-X”) is an open source web server that is often used as reverse proxy or HTTP cache.

### Installing Nginx

    sudo apt update
    sudo apt install nginx
    
![http://localhost](Default.png)   

### Host your website

Default page is placed in `/var/www/html/` location. You can place your static pages here, or use virtual host and place it other location.

#### Virtual host is a method of hosting multiple domain names on the same server.

Let’s create simple HTML page in `/var/www/tutorial/` (it can be anything you want). Create index.html file in this location.

    cd /var/www
	sudo mkdir tutorial
	cd tutorial
	sudo "${EDITOR:-vi}" index.html

Paste the following to the index.html file:

	<!doctype html>
	<html>
	<head>
	    <meta charset="utf-8">
	    <title>Hello, Nginx!</title>
	</head>
	<body>
	    <h1>Hello, Nginx!</h1>
	    <p>We have just configured our Nginx web server on Ubuntu Server!</p>
	</body>
	</html>

Save this file.

### Setting up virtual host

To set up virtual host, we need to create file in `/etc/nginx/sites-enabled/` directory.

For this tutorial, we will make our site available on 81 port, not the standard 80 port. You can change it if you would like to.

	sudo "${EDITOR:-vi}" tutorial

paste the below content to `tutorial` file
 
	server {
       listen 81;
       listen [::]:81;
       server_name example.ubuntu.com;
       root /var/www/tutorial;
       index index.html;
       location / {
               try_files $uri $uri/ =404;
       }
	}

`root` is a directory where we have placed our .html file. `index` is used to specify file available when visiting root directory of site. `server_name` can be anything you want, because you aren’t pointing it to any real domain by now.

### Activating virtual host and testing results

	sudo service nginx restart
	

![Virtual host](Virtual-host.png)

### [Reverse Proxying](../pgadmin4/Reverse_Proxying_with_ngnix.md)