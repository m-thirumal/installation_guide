# Forward request to another domain or port

* Go to `/etc/nginx/sites-available/default`.

* Add the domain and port in the `proxy_pass`

```bash
location / {
            # First attempt to serve request as file, then
            # as directory, then fall back to displaying a 404.
            #try_files $uri $uri/ =404;
            proxy_pass http://127.0.0.1:9095; # Forward to another Domain/PORT
            proxy_http_version 1.1;
            proxy_set_header Host $host; # Preserve Actual Header
            client_max_body_size 1025M; # Maximum size of files that they can upload
    }
```