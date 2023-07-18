# To access website log

```bash
tail -f /var/log/nginx/thirumal.com.access.log
```

# To Add separate LOG for each website

```bash
http {
      ...
      ...
      access_log  /var/log/nginx/thirumal.com.access.log;
      error_log  /var/log/nginx/error_log;
    
         server {
                  listen 80; 
                  server_name domain1.com
                  access_log  /var/log/nginx/thirumal.com.access.log;
                  error_log  /var/log/nginx/error_log debug;
                  ...
                  ...
                }
}
```