### GUI for Docker to connect to local and remote

####Docker image 

	docker pull portainer/portainer
	
#### Create directory for data
	
	mkdir /opt/portainer /data
	
#### Run the docker image

	docker run -d -p 9000:9000 --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data portainer/portainer
	
#### Check the image and container

	docker images
	docker ps
	
#### Access it in browser

[http://localhost:9000](http://localhost:9000)