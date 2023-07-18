# How to rewrite path and forward it to different domain
If you want to add a prefix to the existing path and forward the request to a different domain, you can use the NGINX `rewrite` directive in combination with the `proxy_pass` directive. Here's an example:

```bash
server {
    listen 80;
    server_name example.com;

    location / {
        rewrite ^/(.*)$ /prefix/$1 break;
        proxy_pass http://other-domain.com;
    }
}
```

In this example, when a request is made to example.com, the path is rewritten to include the /prefix/ and then the request is forwarded to http://other-domain.com using the proxy_pass directive.

Here are a few examples of how the rewriting and forwarding would work:

1. Request: http://example.com/some-page
        
        Rewritten URL: http://example.com/prefix/some-page
        
        Forwarded URL: http://other-domain.com/prefix/some-page
2. Request: http://example.com/another-page/sub-page
        
        Rewritten URL: http://example.com/prefix/another-page/sub-page
        
        Forwarded URL: http://other-domain.com/prefix/another-page/sub-page
3. Request: http://example.com
        
        Rewritten URL: http://example.com/prefix/
        
        Forwarded URL: http://other-domain.com/prefix/

Make sure to replace example.com with your own domain, `/prefix/` with the desired prefix path, and http://other-domain.com with the target domain you want to forward the request to.

After making the changes, save the configuration file and reload or restart NGINX for the modifications to take effect.

## Redirect to different page

```bash
error_page 404 403 /index.html;
location = /index.html {
root /var/www/html;
internal;
}
```