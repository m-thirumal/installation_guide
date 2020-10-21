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

#### Re-Name

    docker rename {current_container_name} {new_container_name}


#### List containers

    docker ps -l

    docker ps -a

#### Remove container

    docker rm {Container Id}

    Use force `-f` To remove running container

    docker rm -f {container_id}

#### Start contaier

    docker start {}

#### Name the container

    docker run -d --name {container name} -p 80:80 nginx

#### Expose Port

To expose port use `-p-`

    docker run -d -p {host_os_port}:{docker_port} {image:tag}
    docker run -d -p 9090:80 nginx:alpine

#### Statistics of container (CPU/RAM/...)

    docker stats {container_id}

#### Limit the memory usage of container

    docker run -d --name {container_name} --memory "200mb" nginx:alpine

#### Limit the CPU usage

    [0,3] - means use oly 0 and 3. [0-3] means use 0 to 3

    docker run -d --name {container_image} --memory "200mb" --cpuset-cpus 0-3 ngnix:alpine

#### Create image from the container

    docker commit {container_id} {imageName}:{tag_name}

#### Temporary container

    Once exit from bash container will get destroy.

    docker run --rm -ti ubuntu bash

## RUN

Use to install application

    FROM ubuntu
    RUN apt-get install git

## CMD

Command to execute

    From ubuntu
    RUN apt-get install nginx
    ngnixctl -DFOREGROUND

The process must be `foregroud`, otherwise the docker will exit.
If there is no `foreground` process then use the following command `ti` (terminal) to keep alive for debug

    docker run -d -ti --name {Container_name} -p {PORT:PORT} {image}

### Login/Access Container

    docker exec -ti {containerName} bash
