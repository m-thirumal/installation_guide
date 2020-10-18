## Images

#### List images

    docker images

#### Remove images

    docker rmi {image_name/id}

    docker rmi -f {image_name/id}

## Container

#### Create container

    docker run -d {image:tag}

    -d => stands for de-attach mode

#### List containers

    docker ps -l

#### Remove container

    docker rm {Container Id}

    Use force `-f` To remove running container 

    docker rm -f {container_id}

#### Start contaier

    docker start {}

#### Expose Port

To expose port use `-p-`

    docker run -d -p {host_os_port}:{docker_port} {image:tag}
    docker run -d -p 9090:80 nginx:alpine

