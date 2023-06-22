# Jenkins Configuration with private IP's

1. Create the pipeline, and build if you want to build it using jenkins

2. Create `sh` file in your project and add `shell` step in your pipeline.

```bash
#! /bin/bash
#author          :Thirumal(racetortoise@gamil.com)
# Change working directory to build path
echo "Changing working directory to build path"
cd /var/lib/jenkins/workspace/UI/build/
# Copy Build to html
echo "Copying build to production server /var/www/html"
scp -i /var/lib/jenkins/PRODUCTION.pem -rp * ubuntu@xx.xx.xxx.xx5:/var/www/html/
# Refresh Nginx
echo "Refreshing Nginx"
ssh -i /var/lib/jenkins/PRODUCTION.pem ubuntu@xx.xx.xxx.xx "sudo systemctl reload nginx"
```

!>  Note : Add `remote server` to `ssh known server`

3. Login to `Jenkins` server and then connect to `remote server` either using `pem` or `password` to add it to `ssh known server`

4. Run the pipeline