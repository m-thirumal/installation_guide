# Reverse Proxy to Virtual host

### [Set up Virtual host](Set_Up_Virtual_Host.md)

Modify `/etc/ngnix/ngnix.conf` file add the following/similar config inside `http`

    server {
        listen 80;
        server_name localhost;
        location /tutorial {
           # proxy_set_header X-Script-Name /tutorial;
           # proxy_set_header Host $host;
           # proxy_set_header X-Scheme $scheme;
            proxy_pass http://127.0.0.1:81/;
           # proxy_redirect off;
        }
    }
    
###### Note: If you are trying to set up in server replace `localhost/127.0.0.1` with your `Static IP` address  


 ### Multiple Reverse Proxy
 
 Modify `/etc/ngnix/ngnix.conf` file add the following/similar config inside `http`

    server {
        listen 80;
        server_name localhost;
        location /pgadmin {
       	    proxy_set_header X-Script-Name /pgadmin;
            proxy_set_header Host $host;
            proxy_set_header X-Scheme $scheme;
            proxy_pass http://127.0.0.1:5050;
            proxy_redirect off;
        }
        location /tutorial {
           # proxy_set_header X-Script-Name /tutorial;
           # proxy_set_header Host $host;
           # proxy_set_header X-Scheme $scheme;
            proxy_pass http://127.0.0.1:81/;
           # proxy_redirect off;
        }
    }

