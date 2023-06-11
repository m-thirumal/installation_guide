# Create docker and run the image

#### [Create JAR](../spring-boot-jar/create_jar.md)

#### Create docker image

Go to the project location and enter the below command

	docker build --tag {image_name}:1.0 .
	docker build --tag icms:1.0 .

#### Run your image as a container

1. Run the following command to start a container based on your new image:

       docker run --publish 8000:8080 --detach --name icms icms:1.0

   Externalizing log

       docker run -p 8080:8080 -d --name icms -v /var/lib/docker/volume/icms/logs:/logs icms:1.0

There are a couple of common flags here:

   `--publish` asks Docker to forward traffic incoming on the host’s port 8000 to the container’s port 8080. Containers have their own private set of ports, so if you want to reach one from the network, you have to forward traffic to it in this way. Otherwise, firewall rules will prevent all network traffic from reaching your container, as a default security posture.

   `--detach` asks Docker to run this container in the background.

   `--name` specifies a name with which you can refer to your container in subsequent commands, in this case bb.

2. Visit your application in a browser at `localhost:8000`. You should see your `icms` application up and running. At this step, you would normally do everything you could to ensure your container works the way you expected; now would be the time to run unit tests, for example.

3. Once you’re satisfied that your bulletin board container works correctly, you can delete it:

       docker rm --force bb

   The `--force` option stops a running container, so it can be removed. If you stop the container running with docker stop `icms` first, then you do not need to use `--force` to remove it.


## Another Way of building images (FROM 2.3)

	./mvnw spring-boot:build-image
	./gradlew bootBuildImage
