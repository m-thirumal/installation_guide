#!/bin/bash
# Start docker and pull certbot image
docker pull certbot/certbot
#Run the below command
docker run -it -v /etc/letsencrypt/certificate:/etc/letsencrypt certbot/certbot certonly --manual --preferred-challenges dns --email m.thirumal@hotmail.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d '*.indsolv.com'
#
