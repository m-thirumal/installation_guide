# Install & Configure PgAdmin 4 using docker

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
	```
	sudo docker run --name pgadmin -p 80:80 -v /var/lib/pgadmin:/var/lib/pgadmin  -e 'PGADMIN_DEFAULT_EMAIL=m.thirumal@hotmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=thirumal' -d dpage/pgadmin4
	```
6. Enter your IP address in the browser to access pgadmin4

7. To start docker container

	`sudo docker start pgadmin`


![output](Pgadmin4.png)