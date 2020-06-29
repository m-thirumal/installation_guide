# Reverse Proxy with symbolic link

1. Create a file in `/etc/nginx/sites-available`

2. Add the following content to the file

```
server {
	listen 80;
	location / {
		proxy_pass "http://localhost:8080";
	}
}
```

3. Save the file

4. Create symblink

	`sudo ln -s /etc/nginx/sites-available/{file_name} /etc/nginx/sites-enabled/{file_name}`
	
5. Reload the nginx

	`sudo service nginx restart`
	