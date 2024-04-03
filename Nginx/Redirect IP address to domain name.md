# Redirecting IP address to domain name

User might acccess the website using the server IP address instead of using website domain name. To avoid/bolck that we need to redirect.

## Why?

1. Insecure access of website using IP address can be blocked
2. No need to add SSL certificate to IP address

## How to do?

Go to `sudo vi /etc/nginx/sites-available/default` and add the following new server block of code to the configurationwith your domain name

```bash
server {
        listen 80;
        server_name 11.123.123.123;
        return 301 $scheme://example.com$request_uri;
}
```
