# Generate CSR
```
openssl req -new -newkey rsa:2048 -nodes -keyout example.key -out example.csr
```
The above command will generate `key` and `csr` files

# Create `.crt` file from the zip

```
cat eb1894a.crt gd_bundle-g2-g1.crt > example.crt
```

# Copy certificate and key

```
cd /etc/nginx/
sudo mkdir ssl
sudo cp /home/ubuntu/example.com.crt /etc/ngnix/ssl/
sudo cp /home/ubuntu/example.com.key /etc/ngnix/ssl/
```

# Create domain

```
sudo nano /etc/ngnix/sites-available/example.com
```

add the below code to the file

```
server {
    listen 443 ssl;
    server_name example.com;

     root /var/www/html;

    ssl_certificate /etc/nginx/ssl/example.com.crt;
    ssl_certificate_key /etc/nginx/ssl/example.com.key;

    # Other SSL-related configurations go here

    # Add other configurations for your site
}
```

#  Create link

```
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
```

# Test and Reload

```
sudo nginx -t
sudo systemctl restart nginx
```
