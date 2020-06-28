# Reverse Proxying

## HTTP via Nginx

Add the following code inside http{} in `/et/ngnix/ngnix.config` and replace `{SERVER_IP}` with server ip address

	server {
	    listen 80;
	    server_name {SERVER_IP}
	    location /pgadmin4/ {
	        proxy_set_header X-Script-Name /pgadmin4;
	        proxy_set_header Host $host;
	        proxy_pass http://localhost:5050/;
	        proxy_redirect off;
	    }
	}
	
## HTTPS via Nginx