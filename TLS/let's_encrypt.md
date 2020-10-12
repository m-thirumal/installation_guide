# Generate Free TLS/SSL using Let's Encrypt

1. Start Docker and pull `certbot` image


	`docker pull certbot/certbot`
	

2. Run the below command

	`docker run -it -v /Users/thirumal/certificate:/etc/letsencrypt certbot/certbot certonly --manual --preferred-challenges dns --email xxxx@YYYY.com --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d '*.example.com'`
	
3. After running the above command it will ask you to add TXT record to your DNS before pressing enter.

4. Login to your Domain provider (Godaddy/AWS Route 53) to add DNS TXT records.
	
	`Record name : _acme-challenge.example.com.`
	
	`Recort type : txt`
	
	`Value/Route Traffic ===> IP address or another ...       : {displayed in the terminal}`

 
  ![Add txt Record](add_record_txt_to_aws.png)
  
  
5. Return to your Terminal and press `enter to validate and to generate the TLS`

6. It will generate few folders which similar to the image ![folder_structure](folder_structure.png)

7. `PEM` files can be found in `archive\website domain name\`

![tls_files](tls_files.png)


### Add the certificates in the AWS certificate manager

1. Create certificate manager in `N-Virginia` region
  ![Certificate Manager](certificate_manager.png)
  
2. Go to AWS Certificate Manager > `Import a certificate`
3. Add the content of `cert.pem` to Certificate body. Use `cat cert.pem` in terminal to print the content of `pem` file
4. Add the content of `privkey.pem` to Certificate private key
5. Add the content of `chain.pem` to Certificate chain

or

Use AWS-CLI to import new certificate (Note: this will not work for renewal)

    aws --region us-east-1 acm import-certificate --certificate "file:///Users/thirumal/certificate/live/indsolv.com/cert.pem" --private-key "file:///Users/thirumal/certificate/live/indsolv.com/privkey.pem" --certificate-chain "file:///Users/thirumal/certificate/live/indsolv.com/fullchain.pem" --profile enkindle_certificate_manager
    
### Same steps for Renewal

  ![Import PEM to Certificate Manager](import_pem_to_certificate_mananger.png)
  
  ![Import Success](import_success.png)
  
