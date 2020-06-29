# Install & Configure PgAdmin 4 using docker [PostgreSQL installation](../PostgreSQL/Install_PostgresQL_in_Ubuntu.md)

1. Set up docker

2. Pull pgadmin4 image
	```
	docker pull dpage/pgadmin4
	```
3. Create a directory in the host to store session data of PgAdmin4
	```
	sudo mkdir /var/lib/pgadmin4
	```
4. Map to Pgadmin user & group 5050
	```
	sudo chown -R 5050:5050 /var/lib/pgadmin/
	```
5. Finally run the docker image
	
	sudo docker run --name pgadmin -p 80:80 -v /var/lib/pgadmin:/var/lib/pgadmin  -e 'PGADMIN_DEFAULT_EMAIL=m.thirumal@hotmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=thirumal' -d dpage/pgadmin4
	
or [For Reverse Proxy](Reverse_Proxying_with_ngnix.md) 
	
	sudo docker run --name pgadmin -p 5050:80 -v /var/lib/pgadmin:/var/lib/pgadmin  -e 'PGADMIN_DEFAULT_EMAIL=m.thirumal@hotmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=thirumal' -d dpage/pgadmin4
	
6. Enter your IP address in the browser to access pgadmin4

7. Create server with host name/address `172.17.0.1`
    
    ![172.17.0.1](172.17.0.1.png)
    
8. To start docker container

	`sudo docker start pgadmin`


![output](Pgadmin4.png)

9. [Reverse Proxy with Ngnix](Reverse_Proxying_with_ngnix.md)