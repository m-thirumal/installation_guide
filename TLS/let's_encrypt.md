## Generate Free TLS/SSL using Let's Encrypt

* Start Docker and pull `certbot` image

```
docker pull certbot/certbot
```
	
* Run the below command to generate Certificate

```
docker run -it -v /Users/thirumal/certificate:/etc/letsencrypt certbot/certbot certonly --manual --preferred-challenges dns --email racetortoise@gmail.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d '*.example.com'
```

With specific certification key type `[rsa, ecdsa]`

```
docker run -it -v /Users/thirumal/certificate:/etc/letsencrypt certbot/certbot certonly --manual --preferred-challenges dns --key-type rsa --email racetortoise@gmail.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d '*.example.com'
```
	
* After running the above command it will ask you to add TXT record to your DNS before pressing enter.

* Login to your Domain provider (Godaddy/AWS Route 53) to add DNS TXT records.

```
Record name : _acme-challenge.example.com.
Recort type : txt
Value/Route Traffic ===> IP address or another ...       : {displayed in the terminal}
```

![](img/add_record_txt_to_aws.png)
  
  
* Return to your Terminal and press `enter to validate and to generate the TLS`

* It will generate few folders which similar to the image::img/folder_structure.png[folder_structure]

* `PEM` files can be found in `archive\website domain name\`

![tls_file](img/tls_files.png)


### Add the certificates in the AWS certificate manager

* Create certificate manager in `N-Virginia` region
  
![Certificate Manager](img/certificate_manager.png)
  
* Go to AWS Certificate Manager > `Import a certificate`
* Add the content of `cert.pem` to Certificate body. Use `cat cert.pem` in terminal to print the content of `pem` file
* Add the content of `privkey.pem` to Certificate private key
* Add the content of `chain.pem` to Certificate chain

or

Use AWS-CLI to import new certificate (Note: this will not work for renewal)

```
aws --region us-east-1 acm import-certificate --certificate "file:///Users/thirumal/certificate/live/indsolv.com/cert.pem" --private-key "file:///Users/thirumal/certificate/live/indsolv.com/privkey.pem" --certificate-chain "file:///Users/thirumal/certificate/live/indsolv.com/fullchain.pem" --profile enkindle_certificate_manager
```

To Re-Import, need to specify ceritificate arn

```
aws --region us-east-1 acm import-certificate --certificate "file:///Users/thirumal/certificate/live/indsolv.com/cert.pem" --private-key "file:///Users/thirumal/certificate/live/indsolv.com/privkey.pem" --certificate-chain "file:///Users/thirumal/certificate/live/indsolv.com/fullchain.pem" --certificate-arn arn:aws:acm:us-east-1:597991982472:certificate/6c1fe3b4-3ba7-4414-ba13-e4e446224aea --profile enkindle_certificate_manager
```

To Re-import from linux
 
```
aws --region us-east-1 acm import-certificate --certificate "file:///etc/letsencrypt/certificate/live/insolvencysoftware.in/cert.pem" --private-key "file:///etc/letsencrypt/certificate/live/insolvencysoftware.in/privkey.pem" --certificate-chain "file:///etc/letsencrypt/certificate/live/insolvencysoftware.in/fullchain.pem" --certificate-arn arn:aws:acm:us-east-1:597991982472:certificate/b4e34784-11fc-4c34-b75b-7135ac46c817 --profile enkindle_certificate_manager
```
    
### Same steps for Renewal

![Import PEM to Certificate Manager](img/import_pem_to_certificate_mananger.png)
  
![Import Success](img/import_success.png)
  
