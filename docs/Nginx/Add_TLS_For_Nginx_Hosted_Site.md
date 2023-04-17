## Add TLS for Nginx hosted website

1. Set `Domain name` or `Hostname` name of the server using the following command.

    `sudo hostnamectl set-hostname thirumal.org`
	
2. Next, check the hostname by typing `hostname` in Terminal

suppose, if you get an error 
	
	sudo: unable to resolve host thirumal.org 
	
then, edit the `/etc/hosts` directly to add the domain name.

Proper way of setting name:-

	127.0.0.1       localhost
	127.0.1.1       ubuntu
	127.0.0.1       thirumal.org
	# The following lines are desirable for IPv6 capable hosts
	::1     localhost ip6-localhost ip6-loopback
	ff02::1 ip6-allnodes
	ff02::2 ip6-allrouters

3. Install Nginx

	`sudo apt install nginx`
	
4. Add `A Record` with your `public ip` in your `Website hosting` service provider  `Gogaddy/AWS Route 53`...

5. Install & enable `CERTBOT` use the steps defined in the [Certbot Installation and Configuration](../TLS/certbot.md)       

### To Forward to any other http Port

6. Modify `default` site configuration of Nginx in `sites-enabled` i.e. `/etc/nginx/sites-enabled/default`

7. Add the `proxy_pass` and `proxy_set_header` in the location block of `listening port 443`, as shown below. 

	server {
	        listen 443 ssl;
	        server_name thirumal.org;
	
	        location / {
	            # Managed by Thirumal & Commented the default properties
	            # try_files $uri $uri/ =404;   
	            proxy_pass http://127.0.0.1:8765; # managed by Thirumal
	            proxy_set_header Host $host; # managed by Thirumal
	        }
	
	    ssl_certificate /etc/letsencrypt/live/thirumal.org/fullchain.pem; # managed by Certbot
	    ssl_certificate_key /etc/letsencrypt/live/thirumal.org/privkey.pem; # managed by Certbot
	}

8. Save the file and reload the Nginx configuration using the below command.
	
	`sudo nginx -s reload`            
