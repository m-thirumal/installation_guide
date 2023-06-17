# Nginx Security Tips

## Scan your website in the following website

[https://securityheaders.com/](https://securityheaders.com/)

### Hide server details in `HTTP Header` response.

Add the following detail in the `http` block

```bash
http {

    # To avoid exposing Nginx server details
    server_tokens off;
}

```

### Add Security HTTP Headers to Prevent Vulnerabilities
Add `add_header` in `http` tag

```bash
http {
    # To avoid exposing Nginx server details
    server_tokens off;
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload";
    add_header X-Frame-Options "SAMEORIGIN";
    add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval' style-src 'self' 'unsafe-inline'; img-src 'self' data:";
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Content-Type-Options "nosniff";
    add_header "X-Permitted-Cross-Domain-Policies" "master-only";
    add_header "Referrer-Policy" "strict-origin";
    add_header Feature-Policy "geolocation none;midi none;notifications none;push none;sync-xhr none;microphone none;camera none;magnetometer none;gyroscope none;speaker self;vibrate none;fullscreen self;payment none;";
    add_header Permissions-Policy "geolocation none;midi none;notifications none;push none;sync-xhr none;microphone none;camera none;magnetometer none;gyroscope none;speaker self;vibrate none;fullscreen self;payment none;";
}
```

###### X-Permitted-Cross-Domain-Policies

```bash
Value	Description
none	No policy files are allowed anywhere on the target server, including this master policy file.
master-only	Only this master policy file is allowed.
by-content-type	[HTTP/HTTPS only] Only policy files served with Content-Type: text/x-cross-domain-policy are allowed.
by-ftp-filename	[FTP only] Only policy files whose file names are crossdomain.xml (i.e. URLs ending in /crossdomain.xml) are allowed.
all	All policy files on this target domain are allowed.
```

Implementation:-

Nginx:

```bash
add_header X-Permitted-Cross-Domain-Policies master-only;
```