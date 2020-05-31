# Generate Free TLS/SSL using Let's Encrypt

1. Start Docker and pull `certbot` image

2. Run the below command

	```
	docker run -it -v /Users/thirumal/certificate:/etc/letsencrypt certbot/certbot certonly --manual --preferred-challenges dns --email xxxx@YYYY.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d '*.example.com'
	
	``` 

3. It will generate few folders which similar to [folder_structure](folder_structure.png)

4. `PEM` files can be found in `archive\domain name`

5. ![tls_files](tls_files.png)