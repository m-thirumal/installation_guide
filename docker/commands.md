
| Purpose                                  | Images | Container |
| ---------------------------------------  | ------- | ----------- |
| List                                     | `docker images` | `docker container ls` <br> `docker ps -l` <br> `docker ps -a` <br> `docker ps --filter name=ngnix` |
| Pull Images                              | `docker pull {images}` |  |
| Remove images                            | `docker rmi {image_name/id}` <br> `docker rmi -f {image_name/id}` | `docker rm {Container Id}` <br> `docker rm -f {container_id}` - Use force `-f` To remove running container |
| Remove dangling (none) images            | `docker rmi $(docker images -f "dangling=true" -q)` |   |
| Run                                      |    | `docker run -d {image:tag}` -d => stands for de-attach mode |
| Temporary container - Once exit from bash container will get destroy.                      |    | `docker run --rm -ti ubuntu bash` |
| Create image from the container          | `docker commit {container_id} {imageName}:{tag_name}` |  |
| Re-Name                                  |    | `docker rename {current_container_name} {new_container_name}`|
| Start                                    |    | `docker start {}` |
| Name the container                       |    | `docker run -d --name {container name} -p 80:80 nginx` |
| Run container (restart always)           |    | `docker run --restart always --detach --name auto-start-redis redis` |
| Expose Port                              |    | To expose port use `-p-`Eg: `docker run -d -p {host_os_port}:{docker_port} {image:tag}` Example: `docker run -d -p 9090:80 nginx:alpine` |
| Stop container                           |    |  `docker stop $(docker ps -q)` |
| Log                                      |    |  `docker logs -f {container id/name}` |
| Statistics of container (CPU/RAM/...)    |    | `docker stats {container_id}` |
| Limit the memory usage of container      |    | `docker run -d --name {container_name} --memory "200mb" nginx:alpine` |
| Limit the CPU usage                      |    | [0,3] - means use oly 0 and 3. [0-3] means use 0 to 3  Ex: `docker run -d --name {container_image} --memory "200mb" --cpuset-cpus 0-3 ngnix:alpine` |
| Inspect container                        |    | `docker inspect {container_id}`   |
| Login/Access Container                   |    | `docker exec -it {containerName} bash` |
| Copy files from host to docker container |    | `docker cp {filename} {container_name}:/{destination}` Ex: `docker cp thirumal.txt nginx1:/var/www/` |
| Copy files from docker container to host |    | `docker cp {container_name}:/{source path}  /{destination}` Ex: ` docker cp nginx1:/var/www/thirumal.txt .` |
| Help                                     | `docker --help` |  |


## RUN

Use to install application
```shell
FROM ubuntu
RUN apt-get install git
```

## CMD

Command to execute
```shell
From ubuntu
RUN apt-get install nginx
ngnixctl -DFOREGROUND
```

The process must be `foregroud`, otherwise the docker will exit.
If there is no `foreground` process then use the following command `ti` (terminal) to keep alive for debug
```shell
docker run -d -ti --name {Container_name} -p {PORT:PORT} {image}
```
