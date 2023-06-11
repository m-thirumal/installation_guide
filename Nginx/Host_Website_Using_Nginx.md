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
	
Restart/reload `Ngnix`

	sudo service nginx restart

Save this file & go to browser and check it ![http://localhost](Default.png) 